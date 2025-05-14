const express = require('express');
const { getStats, getSiswaData, getGuruData } = require('../controllers/adminController');
const router = express.Router();

// Endpoint untuk mengambil statistik admin
router.get('/stats', getStats);

// Endpoint untuk mengambil data siswa
router.get('/data/siswa', getSiswaData);

// Endpoint untuk mengambil data guru
router.get('/data/guru', getGuruData);

module.exports = router;
