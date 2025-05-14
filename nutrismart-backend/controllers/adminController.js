const User = require('../models/User');
const FoodDistribution = require('../models/FoodDistribution');  

// Fungsi untuk mengambil statistik admin
const getStats = async (req, res) => {
    try {
        // Hitung jumlah siswa dan guru
        const students = await User.where('role', '==', 'guru').get();
        const teachers = await User.where('role', '==', 'siswa').get();
        
        // Hitung jumlah distribusi makanan
        const foodDistribution = await FoodDistribution.get();

        res.status(200).json({
            totalStudents: students.size,
            totalTeachers: teachers.size,
            totalFoodDistribution: foodDistribution.size
        });
    } catch (error) {
        res.status(500).json({ message: 'Terjadi kesalahan pada server', error });
    }
};

// Fungsi untuk mengambil data siswa
const getSiswaData = async (req, res) => {
    try {
        const siswaData = await User.where('role', '==', 'siswa').get();
        const siswaList = siswaData.docs.map(doc => doc.data());

        res.status(200).json(siswaList);
    } catch (error) {
        res.status(500).json({ message: 'Terjadi kesalahan saat mengambil data siswa', error });
    }
};

// Fungsi untuk mengambil data guru
const getGuruData = async (req, res) => {
    try {
        const guruData = await User.where('role', '==', 'guru').get();
        const guruList = guruData.docs.map(doc => doc.data());

        res.status(200).json(guruList);
    } catch (error) {
        res.status(500).json({ message: 'Terjadi kesalahan saat mengambil data guru', error });
    }
};

module.exports = { getStats, getSiswaData, getGuruData };
