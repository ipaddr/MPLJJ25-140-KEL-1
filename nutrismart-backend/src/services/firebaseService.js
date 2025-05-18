const { db } = require('../config/firebase');

// Layanan CRUD Firebase untuk umum
class FirebaseService {
  static async create(collection, data) {
    try {
      const docRef = await db.collection(collection).add(data);
      return { success: true, docId: docRef.id };
    } catch (error) {
      console.error('Error creating document:', error);
      return { success: false, error: error.message };
    }
  }

  static async get(collection, docId) {
    try {
      const doc = await db.collection(collection).doc(docId).get();
      if (!doc.exists) {
        return { success: false, error: 'Document not found' };
      }
      return { success: true, data: doc.data() };
    } catch (error) {
      console.error('Error getting document:', error);
      return { success: false, error: error.message };
    }
  }

  static async update(collection, docId, data) {
    try {
      await db.collection(collection).doc(docId).update(data);
      return { success: true };
    } catch (error) {
      console.error('Error updating document:', error);
      return { success: false, error: error.message };
    }
  }

  static async delete(collection, docId) {
    try {
      await db.collection(collection).doc(docId).delete();
      return { success: true };
    } catch (error) {
      console.error('Error deleting document:', error);
      return { success: false, error: error.message };
    }
  }
}

module.exports = FirebaseService;
