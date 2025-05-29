const express = require('express');
const router = express.Router();
const AuthController = require('../controllers/authController');
const { validateCreateUser } = require('../middleware/validation');

// Authentication routes
router.post('/login', AuthController.login);
router.post('/register', validateCreateUser, AuthController.register);

// OTP routes
router.post('/send-registration-otp', AuthController.sendRegistrationOTP);
router.post('/send-reset-otp', AuthController.sendPasswordResetOTP);
router.post('/verify-otp', AuthController.verifyOTP);

// Password reset
router.post('/reset-password', AuthController.resetPassword);

module.exports = router;
