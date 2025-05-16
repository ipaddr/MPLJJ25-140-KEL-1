const nodemailer = require('nodemailer');
const dotenv = require('dotenv');
dotenv.config();  // Memuat variabel lingkungan dari file .env
// Membuat transporter untuk Nodemailer
const transporter = nodemailer.createTransport({
    service: 'gmail',   // Layanan Gmail
    auth: {
        user: process.env.EMAIL_USER,  // Email pengirim dari .env
        pass: process.env.EMAIL_PASS   // Password atau App Password dari .env
    },
    tls: {
        rejectUnauthorized: false  // Mengizinkan koneksi meskipun sertifikat SSL/TLS tidak valid
    }
});

// Fungsi untuk mengirimkan OTP ke email
const sendOtpEmail = (email, otp) => {
    const mailOptions = {
        from: process.env.EMAIL_USER,  // Email pengirim
        to: email,                     // Email tujuan
        subject: 'Your OTP for NutriSmart',  // Subjek email
        text: `Your OTP code is: ${otp}`    // Isi email
    };

    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.log('Error sending email: ', error);  // Jika ada error
        } else {
            console.log('OTP sent successfully: ' + info.response);  // Jika sukses
        }
    });
};

module.exports = sendOtpEmail;
