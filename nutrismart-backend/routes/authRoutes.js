const express = require('express');
const { registerUser, loginUser, generateOtp, verifyOtp } = require('../controllers/authController');
const router = express.Router();

// Route untuk register pengguna (admin/guru)
router.post('/register', registerUser);

// Route untuk login pengguna (admin/guru)
router.post('/login', loginUser);

// Route untuk generate OTP (hanya admin)
router.post('/generate-otp', generateOtp);

// Route untuk verifikasi OTP (hanya admin)
router.post('/verify-otp', verifyOtp);

module.exports = router;
