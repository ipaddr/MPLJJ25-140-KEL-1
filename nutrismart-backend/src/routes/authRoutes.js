const express = require('express');
const router = express.Router();
const AuthController = require('../controllers/authController');
const auth = require('../middleware/auth');  // Middleware untuk autentikasi
const { validateCreateUser } = require('../middleware/validation');  // Middleware untuk validasi input

// Rute untuk login
router.post('/login', AuthController.login);

// Rute untuk registrasi pengguna (admin/guru)
router.post('/register', validateCreateUser, AuthController.register);

// Rute untuk mengirim OTP ke email pengguna
router.post('/send-otp', AuthController.sendOTP);

// Rute untuk memverifikasi OTP (gunakan middleware auth jika perlu)
router.post('/verify-otp', auth, AuthController.verifyOTP);

// Rute untuk reset password
router.post('/reset-password', AuthController.resetPassword);

module.exports = router;
