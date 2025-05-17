const express = require('express');
const router = express.Router();
const School = require('../models/School');
const auth = require('../middleware/auth');  // Middleware autentikasi
const roleCheck = require('../middleware/roleCheck');  // Middleware pengecekan peran

// Rute untuk menambah sekolah baru
router.post('/add', auth, roleCheck('admin'), async (req, res) => {
  const { name, address, contactNumber, email } = req.body;

  try {
    const school = new School({ name, address, contactNumber, email });
    await school.save();
    return res.status(201).json({ success: true, message: 'Sekolah berhasil ditambahkan', schoolId: school.schoolId });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

// Rute untuk mencari sekolah berdasarkan nama
router.get('/:name', auth, async (req, res) => {
  const { name } = req.params;

  try {
    const school = await School.findByName(name);
    if (!school) {
      return res.status(404).json({ success: false, message: 'Sekolah tidak ditemukan' });
    }
    return res.status(200).json({ success: true, data: school });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

// Rute untuk menghapus sekolah berdasarkan ID
router.delete('/:schoolId', auth, roleCheck('admin'), async (req, res) => {
  const { schoolId } = req.params;

  try {
    const school = await School.findById(schoolId);
    if (!school) {
      return res.status(404).json({ success: false, message: 'Sekolah tidak ditemukan' });
    }

    await School.delete(schoolId);
    return res.status(200).json({ success: true, message: 'Sekolah berhasil dihapus' });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

module.exports = router;
