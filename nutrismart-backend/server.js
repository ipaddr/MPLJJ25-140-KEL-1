const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors'); // ✅ Tambahkan ini
const authRoutes = require('./routes/authRoutes');
const adminRoutes = require('./routes/adminRoutes');

dotenv.config();

const app = express();

// ✅ Aktifkan CORS untuk semua origin
app.use(cors());

// ✅ Parsing JSON dari body request
app.use(express.json());

// Menggunakan rute untuk auth dan admin
app.use('/auth', authRoutes);
app.use('/admin', adminRoutes);

// Memulai server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server berjalan di port ${PORT}`);
});
