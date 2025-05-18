const express = require('express');
const router = express.Router();
const nutritionController = require('../controllers/nutritionController');
const auth = require('../middleware/auth');  // Middleware autentikasi

// Rute untuk menambah data gizi siswa
router.post('/add', auth, nutritionController.createNutrition);

// Rute untuk mengambil data gizi siswa berdasarkan studentId
router.get('/:studentId', auth, nutritionController.getNutritionByStudentId);

// Rute untuk memperbarui data gizi siswa
router.put('/:nutritionId', auth, nutritionController.updateNutrition);

// Rute untuk menghapus data gizi siswa
router.delete('/:nutritionId', auth, nutritionController.deleteNutrition);

module.exports = router;
