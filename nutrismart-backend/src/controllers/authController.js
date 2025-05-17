const AuthService = require('../services/authService');  // Layanan autentikasi
const User = require('../models/User');  // Model User
const OTPService = require('../services/emailService');  // Layanan untuk mengirim OTP
const bcrypt = require('bcryptjs');

// Register untuk Admin dan Guru
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

// Kirim OTP untuk verifikasi
exports.sendOTP = async (req, res) => {
  const { email } = req.body;
  try {
    const user = await User.findByEmail(email);
    if (!user) {
      return res.status(404).json({ success: false, message: 'Pengguna tidak ditemukan' });
    }

    const otp = Math.floor(100000 + Math.random() * 900000); // Generate OTP 6 digit
    await OTPService.sendEmail(email, otp);  // Kirim OTP melalui email
    return res.status(200).json({
      success: true,
      message: 'OTP telah dikirim ke email Anda',
      otp // OTP disimpan sementara untuk verifikasi di frontend
    });
  } catch (error) {
    console.error('Error during OTP sending:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Verifikasi OTP untuk reset password
exports.verifyOTP = async (req, res) => {
  const { email, otp } = req.body;
  try {
    // Cek apakah OTP valid
    const storedOtp = req.app.locals.otp; // OTP yang disimpan sementara (gunakan mekanisme penyimpanan yang lebih aman)
    if (otp === storedOtp) {
      return res.status(200).json({ success: true, message: 'OTP valid' });
    } else {
      return res.status(400).json({ success: false, message: 'OTP tidak valid' });
    }
  } catch (error) {
    console.error('Error during OTP verification:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Reset password
exports.resetPassword = async (req, res) => {
  const { email, newPassword } = req.body;
  try {
    const user = await User.findByEmail(email);
    if (!user) {
      return res.status(404).json({ success: false, message: 'Pengguna tidak ditemukan' });
    }

    // Hash password baru
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(newPassword, salt);
    
    // Update password di Firestore
    await User.updateUser(user.userId, { password: hashedPassword });

    return res.status(200).json({ success: true, message: 'Password berhasil direset' });
  } catch (error) {
    console.error('Error during password reset:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};
