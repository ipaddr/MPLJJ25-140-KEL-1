const FoodDistribution = require('../models/FoodDistribution');  // Model untuk distribusi makanan
const School = require('../models/School'); // Model untuk data sekolah

// Menjadwalkan distribusi makanan
exports.createFoodDistribution = async (req, res) => {
  const { school, distributionDate, foodItems, status } = req.body;
  try {
    // Pastikan sekolah terdaftar
    const schoolRecord = await School.findByName(school);
    if (!schoolRecord) {
      return res.status(404).json({ success: false, message: 'Sekolah tidak ditemukan' });
    }

    // Buat catatan distribusi makanan
    const foodDistribution = new FoodDistribution({
      school,
      distributionDate,
      foodItems,
      status
    });

    await foodDistribution.save();
    return res.status(201).json({
      success: true,
      message: 'Distribusi makanan berhasil dijadwalkan',
      distributionId: foodDistribution.distributionId
    });
  } catch (error) {
    console.error('Error scheduling food distribution:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Mengambil data distribusi makanan berdasarkan sekolah
exports.getFoodDistributionBySchool = async (req, res) => {
  const { school } = req.params;
  try {
    const distributions = await FoodDistribution.findBySchool(school);
    if (!distributions || distributions.length === 0) {
      return res.status(404).json({ success: false, message: 'Tidak ada distribusi makanan ditemukan untuk sekolah ini' });
    }

    return res.status(200).json({
      success: true,
      data: distributions
    });
  } catch (error) {
    console.error('Error fetching food distribution data:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Mengambil semua data distribusi makanan
exports.getAllFoodDistributions = async (req, res) => {
  try {
    const distributions = await FoodDistribution.findAll();
    return res.status(200).json({
      success: true,
      data: distributions
    });
  } catch (error) {
    console.error('Error fetching all food distribution records:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};
