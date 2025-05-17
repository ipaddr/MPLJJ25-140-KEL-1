const express = require('express');
const router = express.Router();
const attendanceController = require('../controllers/attendanceController');
const auth = require('../middleware/auth');  // Middleware autentikasi

// Rute untuk menambah absensi siswa
router.post('/add', auth, attendanceController.createAttendance);

// Rute untuk mengambil data absensi siswa berdasarkan studentId
router.get('/:studentId', auth, attendanceController.getAttendanceByStudentId);

// Rute untuk mengambil semua data absensi
router.get('/', auth, attendanceController.getAllAttendance);

module.exports = router;
