/**
 * File untuk menyimpan konstanta yang digunakan di seluruh aplikasi
 */

// Role user
exports.USER_ROLES = {
  ADMIN: 'admin',
  GURU: 'guru'
};

// Status siswa
exports.STUDENT_STATUS = {
  ACTIVE: 'active',
  GRADUATED: 'graduated',
  INACTIVE: 'inactive'
};

// Status gizi
exports.NUTRITION_STATUS = {
  UNDERWEIGHT: 'underweight',
  NORMAL: 'normal',
  OVERWEIGHT: 'overweight',
  OBESE: 'obese'
};

// Status absensi
exports.ATTENDANCE_STATUS = {
  PRESENT: 'present',
  ABSENT: 'absent',
  LATE: 'late'
};

// Status distribusi makanan
exports.DISTRIBUTION_STATUS = {
  PENDING: 'pending',
  COMPLETED: 'completed',
  CANCELLED: 'cancelled'
};

// Tipe konten explore
exports.EXPLORE_CONTENT_TYPE = {
  VIDEO: 'video',
  ARTICLE: 'article'
};

// Response messages
exports.RESPONSE_MESSAGES = {
  // Auth messages
  AUTH: {
    REGISTER_SUCCESS: 'Registrasi berhasil',
    LOGIN_SUCCESS: 'Login berhasil',
    OTP_SENT: 'OTP telah dikirim ke email Anda',
    OTP_VERIFIED: 'OTP berhasil diverifikasi',
    OTP_INVALID: 'OTP tidak valid atau sudah kedaluwarsa',
    RESET_PASSWORD_SUCCESS: 'Password berhasil direset',
    UNAUTHORIZED: 'Tidak memiliki akses',
    INVALID_CREDENTIALS: 'Email/NIK/No Telepon atau password tidak valid'
  },
  // User messages
  USER: {
    CREATED: 'User berhasil dibuat',
    UPDATED: 'User berhasil diperbarui',
    DELETED: 'User berhasil dihapus',
    NOT_FOUND: 'User tidak ditemukan'
  },
  // Student messages
  STUDENT: {
    CREATED: 'Siswa berhasil dibuat',
    UPDATED: 'Data siswa berhasil diperbarui',
    DELETED: 'Siswa berhasil dihapus',
    NOT_FOUND: 'Siswa tidak ditemukan'
  },
  // Nutrition messages
  NUTRITION: {
    CREATED: 'Data gizi berhasil dibuat',
    UPDATED: 'Data gizi berhasil diperbarui',
    DELETED: 'Data gizi berhasil dihapus',
    NOT_FOUND: 'Data gizi tidak ditemukan'
  },
  // Attendance messages
  ATTENDANCE: {
    CREATED: 'Absensi berhasil dicatat',
    UPDATED: 'Absensi berhasil diperbarui',
    DELETED: 'Absensi berhasil dihapus',
    NOT_FOUND: 'Absensi tidak ditemukan'
  },
  // Distribution messages
  DISTRIBUTION: {
    CREATED: 'Distribusi makanan berhasil dicatat',
    UPDATED: 'Distribusi makanan berhasil diperbarui',
    DELETED: 'Distribusi makanan berhasil dihapus',
    NOT_FOUND: 'Distribusi makanan tidak ditemukan'
  },
  // Explore messages
  EXPLORE: {
    CREATED: 'Konten explore berhasil dibuat',
    UPDATED: 'Konten explore berhasil diperbarui',
    DELETED: 'Konten explore berhasil dihapus',
    NOT_FOUND: 'Konten explore tidak ditemukan'
  }
};