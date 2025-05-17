const express = require('express');
const router = express.Router();
const NutritionController = require('../controllers/nutritionController');

// Rute untuk menambah data gizi siswa
router.post('/add', NutritionController.createNutrition);

// Rute untuk mengambil data gizi siswa berdasarkan ID
router.get('/:studentId', NutritionController.getNutritionByStudentId);

// Rute untuk memperbarui data gizi
router.put('/:nutritionId', NutritionController.updateNutrition);

// Rute untuk menghapus data gizi
router.delete('/:nutritionId', NutritionController.deleteNutrition);

module.exports = router;
