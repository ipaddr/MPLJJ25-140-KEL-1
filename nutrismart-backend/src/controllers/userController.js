const User = require('../models/User');

// Membuat pengguna baru (admin/guru)
exports.createUser = async (req, res) => {
  const { email, password, role, name, phoneNumber, nik, address, school } = req.body;
  try {
    const user = new User({
      email,
      password,
      role,
      name,
      phoneNumber,
      nik,
      address,
      school
    });

    await user.save();
    return res.status(201).json({
      success: true,
      message: 'User berhasil dibuat!',
      userId: user.userId
    });
  } catch (error) {
    console.error('Error creating user:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Mengambil data pengguna berdasarkan ID
exports.getUserById = async (req, res) => {
  const { userId } = req.params;
  try {
    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ success: false, message: 'User tidak ditemukan' });
    }

    return res.status(200).json({
      success: true,
      data: user
    });
  } catch (error) {
    console.error('Error getting user:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Memperbarui data pengguna
exports.updateUser = async (req, res) => {
  const { userId } = req.params;
  const { name, phoneNumber, address, school } = req.body;
  try {
    await User.updateUser(userId, { name, phoneNumber, address, school });
    return res.status(200).json({
      success: true,
      message: 'User berhasil diperbarui'
    });
  } catch (error) {
    console.error('Error updating user:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Menghapus pengguna
exports.deleteUser = async (req, res) => {
  const { userId } = req.params;
  try {
    await User.deleteUser(userId);
    return res.status(200).json({
      success: true,
      message: 'User berhasil dihapus'
    });
  } catch (error) {
    console.error('Error deleting user:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};
