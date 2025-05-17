const express = require('express');
const router = express.Router();
const AuthController = require('../controllers/authController');

// Rute untuk registrasi pengguna
router.post('/register', AuthController.register);

// Rute untuk login pengguna
router.post('/login', AuthController.login);

// Rute untuk mengirim OTP ke email
router.post('/send-otp', AuthController.sendOTP);

// Rute untuk memverifikasi OTP
router.post('/verify-otp', AuthController.verifyOTP);

// Rute untuk reset password
router.post('/reset-password', AuthController.resetPassword);

module.exports = router;
