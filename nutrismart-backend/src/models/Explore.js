const { db } = require('../config/firebase');

class Explore {
  constructor(data) {
    this.id = data.id || null;
    this.title = data.title || '';
    this.content = data.content || '';
    this.type = data.type || 'article'; // Can be 'video' or 'article'
    this.url = data.url || '';
    this.createdAt = data.createdAt || admin.firestore.FieldValue.serverTimestamp();
    this.updatedAt = data.updatedAt || admin.firestore.FieldValue.serverTimestamp();
    this.tags = data.tags || [];
  }

  async save() {
    try {
      const exploreRef = this.id ? db.collection('explore').doc(this.id) : db.collection('explore').doc();
      this.id = exploreRef.id;
      await exploreRef.set(this.toFirestore());

      return { success: true, id: this.id };
    } catch (error) {
      console.error('Error saving explore content:', error);
      return { success: false, error: error.message };
    }
  }

  toFirestore() {
    return {
      title: this.title,
      content: this.content,
      type: this.type,
      url: this.url,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      tags: this.tags
    };
  }

  static async findById(id) {
    try {
      const doc = await db.collection('explore').doc(id).get();
      if (!doc.exists) return null;

      const exploreData = doc.data();
      exploreData.id = doc.id;
      return new Explore(exploreData);
    } catch (error) {
      console.error('Error finding explore content by ID:', error);
      return null;
    }
  }

  static async findAll() {
    try {
      const snapshot = await db.collection('explore').get();
      return snapshot.docs.map(doc => {
        const data = doc.data();
        data.id = doc.id;
        return new Explore(data);
      });
    } catch (error) {
      console.error('Error finding all explore content:', error);
      return [];
    }
  }
}

module.exports = Explore;
