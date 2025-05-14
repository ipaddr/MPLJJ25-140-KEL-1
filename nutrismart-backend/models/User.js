const db = require('../config/firebaseConfig');

// Model untuk menyimpan data pengguna (guru/admin)
const User = db.collection('users');

module.exports = User;
