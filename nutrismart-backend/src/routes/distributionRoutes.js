const express = require('express');
const router = express.Router();
const DistributionController = require('../controllers/distributionController');

// Rute untuk menambah distribusi makanan
router.post('/add', DistributionController.createFoodDistribution);

// Rute untuk mengambil distribusi makanan berdasarkan sekolah
router.get('/:school', DistributionController.getFoodDistributionBySchool);

module.exports = router;
