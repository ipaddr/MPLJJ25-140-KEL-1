const { USER_ROLES } = require('../config/constants');

// Middleware untuk memeriksa peran pengguna
const roleCheck = (role) => {
  return (req, res, next) => {
    if (req.user?.role !== role) {
      return res.status(403).json({ success: false, message: 'Akses ditolak, peran tidak sesuai' });
    }
    next(); // Melanjutkan ke route selanjutnya jika role cocok
  };
};

module.exports = roleCheck;
