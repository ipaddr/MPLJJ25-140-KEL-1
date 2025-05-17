const { db } = require('../config/firebase');

class Attendance {
  constructor(data) {
    this.attendanceId = data.attendanceId || null;
    this.studentId = data.studentId || '';
    this.attendanceDate = data.attendanceDate || admin.firestore.FieldValue.serverTimestamp();
    this.status = data.status || 'present';
    this.image = data.image || ''; // base64 image or image URL
    this.createdAt = data.createdAt || admin.firestore.FieldValue.serverTimestamp();
  }

  async save() {
    try {
      const attendanceRef = this.attendanceId ? db.collection('attendance').doc(this.attendanceId) : db.collection('attendance').doc();
      this.attendanceId = attendanceRef.id;
      await attendanceRef.set(this.toFirestore());

      return { success: true, attendanceId: this.attendanceId };
    } catch (error) {
      console.error('Error saving attendance data:', error);
      return { success: false, error: error.message };
    }
  }

  toFirestore() {
    return {
      studentId: this.studentId,
      attendanceDate: this.attendanceDate,
      status: this.status,
      image: this.image,
      createdAt: this.createdAt
    };
  }

  static async findByStudentId(studentId) {
    try {
      const snapshot = await db.collection('attendance').where('studentId', '==', studentId).get();
      if (snapshot.empty) return null;

      const attendanceData = snapshot.docs[0].data();
      attendanceData.attendanceId = snapshot.docs[0].id;
      return new Attendance(attendanceData);
    } catch (error) {
      console.error('Error finding attendance by student ID:', error);
      return null;
    }
  }

  static async findAll() {
    try {
      const snapshot = await db.collection('attendance').get();
      return snapshot.docs.map(doc => {
        const data = doc.data();
        data.attendanceId = doc.id;
        return new Attendance(data);
      });
    } catch (error) {
      console.error('Error finding all attendance records:', error);
      return [];
    }
  }
}

module.exports = Attendance;
