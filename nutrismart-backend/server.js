const express = require('express');
const dotenv = require('dotenv');
const authRoutes = require('./routes/authRoutes');
const adminRoutes = require('./routes/adminRoutes'); 
dotenv.config();

const app = express();
app.use(express.json());  // Untuk parsing JSON

// Menggunakan rute untuk auth dan admin
app.use('/auth', authRoutes);
app.use('/admin', adminRoutes);  // Rute admin

// Memulai server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server berjalan di port ${PORT}`);
});
