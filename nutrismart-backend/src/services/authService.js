const jwt = require('jsonwebtoken');
const { JWT_SECRET, JWT_EXPIRES_IN } = require('../config/.env');
const { db } = require('../config/firebase');
const OTPService = require('./emailService'); // OTP Service untuk email
const bcrypt = require('bcryptjs');

class AuthService {
  static async generateJWT(user) {
    const payload = {
      userId: user.userId,
      role: user.role
    };
    const token = jwt.sign(payload, JWT_SECRET, { expiresIn: JWT_EXPIRES_IN });
    return { success: true, token };
  }

  static async verifyJWT(token) {
    try {
      const decoded = jwt.verify(token, JWT_SECRET);
      return { success: true, decoded };
    } catch (error) {
      console.error('Error verifying JWT:', error);
      return { success: false, error: 'Token is invalid or expired' };
    }
  }

  static async sendOTP(email) {
    // Mengirim OTP ke email pengguna
    const otp = Math.floor(100000 + Math.random() * 900000); // OTP 6 digit
    await OTPService.sendEmail(email, otp);
    return { success: true, otp }; // OTP disimpan sementara untuk verifikasi
  }

  static async verifyOTP(inputOtp, storedOtp) {
    if (inputOtp === storedOtp) {
      return { success: true, message: 'OTP Verified' };
    } else {
      return { success: false, error: 'Invalid OTP' };
    }
  }

  static async validatePassword(userId, password) {
    const userRef = await db.collection('users').doc(userId).get();
    if (!userRef.exists) return { success: false, error: 'User not found' };

    const user = userRef.data();
    const isMatch = await bcrypt.compare(password, user.password);
    if (isMatch) {
      return { success: true };
    } else {
      return { success: false, error: 'Incorrect password' };
    }
  }
}

module.exports = AuthService;
