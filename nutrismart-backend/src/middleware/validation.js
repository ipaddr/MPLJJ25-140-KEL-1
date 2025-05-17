// Middleware untuk validasi input
const validateCreateUser = (req, res, next) => {
  const { email, password, role, name, phoneNumber } = req.body;

  if (!email || !password || !role || !name || !phoneNumber) {
    return res.status(400).json({ success: false, message: 'Semua field harus diisi' });
  }

  if (password.length < 6) {
    return res.status(400).json({ success: false, message: 'Password minimal 6 karakter' });
  }

  next(); // Melanjutkan ke route selanjutnya jika valid
};

module.exports = { validateCreateUser };
