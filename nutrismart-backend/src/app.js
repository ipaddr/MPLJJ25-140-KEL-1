const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

// Load environment variables
dotenv.config();

// Inisialisasi Firebase - tambahkan baris ini
require('./config/firebase');

// Initialize Express app
const app = express();
const PORT = process.env.PORT || 5000;

// Middlewares
app.use(cors());
app.use(express.json({ limit: '50mb' })); // Untuk menerima data JSON besar (termasuk image base64)
app.use(express.urlencoded({ extended: true, limit: '50mb' }));

// Import Routes
const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const studentRoutes = require('./routes/studentRoutes');
const nutritionRoutes = require('./routes/nutritionRoutes');
const attendanceRoutes = require('./routes/attendanceRoutes');
const distributionRoutes = require('./routes/distributionRoutes');
const exploreRoutes = require('./routes/exploreRoutes');

// Root endpoint
app.get('/', (req, res) => {
  res.send('NutriSmart API is running');
});

// Use Routes
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/students', studentRoutes);
app.use('/api/nutrition', nutritionRoutes);
app.use('/api/attendance', attendanceRoutes);
app.use('/api/distribution', distributionRoutes);
app.use('/api/explore', exploreRoutes);

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(err.statusCode || 500).json({
    success: false,
    message: err.message || 'Internal Server Error',
    error: process.env.NODE_ENV === 'development' ? err : {}
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT} in ${process.env.NODE_ENV} mode`);
});

module.exports = app; // For testing purposes
