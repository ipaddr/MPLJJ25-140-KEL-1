const express = require('express');
const router = express.Router();
const UserController = require('../controllers/userController');

// Rute untuk menambah pengguna baru (admin/guru)
router.post('/add', UserController.createUser);

// Rute untuk mengambil data pengguna berdasarkan ID
router.get('/:userId', UserController.getUserById);

// Rute untuk memperbarui data pengguna
router.put('/:userId', UserController.updateUser);

// Rute untuk menghapus pengguna
router.delete('/:userId', UserController.deleteUser);

module.exports = router;
