const { db } = require('../config/firebase');

class FoodDistribution {
  constructor(data) {
    this.distributionId = data.distributionId || null;
    this.school = data.school || '';
    this.distributionDate = data.distributionDate || admin.firestore.FieldValue.serverTimestamp();
    this.foodItems = data.foodItems || []; // Array of food items, e.g., ["Rice", "Vegetables", "Fruits"]
    this.status = data.status || 'pending';
    this.createdAt = data.createdAt || admin.firestore.FieldValue.serverTimestamp();
  }

  async save() {
    try {
      const distributionRef = this.distributionId ? db.collection('food_distribution').doc(this.distributionId) : db.collection('food_distribution').doc();
      this.distributionId = distributionRef.id;
      await distributionRef.set(this.toFirestore());

      return { success: true, distributionId: this.distributionId };
    } catch (error) {
      console.error('Error saving food distribution data:', error);
      return { success: false, error: error.message };
    }
  }

  toFirestore() {
    return {
      school: this.school,
      distributionDate: this.distributionDate,
      foodItems: this.foodItems,
      status: this.status,
      createdAt: this.createdAt
    };
  }

  static async findBySchool(school) {
    try {
      const snapshot = await db.collection('food_distribution').where('school', '==', school).get();
      if (snapshot.empty) return null;

      return snapshot.docs.map(doc => {
        const data = doc.data();
        data.distributionId = doc.id;
        return new FoodDistribution(data);
      });
    } catch (error) {
      console.error('Error finding food distribution by school:', error);
      return [];
    }
  }

  static async findAll() {
    try {
      const snapshot = await db.collection('food_distribution').get();
      return snapshot.docs.map(doc => {
        const data = doc.data();
        data.distributionId = doc.id;
        return new FoodDistribution(data);
      });
    } catch (error) {
      console.error('Error finding all food distribution records:', error);
      return [];
    }
  }
}

module.exports = FoodDistribution;
