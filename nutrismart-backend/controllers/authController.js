const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const otpGenerator = require('otp-generator');
const User = require('../models/User');
const sendOtpEmail = require('../config/nodemailer'); // Import Nodemailer

// Fungsi untuk register pengguna (guru/admin)
const registerUser = async (req, res) => {
    const { email, password, name, phoneNumber, nik, address, school, role } = req.body;

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
            phoneNumber,
            nik,
            address,
            school,
            role: role || 'guru',  // Default role: guru
            otpVerified: false,
            createdAt: new Date()
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

        // Generate JWT token
        const token = jwt.sign({ userId: userSnapshot.docs[0].id, role: user.role }, process.env.JWT_SECRET, { expiresIn: '1h' });

        res.status(200).json({ message: 'Login berhasil', token });
    } catch (error) {
        res.status(500).json({ message: 'Terjadi kesalahan pada server', error });
    }
};

// Fungsi untuk generate OTP (hanya untuk admin)
const generateOtp = async (req, res) => {
    const { email } = req.body;

    try {
        // Cek apakah email admin atau guru
        const userSnapshot = await User.where('email', '==', email).get();
        if (userSnapshot.empty) {
            return res.status(404).json({ message: 'Pengguna tidak ditemukan' });
        }

        const user = userSnapshot.docs[0].data();
        const otp = otpGenerator.generate(6, { digits: true, upperCaseAlphabets: false, specialChars: false });
        const userId = userSnapshot.docs[0].id;

        // Simpan OTP di Firestore
        await User.doc(userId).update({
            otp,
            otpExpires: new Date().getTime() + 5 * 60 * 1000 // OTP berlaku selama 5 menit
        });

        // Kirim OTP ke email pengguna
        sendOtpEmail(email, otp);  // Mengirimkan OTP ke email pengguna

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
        if (userSnapshot.empty) {
            return res.status(404).json({ message: 'Pengguna tidak ditemukan' });
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
            otp: null,
            otpExpires: null
        });

        res.status(200).json({ message: 'OTP berhasil diverifikasi' });
    } catch (error) {
        res.status(500).json({ message: 'Terjadi kesalahan pada server', error });
    }
};

module.exports = { registerUser, loginUser, generateOtp, verifyOtp };
