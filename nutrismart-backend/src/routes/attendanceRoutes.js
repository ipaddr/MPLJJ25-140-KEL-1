const express = require('express');
const router = express.Router();
const AttendanceController = require('../controllers/attendanceController');

// Rute untuk menambah data absensi siswa
router.post('/add', AttendanceController.createAttendance);

// Rute untuk mengambil data absensi siswa berdasarkan ID
router.get('/:studentId', AttendanceController.getAttendanceByStudentId);

module.exports = router;
