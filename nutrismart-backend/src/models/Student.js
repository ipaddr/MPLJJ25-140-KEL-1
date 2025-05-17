const { db } = require('../config/firebase');

class Student {
  constructor(data) {
    this.studentId = data.studentId || null;
    this.fullName = data.fullName || '';
    this.dob = data.dob || null;
    this.nik = data.nik || '';
    this.address = data.address || '';
    this.school = data.school || '';
    this.grade = data.grade || '';
    this.status = data.status || 'active';
    this.createdAt = data.createdAt || admin.firestore.FieldValue.serverTimestamp();
  }

  async save() {
    try {
      const studentRef = this.studentId ? db.collection('students').doc(this.studentId) : db.collection('students').doc();
      this.studentId = studentRef.id;
      await studentRef.set(this.toFirestore());

      return { success: true, studentId: this.studentId };
    } catch (error) {
      console.error('Error saving student:', error);
      return { success: false, error: error.message };
    }
  }

  toFirestore() {
    return {
      fullName: this.fullName,
      dob: this.dob,
      nik: this.nik,
      address: this.address,
      school: this.school,
      grade: this.grade,
      status: this.status,
      createdAt: this.createdAt
    };
  }

  static async findById(studentId) {
    try {
      const doc = await db.collection('students').doc(studentId).get();
      if (!doc.exists) return null;

      const studentData = doc.data();
      studentData.studentId = doc.id;
      return new Student(studentData);
    } catch (error) {
      console.error('Error finding student by ID:', error);
      return null;
    }
  }

  static async findAll() {
    try {
      const snapshot = await db.collection('students').get();
      return snapshot.docs.map(doc => {
        const data = doc.data();
        data.studentId = doc.id;
        return new Student(data);
      });
    } catch (error) {
      console.error('Error finding all students:', error);
      return [];
    }
  }
}

module.exports = Student;
