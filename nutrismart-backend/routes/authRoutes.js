const express = require('express');
const { registerUser, loginUser, generateOtp, verifyOtp } = require('../controllers/authController');
const { validateRegister, validateLogin, validate } = require('../middleware/validation');
const router = express.Router();

// Route untuk register pengguna (guru/admin)
router.post('/register', validateRegister, validate, registerUser);

// Route untuk login pengguna (guru/admin)
router.post('/login', validateLogin, validate, loginUser);

// Route untuk generate OTP (hanya admin)
router.post('/generate-otp', generateOtp);

// Route untuk verifikasi OTP (hanya admin)
router.post('/verify-otp', verifyOtp);

module.exports = router;
