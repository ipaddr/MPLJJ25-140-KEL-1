const express = require('express');
const dotenv = require('dotenv');
const adminRoutes = require('./routes/adminRoutes');
const exploreRoutes = require('./routes/exploreRoutes');
const guruRoutes = require('./routes/guruRoutes');
const cors = require('cors');
dotenv.config();

const app = express();

// Middleware untuk parsing JSON
app.use(express.json());
app.use(cors());

// Menyambungkan routes
app.use('/admin', adminRoutes);
app.use('/explore', exploreRoutes);
app.use('/guru', guruRoutes);

// Memulai server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server berjalan di port ${PORT}`);
});
