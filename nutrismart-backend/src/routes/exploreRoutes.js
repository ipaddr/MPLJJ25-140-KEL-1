const express = require('express');
const router = express.Router();
const exploreController = require('../controllers/exploreController');
const auth = require('../middleware/auth');  // Middleware autentikasi
const roleCheck = require('../middleware/roleCheck');  // Middleware pengecekan peran

// Rute untuk menambah konten edukasi (artikel/video)
router.post('/add', auth, roleCheck('admin'), exploreController.createExploreContent);

// Rute untuk mengambil seluruh konten edukasi
router.get('/', auth, exploreController.getExploreContent);

// Rute untuk mengambil konten edukasi berdasarkan ID
router.get('/:id', auth, exploreController.getExploreContentById);

// Rute untuk memperbarui konten edukasi berdasarkan ID
router.put('/:id', auth, roleCheck('admin'), exploreController.updateExploreContent);

// Rute untuk menghapus konten edukasi berdasarkan ID
router.delete('/:id', auth, roleCheck('admin'), exploreController.deleteExploreContent);

module.exports = router;
