const { body, validationResult } = require('express-validator');

// Validasi untuk register
const validateRegister = [
    body('email').isEmail().withMessage('Email tidak valid'),
    body('password').isLength({ min: 6 }).withMessage('Password harus minimal 6 karakter'),
    body('name').notEmpty().withMessage('Nama tidak boleh kosong'),
    body('role').optional().isIn(['guru', 'admin']).withMessage('Role tidak valid'),
];

// Validasi untuk login
const validateLogin = [
    body('email').isEmail().withMessage('Email tidak valid'),
    body('password').notEmpty().withMessage('Password tidak boleh kosong'),
];

// Middleware untuk validasi
const validate = (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
    }
    next();
};

module.exports = { validateRegister, validateLogin, validate };
