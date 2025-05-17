const express = require('express');
const router = express.Router();
const distributionController = require('../controllers/distributionController');
const auth = require('../middleware/auth');  // Middleware autentikasi
const roleCheck = require('../middleware/roleCheck');  // Middleware pengecekan peran

// Rute untuk menjadwalkan distribusi makanan
router.post('/add', auth, roleCheck('admin'), distributionController.createFoodDistribution);

// Rute untuk mengambil data distribusi makanan berdasarkan nama sekolah
router.get('/:school', auth, distributionController.getFoodDistributionBySchool);

// Rute untuk mengambil semua data distribusi makanan
router.get('/', auth, distributionController.getAllFoodDistributions);

module.exports = router;
