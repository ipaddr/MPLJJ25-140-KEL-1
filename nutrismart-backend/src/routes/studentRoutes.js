const express = require('express');
const router = express.Router();
const studentController = require('../controllers/studentController');
const auth = require('../middleware/auth');  // Middleware autentikasi
const roleCheck = require('../middleware/roleCheck');  // Middleware pengecekan peran

// Rute untuk menambah siswa baru
router.post('/add', auth, roleCheck('guru'), studentController.createStudent);

// Rute untuk mengambil data siswa berdasarkan ID
router.get('/:studentId', auth, studentController.getStudentById);

// Rute untuk mengambil semua siswa
router.get('/', auth, studentController.getAllStudents);

// Rute untuk memperbarui data siswa
router.put('/:studentId', auth, roleCheck('guru'), studentController.updateStudent);

// Rute untuk menghapus siswa
router.delete('/:studentId', auth, roleCheck('admin'), studentController.deleteStudent);

module.exports = router;
