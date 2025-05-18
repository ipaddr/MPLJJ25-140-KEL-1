const Student = require('../models/Student');  // Model untuk siswa

// Pendaftaran siswa baru
exports.createStudent = async (req, res) => {
  const { fullName, dob, nik, address, school, grade, status } = req.body;
  try {
    // Validasi input siswa
    if (!fullName || !dob || !nik || !address || !school || !grade || !status) {
      return res.status(400).json({ success: false, message: 'Semua field wajib diisi' });
    }

    const student = new Student({
      fullName,
      dob,
      nik,
      address,
      school,
      grade,
      status,
    });

    await student.save();
    return res.status(201).json({
      success: true,
      message: 'Siswa berhasil didaftarkan',
      studentId: student.studentId
    });
  } catch (error) {
    console.error('Error creating student:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Mengambil data siswa berdasarkan ID
exports.getStudentById = async (req, res) => {
  const { studentId } = req.params;
  try {
    const student = await Student.findById(studentId);
    if (!student) {
      return res.status(404).json({ success: false, message: 'Siswa tidak ditemukan' });
    }

    return res.status(200).json({
      success: true,
      data: student
    });
  } catch (error) {
    console.error('Error fetching student:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Mengambil semua siswa atau berdasarkan filter
exports.getAllStudents = async (req, res) => {
  try {
    const filters = req.query;  // Menyaring siswa berdasarkan query params (misal: school, grade)
    const students = await Student.findAll(filters);

    return res.status(200).json({
      success: true,
      data: students
    });
  } catch (error) {
    console.error('Error fetching all students:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Memperbarui data siswa
exports.updateStudent = async (req, res) => {
  const { studentId } = req.params;
  const { fullName, dob, nik, address, school, grade, status } = req.body;
  try {
    const student = await Student.findById(studentId);
    if (!student) {
      return res.status(404).json({ success: false, message: 'Siswa tidak ditemukan' });
    }

    // Memperbarui data siswa
    const updatedStudent = await Student.updateStudent(studentId, {
      fullName,
      dob,
      nik,
      address,
      school,
      grade,
      status,
    });

    return res.status(200).json({
      success: true,
      message: 'Data siswa berhasil diperbarui',
      updatedStudent
    });
  } catch (error) {
    console.error('Error updating student:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Menghapus siswa
exports.deleteStudent = async (req, res) => {
  const { studentId } = req.params;
  try {
    const student = await Student.findById(studentId);
    if (!student) {
      return res.status(404).json({ success: false, message: 'Siswa tidak ditemukan' });
    }

    // Menghapus siswa
    await Student.deleteStudent(studentId);
    return res.status(200).json({
      success: true,
      message: 'Siswa berhasil dihapus'
    });
  } catch (error) {
    console.error('Error deleting student:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};
