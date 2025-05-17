const express = require('express');
const router = express.Router();
const StudentController = require('../controllers/studentController');

// Rute untuk menambah siswa baru
router.post('/add', StudentController.createStudent);

// Rute untuk mengambil data siswa berdasarkan ID
router.get('/:studentId', StudentController.getStudentById);

// Rute untuk memperbarui data siswa
router.put('/:studentId', StudentController.updateStudent);

// Rute untuk menghapus siswa
router.delete('/:studentId', StudentController.deleteStudent);

module.exports = router;
