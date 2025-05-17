const Attendance = require('../models/Attendance');  // Model untuk absensi
const VisionService = require('../services/visionService');  // Layanan untuk deteksi wajah

// Menambah data absensi siswa
exports.createAttendance = async (req, res) => {
  const { studentId, status, image } = req.body;  // image adalah gambar siswa (base64 encoded atau URL)
  try {
    // Deteksi wajah dari gambar
    const faceDetectionResult = await VisionService.detectFace(image);
    if (!faceDetectionResult.success) {
      return res.status(400).json({ success: false, message: 'Tidak ada wajah yang terdeteksi' });
    }

    // Jika wajah terdeteksi, simpan data absensi
    const attendance = new Attendance({
      studentId,
      status,  // status: 'present', 'absent', or 'late'
      image,   // Gambar siswa
    });

    await attendance.save();
    return res.status(201).json({
      success: true,
      message: 'Absensi berhasil dicatat',
      attendanceId: attendance.attendanceId
    });
  } catch (error) {
    console.error('Error creating attendance:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Mengambil data absensi berdasarkan studentId
exports.getAttendanceByStudentId = async (req, res) => {
  const { studentId } = req.params;
  try {
    const attendance = await Attendance.findByStudentId(studentId);
    if (!attendance) {
      return res.status(404).json({ success: false, message: 'Absensi tidak ditemukan' });
    }

    return res.status(200).json({
      success: true,
      data: attendance
    });
  } catch (error) {
    console.error('Error fetching attendance:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Mengambil semua data absensi (untuk laporan harian misalnya)
exports.getAllAttendance = async (req, res) => {
  try {
    const attendanceRecords = await Attendance.findAll();
    return res.status(200).json({
      success: true,
      data: attendanceRecords
    });
  } catch (error) {
    console.error('Error fetching all attendance records:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};
