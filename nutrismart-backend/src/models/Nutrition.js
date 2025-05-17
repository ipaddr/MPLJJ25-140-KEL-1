const { db } = require('../config/firebase');

class Nutrition {
  constructor(data) {
    this.nutritionId = data.nutritionId || null;
    this.studentId = data.studentId || '';
    this.weight = data.weight || 0;
    this.height = data.height || 0;
    this.status = data.status || 'normal';
    this.imT = data.imT || 0;
    this.updatedAt = data.updatedAt || admin.firestore.FieldValue.serverTimestamp();
  }

  async save() {
    try {
      const nutritionRef = this.nutritionId ? db.collection('nutrition').doc(this.nutritionId) : db.collection('nutrition').doc();
      this.nutritionId = nutritionRef.id;
      await nutritionRef.set(this.toFirestore());

      return { success: true, nutritionId: this.nutritionId };
    } catch (error) {
      console.error('Error saving nutrition data:', error);
      return { success: false, error: error.message };
    }
  }

  toFirestore() {
    return {
      studentId: this.studentId,
      weight: this.weight,
      height: this.height,
      status: this.status,
      imT: this.imT,
      updatedAt: this.updatedAt
    };
  }

  static async findByStudentId(studentId) {
    try {
      const snapshot = await db.collection('nutrition').where('studentId', '==', studentId).get();
      if (snapshot.empty) return null;

      const nutritionData = snapshot.docs[0].data();
      nutritionData.nutritionId = snapshot.docs[0].id;
      return new Nutrition(nutritionData);
    } catch (error) {
      console.error('Error finding nutrition by student ID:', error);
      return null;
    }
  }
}

module.exports = Nutrition;
