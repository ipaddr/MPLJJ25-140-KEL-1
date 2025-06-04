const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const logger = require('./utils/logger');
const swaggerUI = require('swagger-ui-express');
const swaggerDocs = require('./swagger');

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

// Log requests
app.use((req, res, next) => {
  logger.info(`${req.method} ${req.url}`);
  next();
});

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
app.use('/api-docs', swaggerUI.serve, swaggerUI.setup(swaggerDocs));

// Error handling middleware
app.use((err, req, res, next) => {
  logger.error(err.stack);

  const statusCode = err.statusCode || 500;
  const message = err.message || 'Internal Server Error';
  
  // Structured error response
  const errorResponse = {
    success: false,
    error: {
      code: statusCode,
      message: message,
      ...(process.env.NODE_ENV === 'development' && {
        stack: err.stack,
        details: err.details || {}
      })
    }
  };

  res.status(statusCode).json(errorResponse);
});

// Start server
if (process.env.NODE_ENV !== 'test') {
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT} in ${process.env.NODE_ENV} mode`);
  });
}

module.exports = app; // For testing purposes
