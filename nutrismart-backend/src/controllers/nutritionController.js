const Nutrition = require('../models/Nutrition');  // Model untuk data gizi siswa
const Student = require('../models/Student');      // Model untuk data siswa

// Pencatatan data gizi siswa
exports.createNutrition = async (req, res) => {
  const { studentId, weight, height } = req.body;

  try {
    // Pastikan siswa ada
    const student = await Student.findById(studentId);
    if (!student) {
      return res.status(404).json({ success: false, message: 'Siswa tidak ditemukan' });
    }

    // Hitung IMT (Indeks Massa Tubuh)
    const imt = (weight / (height * height)) * 10000;  // IMT = Berat badan (kg) / Tinggi badan (m)²

    // Tentukan status gizi berdasarkan IMT
    let status = 'normal';
    if (imt < 18.5) {
      status = 'underweight';
    } else if (imt >= 25) {
      status = 'overweight';
    } else if (imt >= 30) {
      status = 'obese';
    }

    const nutrition = new Nutrition({
      studentId,
      weight,
      height,
      imT: imt,
      status,
    });

    await nutrition.save();
    return res.status(201).json({
      success: true,
      message: 'Data gizi berhasil dicatat',
      nutritionId: nutrition.nutritionId,
    });
  } catch (error) {
    console.error('Error creating nutrition data:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Mengambil data gizi siswa berdasarkan studentId
exports.getNutritionByStudentId = async (req, res) => {
  const { studentId } = req.params;

  try {
    const nutrition = await Nutrition.findByStudentId(studentId);
    if (!nutrition) {
      return res.status(404).json({ success: false, message: 'Data gizi tidak ditemukan' });
    }

    return res.status(200).json({
      success: true,
      data: nutrition
    });
  } catch (error) {
    console.error('Error fetching nutrition data:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Memperbarui data gizi siswa
exports.updateNutrition = async (req, res) => {
  const { nutritionId } = req.params;
  const { weight, height } = req.body;

  try {
    const nutrition = await Nutrition.findById(nutritionId);
    if (!nutrition) {
      return res.status(404).json({ success: false, message: 'Data gizi tidak ditemukan' });
    }

    // Hitung IMT dan status gizi baru
    const imt = (weight / (height * height)) * 10000;
    let status = 'normal';
    if (imt < 18.5) {
      status = 'underweight';
    } else if (imt >= 25 && imt < 30) {
      status = 'overweight';
    } else if (imt >= 30) {
      status = 'obese';
    }

    await Nutrition.updateNutrition(nutritionId, {
      weight,
      height,
      imT: imt,
      status,
    });

    return res.status(200).json({
      success: true,
      message: 'Data gizi berhasil diperbarui',
    });
  } catch (error) {
    console.error('Error updating nutrition data:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Menghapus data gizi siswa
exports.deleteNutrition = async (req, res) => {
  const { nutritionId } = req.params;

  try {
    const nutrition = await Nutrition.findById(nutritionId);
    if (!nutrition) {
      return res.status(404).json({ success: false, message: 'Data gizi tidak ditemukan' });
    }

    await Nutrition.deleteNutrition(nutritionId);
    return res.status(200).json({
      success: true,
      message: 'Data gizi berhasil dihapus'
    });
  } catch (error) {
    console.error('Error deleting nutrition data:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};
