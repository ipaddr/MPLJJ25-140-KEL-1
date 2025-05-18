const { db } = require('../config/firebase');  // Menggunakan Firebase untuk menyimpan data sekolah

class School {
  constructor(data) {
    this.schoolId = data.schoolId || null;
    this.name = data.name || '';
    this.address = data.address || '';
    this.contactNumber = data.contactNumber || '';
    this.email = data.email || '';
    this.createdAt = data.createdAt || admin.firestore.FieldValue.serverTimestamp();
  }

  // Menyimpan data sekolah baru ke Firebase Firestore
  async save() {
    try {
      const schoolRef = this.schoolId ? db.collection('schools').doc(this.schoolId) : db.collection('schools').doc();
      this.schoolId = schoolRef.id;
      await schoolRef.set(this.toFirestore());
      return { success: true, schoolId: this.schoolId };
    } catch (error) {
      console.error('Error saving school data:', error);
      return { success: false, error: error.message };
    }
  }

  // Mengonversi data model ke format Firestore
  toFirestore() {
    return {
      name: this.name,
      address: this.address,
      contactNumber: this.contactNumber,
      email: this.email,
      createdAt: this.createdAt,
    };
  }

  // Mencari sekolah berdasarkan ID
  static async findById(schoolId) {
    try {
      const doc = await db.collection('schools').doc(schoolId).get();
      if (!doc.exists) {
        return null;
      }
      const schoolData = doc.data();
      schoolData.schoolId = doc.id;
      return new School(schoolData);
    } catch (error) {
      console.error('Error finding school by ID:', error);
      return null;
    }
  }

  // Mencari sekolah berdasarkan nama
  static async findByName(name) {
    try {
      const snapshot = await db.collection('schools').where('name', '==', name).limit(1).get();
      if (snapshot.empty) {
        return null;
      }
      const schoolData = snapshot.docs[0].data();
      schoolData.schoolId = snapshot.docs[0].id;
      return new School(schoolData);
    } catch (error) {
      console.error('Error finding school by name:', error);
      return null;
    }
  }

  // Mengambil semua data sekolah
  static async findAll() {
    try {
      const snapshot = await db.collection('schools').get();
      return snapshot.docs.map(doc => {
        const data = doc.data();
        data.schoolId = doc.id;
        return new School(data);
      });
    } catch (error) {
      console.error('Error fetching all schools:', error);
      return [];
    }
  }

  // Menghapus sekolah berdasarkan ID
  static async delete(schoolId) {
    try {
      await db.collection('schools').doc(schoolId).delete();
      return { success: true };
    } catch (error) {
      console.error('Error deleting school:', error);
      return { success: false, error: error.message };
    }
  }
}

module.exports = School;
