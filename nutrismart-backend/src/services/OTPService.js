const nodemailer = require('nodemailer');

class OTPService {
    static async sendEmail(email, otp, type) {
        try {
            // Log untuk debugging
            console.log('Attempting to send email to:', email);
            console.log('Email configuration:', {
                service: process.env.EMAIL_SERVICE,
                user: process.env.EMAIL_USER,
                // Don't log password
            });

            const transporter = nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    user: process.env.EMAIL_USER,
                    pass: process.env.EMAIL_PASSWORD
                }
            });

            const mailOptions = {
                from: process.env.EMAIL_FROM,
                to: email,
                subject: type === 'registration' 
                    ? 'Kode OTP Registrasi NutriSmart'
                    : 'Kode OTP Reset Password NutriSmart',
                text: `Kode OTP Anda adalah: ${otp}\nKode ini akan kedaluwarsa dalam 10 menit.`
            };

            // Tambahkan timeout
            const result = await Promise.race([
                transporter.sendMail(mailOptions),
                new Promise((_, reject) => 
                    setTimeout(() => reject(new Error('Email timeout')), 30000)
                )
            ]);

            console.log('Email sent successfully:', result);
            return { success: true };

        } catch (error) {
            console.error('Error sending email:', error);
            return { 
                success: false, 
                error: error.message 
            };
        }
    }
}

module.exports = OTPService;