const redis = require('redis');
const AuthService = require('../services/authService');  // Layanan autentikasi
const { db } = require('../config/firebase');
const bcrypt = require('bcryptjs');
const User = require('../models/User');
const OTPService = require('../services/OTPService');

// Storage for OTP
const registrationOtpStore = new Map();
const passwordResetOtpStore = new Map();

// Login untuk Admin dan Guru
exports.login = async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.findByEmail(email);
    if (!user || !(await user.comparePassword(password))) {
      return res.status(401).json({ success: false, message: 'Email atau password salah' });
    }

    const token = await AuthService.generateJWT(user);
    return res.status(200).json({
      success: true,
      message: 'Login berhasil!',
      token
    });
  } catch (error) {
    console.error('Error during login:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Register pengguna (Admin dan Guru)
exports.register = async (req, res) => {
  const { email, password, role, name, phoneNumber, nik, address, school } = req.body;
  try {
    // Pastikan email belum terdaftar
    const existingUser = await User.findByEmail(email);
    if (existingUser) {
      return res.status(400).json({ success: false, message: 'Email sudah terdaftar' });
    }

    const user = new User({
      email,
      password,
      role,
      name,
      phoneNumber,
      nik,
      address,
      school
    });

    await user.save();
    return res.status(201).json({
      success: true,
      message: 'Registrasi berhasil!',
      userId: user.userId
    });
  } catch (error) {
    console.error('Error during registration:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Send OTP for registration
exports.sendRegistrationOTP = async (req, res) => {
  const { email } = req.body;
  try {
    // Cek email di Firestore
    const userSnapshot = await db.collection('users')
      .where('email', '==', email)
      .get();

    if (!userSnapshot.empty) {
      return res.status(400).json({
        success: false,
        message: 'Email sudah terdaftar, silakan gunakan email lain'
      });
    }

    // Generate OTP
    const otp = Math.floor(100000 + Math.random() * 900000).toString();
    const otpExpiryTime = Date.now() + (10 * 60 * 1000);

    // Simpan OTP
    registrationOtpStore.set(email, { 
      otp, 
      expiry: otpExpiryTime,
      attempts: 0 // Tambah counter untuk batasi percobaan
    });

    // Kirim email
    const emailResult = await OTPService.sendEmail(email, otp, 'registration');
    
    if (!emailResult.success) {
      throw new Error('Gagal mengirim email OTP');
    }

    return res.status(200).json({
      success: true,
      message: 'OTP untuk pendaftaran telah dikirim ke email Anda',
      otp // Hanya untuk testing
    });

  } catch (error) {
    console.error('Error sending registration OTP:', error);
    return res.status(500).json({ 
      success: false, 
      message: error.message || 'Terjadi kesalahan saat mengirim OTP'
    });
  }
};

// Send OTP for password reset
exports.sendPasswordResetOTP = async (req, res) => {
  const { email } = req.body;
  try {
    const userSnapshot = await db.collection('users')
      .where('email', '==', email)
      .get();

    if (userSnapshot.empty) {
      return res.status(404).json({
        success: false,
        message: 'Pengguna tidak ditemukan'
      });
    }

    const otp = Math.floor(100000 + Math.random() * 900000).toString();
    const otpExpiryTime = Date.now() + (10 * 60 * 1000);

    passwordResetOtpStore.set(email, { otp, expiry: otpExpiryTime });

    setTimeout(() => {
      passwordResetOtpStore.delete(email);
    }, 10 * 60 * 1000);

    await OTPService.sendEmail(email, otp, 'reset');

    return res.status(200).json({
      success: true,
      message: 'OTP untuk reset password telah dikirim ke email Anda',
      otp // For testing only
    });
  } catch (error) {
    console.error('Error sending password reset OTP:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Verify OTP with type
exports.verifyOTP = async (req, res) => {
  const { email, otp, type } = req.body;
  try {
    const otpStore = type === 'registration' ? registrationOtpStore : passwordResetOtpStore;
    const storedOtpData = otpStore.get(email);

    if (!storedOtpData) {
      return res.status(400).json({
        success: false,
        message: 'OTP telah kedaluwarsa atau tidak ditemukan'
      });
    }

    const receivedOtp = otp.toString().trim();
    const storedOtp = storedOtpData.otp.toString().trim();

    if (receivedOtp === storedOtp && Date.now() < storedOtpData.expiry) {
      otpStore.delete(email);
      return res.status(200).json({
        success: true,
        message: 'OTP valid',
        type
      });
    }

    return res.status(400).json({
      success: false,
      message: 'OTP tidak valid'
    });
  } catch (error) {
    console.error('Error during OTP verification:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Reset password
exports.resetPassword = async (req, res) => {
  const { email, newPassword } = req.body;
  try {
    const userSnapshot = await db.collection('users')
      .where('email', '==', email)
      .get();

    if (userSnapshot.empty) {
      return res.status(404).json({
        success: false,
        message: 'Pengguna tidak ditemukan'
      });
    }

    const userDoc = userSnapshot.docs[0];
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(newPassword, salt);

    await userDoc.ref.update({
      password: hashedPassword
    });

    return res.status(200).json({
      success: true,
      message: 'Password berhasil direset'
    });
  } catch (error) {
    console.error('Error during password reset:', error);
    return res.status(500).json({
      success: false,
      message: 'Terjadi kesalahan saat mereset password'
    });
  }
};
