const nodemailer = require('nodemailer');

// Membuat transporter untuk Nodemailer
const transporter = nodemailer.createTransport({
    service: 'gmail',  // Gmail sebagai penyedia SMTP
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS
    },
    tls: {
        rejectUnauthorized: false
    },
    port: 587,  // Port 587 digunakan untuk STARTTLS
    host: 'smtp.gmail.com',
    secure: false  // Tidak menggunakan SSL di port 587, menggunakan STARTTLS
});

// Fungsi untuk mengirimkan OTP ke email
const sendOtpEmail = (email, otp) => {
    const mailOptions = {
        from: process.env.EMAIL_USER,  // Email pengirim
        to: email,                     // Email tujuan
        subject: 'Your OTP for NutriSmart',  // Subjek email
        text: `Your OTP code is: ${otp}`     // Isi email
    };

    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.log('Error sending email: ', error); // Jika ada error, tampilkan di console
        } else {
            console.log('OTP sent successfully: ' + info.response); // Jika sukses, tampilkan response
        }
    });
};

module.exports = sendOtpEmail;
