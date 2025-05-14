const db = require('../config/firebaseConfig');

// Model untuk menyimpan data distribusi makanan
const FoodDistribution = db.collection('food_distributions');

module.exports = FoodDistribution;
