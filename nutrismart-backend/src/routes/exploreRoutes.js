const express = require('express');
const router = express.Router();
const ExploreController = require('../controllers/exploreController');

// Rute untuk menambah konten edukasi (artikel/video)
router.post('/add', ExploreController.createExploreContent);

// Rute untuk mengambil seluruh konten edukasi
router.get('/', ExploreController.getExploreContent);

module.exports = router;
