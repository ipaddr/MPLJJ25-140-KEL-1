const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');
dotenv.config();  // Memuat variabel lingkungan dari file .env

const JWT_SECRET = process.env.JWT_SECRET;
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN;
const OTP_EXPIRES_IN = process.env.OTP_EXPIRES_IN; // Konfigurasi OTP expires

const OTPService = require('./emailService'); // Layanan untuk mengirim OTP

class AuthService {
  // Generate JWT token
  static async generateJWT(user) {
    const payload = {
      userId: user.userId,
      role: user.role
    };

    const token = jwt.sign(payload, JWT_SECRET, { expiresIn: JWT_EXPIRES_IN });
    return token;
  }

  // Verify JWT token
  static async verifyJWT(token) {
    try {
      const decoded = jwt.verify(token, JWT_SECRET);
      return decoded;
    } catch (error) {
      throw new Error('Token tidak valid atau telah kedaluwarsa');
    }
  }

  // Send OTP to email
  static async sendOTP(email) {
    const otp = Math.floor(100000 + Math.random() * 900000); // Generate 6 digit OTP
    await OTPService.sendEmail(email, otp);  // Kirim OTP via email
    return otp; // OTP yang dikirim sementara untuk verifikasi
  }

  // Verify OTP
  static async verifyOTP(inputOtp, storedOtp) {
    if (inputOtp === storedOtp) {
      return { success: true, message: 'OTP valid' };
    } else {
      return { success: false, message: 'OTP tidak valid' };
    }
  }
}

module.exports = AuthService;
