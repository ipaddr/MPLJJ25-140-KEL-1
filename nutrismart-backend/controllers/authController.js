const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const otpGenerator = require('otp-generator');
const User = require('../models/User');  // Pastikan Anda memiliki model User yang sesuai untuk menyimpan data pengguna

// Fungsi untuk register pengguna (guru/admin)
const registerUser = async (req, res) => {
    const { email, password, name, role } = req.body;

    try {
        // Cek apakah email sudah terdaftar
        const existingUser = await User.where('email', '==', email).get();
        if (!existingUser.empty) {
            return res.status(400).json({ message: 'Email sudah terdaftar' });
        }

        // Enkripsi password
        const hashedPassword = await bcrypt.hash(password, 10);

        // Simpan data pengguna di Firestore
        const userRef = await User.add({
            email,
            name,
            password: hashedPassword,
            role: role || 'guru',  // Default role: guru
            otpVerified: false,    // Tambahkan kolom untuk verifikasi OTP
        });

        res.status(201).json({ message: 'User berhasil didaftarkan', userId: userRef.id });
    } catch (error) {
        res.status(500).json({ message: 'Terjadi kesalahan pada server', error });
    }
};

// Fungsi untuk login pengguna (guru/admin)
const loginUser = async (req, res) => {
    const { email, password } = req.body;

    try {
        // Cek apakah email terdaftar
        const userSnapshot = await User.where('email', '==', email).get();
        if (userSnapshot.empty) {
            return res.status(404).json({ message: 'Pengguna tidak ditemukan' });
        }

        const user = userSnapshot.docs[0].data();

        // Bandingkan password yang diberikan dengan yang ada di Firestore
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ message: 'Password salah' });
        }

        // Verifikasi OTP untuk admin
        if (user.role === 'admin' && !user.otpVerified) {
            return res.status(400).json({ message: 'Admin perlu melakukan verifikasi OTP' });
        }

        // Generate JWT token
        const token = jwt.sign(
            { userId: userSnapshot.docs[0].id, role: user.role },
            process.env.JWT_SECRET,
            { expiresIn: '1h' }
        );

        res.status(200).json({ message: 'Login berhasil', token });
    } catch (error) {
        res.status(500).json({ message: 'Terjadi kesalahan pada server', error });
    }
};

// Fungsi untuk generate dan kirim OTP untuk admin
const generateOtp = async (req, res) => {
    const { email } = req.body;

    try {
        // Cek apakah email admin terdaftar
        const userSnapshot = await User.where('email', '==', email).get();
        if (userSnapshot.empty || userSnapshot.docs[0].data().role !== 'admin') {
            return res.status(404).json({ message: 'Admin tidak ditemukan' });
        }

        const otp = otpGenerator.generate(6, { digits: true, upperCaseAlphabets: false, specialChars: false });
        const userId = userSnapshot.docs[0].id;

        // Simpan OTP di Firestore (expired dalam 5 menit)
        await User.doc(userId).update({
            otp,
            otpExpires: new Date().getTime() + 5 * 60 * 1000 // OTP berlaku selama 5 menit
        });

        // Kirim OTP via email (implementasi pengiriman email bisa menggunakan Nodemailer atau platform lain)
        // Implementasi pengiriman email belum dibahas di sini

        res.status(200).json({ message: 'OTP telah dikirim' });
    } catch (error) {
        res.status(500).json({ message: 'Terjadi kesalahan pada server', error });
    }
};

// Fungsi untuk verifikasi OTP
const verifyOtp = async (req, res) => {
    const { email, otp } = req.body;

    try {
        const userSnapshot = await User.where('email', '==', email).get();
        if (userSnapshot.empty || userSnapshot.docs[0].data().role !== 'admin') {
            return res.status(404).json({ message: 'Admin tidak ditemukan' });
        }

        const user = userSnapshot.docs[0].data();
        const currentTime = new Date().getTime();

        // Periksa apakah OTP valid dan belum kadaluarsa
        if (user.otp !== otp || user.otpExpires < currentTime) {
            return res.status(400).json({ message: 'OTP tidak valid atau telah kadaluarsa' });
        }

        // Tandai OTP sebagai terverifikasi
        const userId = userSnapshot.docs[0].id;
        await User.doc(userId).update({
            otpVerified: true,
            otp: null, // Hapus OTP setelah diverifikasi
            otpExpires: null
        });

        res.status(200).json({ message: 'OTP berhasil diverifikasi' });
    } catch (error) {
        res.status(500).json({ message: 'Terjadi kesalahan pada server', error });
    }
};

module.exports = { registerUser, loginUser, generateOtp, verifyOtp };
