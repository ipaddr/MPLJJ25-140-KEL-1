const admin = require('firebase-admin');
const db = admin.firestore();
const { USER_ROLES } = require('../config/constants');
const bcrypt = require('bcryptjs');

class User {
  constructor(data) {
    this.userId = data.userId || null;
    this.email = data.email || '';
    this.password = data.password || '';
    this.role = data.role || USER_ROLES.GURU;
    this.name = data.name || '';
    this.phoneNumber = data.phoneNumber || '';
    this.nik = data.nik || '';
    this.address = data.address || '';
    this.school = data.school || '';
    this.otpVerified = data.otpVerified || false;
    this.createdAt = data.createdAt || admin.firestore.FieldValue.serverTimestamp();
  }

  async save() {
    try {
      if (this.password) {
        const salt = await bcrypt.genSalt(10);
        this.password = await bcrypt.hash(this.password, salt);
      }

      const userRef = this.userId ? db.collection('users').doc(this.userId) : db.collection('users').doc();
      this.userId = userRef.id;
      await userRef.set(this.toFirestore());
      
      return { success: true, userId: this.userId };
    } catch (error) {
      console.error('Error saving user:', error);
      return { success: false, error: error.message };
    }
  }

  toFirestore() {
    return {
      email: this.email,
      password: this.password,
      role: this.role,
      name: this.name,
      phoneNumber: this.phoneNumber,
      nik: this.nik || null,
      address: this.address || null,
      school: this.school || null,
      otpVerified: this.otpVerified,
      createdAt: this.createdAt
    };
  }

  static async findByEmail(email) {
    try {
      const snapshot = await db.collection('users').where('email', '==', email).limit(1).get();
      if (snapshot.empty) return null;

      const userData = snapshot.docs[0].data();
      userData.userId = snapshot.docs[0].id;
      return new User(userData);
    } catch (error) {
      console.error('Error finding user by email:', error);
      return null;
    }
  }

  static async findByNIK(nik) {
    try {
      const snapshot = await db.collection('users').where('nik', '==', nik).limit(1).get();
      if (snapshot.empty) return null;

      const userData = snapshot.docs[0].data();
      userData.userId = snapshot.docs[0].id;
      return new User(userData);
    } catch (error) {
      console.error('Error finding user by NIK:', error);
      return null;
    }
  }

  static async findById(userId) {
    try {
      const doc = await db.collection('users').doc(userId).get();
      if (!doc.exists) return null;

      const userData = doc.data();
      userData.userId = doc.id;
      return new User(userData);
    } catch (error) {
      console.error('Error finding user by ID:', error);
      return null;
    }
  }

  static async findAll(filters = {}) {
    try {
      let query = db.collection('users');
      if (filters.role) query = query.where('role', '==', filters.role);
      if (filters.school) query = query.where('school', '==', filters.school);

      const snapshot = await query.get();
      return snapshot.docs.map(doc => {
        const data = doc.data();
        data.userId = doc.id;
        return new User(data);
      });
    } catch (error) {
      console.error('Error finding all users:', error);
      return [];
    }
  }

  async comparePassword(password) {
    try {
      return await bcrypt.compare(password, this.password);
    } catch (error) {
      console.error('Error comparing password:', error);
      return false;
    }
  }
}

module.exports = User;
