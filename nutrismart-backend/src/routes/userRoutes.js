const express = require('express');
const router = express.Router();
const UserController = require('../controllers/userController');
const auth = require('../middleware/auth');  // Middleware autentikasi
const roleCheck = require('../middleware/roleCheck');  // Middleware pengecekan peran

// Rute untuk menambah pengguna baru (admin hanya yang bisa)
router.post('/add', auth, roleCheck('admin'), UserController.createUser);

// Rute untuk mengambil data pengguna berdasarkan ID
router.get('/:userId', auth, UserController.getUserById);

// Rute untuk memperbarui data pengguna
router.put('/:userId', auth, roleCheck('admin'), UserController.updateUser);

// Rute untuk menghapus pengguna
router.delete('/:userId', auth, roleCheck('admin'), UserController.deleteUser);

module.exports = router;
