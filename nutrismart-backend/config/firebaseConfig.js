const admin = require('firebase-admin');
const serviceAccount = require('./serviceAccountKey.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: 'https://nutrismart-2a0bb.firebaseio.com'
});

const db = admin.firestore();
module.exports = db;
