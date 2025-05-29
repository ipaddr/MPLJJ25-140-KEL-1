const nodemailer = require('nodemailer');
const dotenv = require('dotenv');
dotenv.config(); 

const EMAIL_SERVICE = process.env.EMAIL_SERVICE;
const EMAIL_USER = process.env.EMAIL_USER;
const EMAIL_PASSWORD = process.env.EMAIL_PASSWORD;
const EMAIL_FROM = process.env.EMAIL_FROM;

class EmailService {
  static async sendEmail(to, otp, type) {
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: EMAIL_USER,
        pass: EMAIL_PASSWORD
      }
    });

    const subject = type === 'registration' 
      ? 'Kode OTP Registrasi NutriSmart'
      : 'Kode OTP Reset Password NutriSmart';

    const mailOptions = {
      from: EMAIL_FROM,
      to: to,
      subject: subject,
      text: `Kode OTP ${type === 'registration' ? 'registrasi' : 'reset password'} Anda adalah: ${otp}\nKode ini akan kedaluwarsa dalam 10 menit.`
    };

    try {
      await transporter.sendMail(mailOptions);
      return { success: true };
    } catch (error) {
      console.error('Error sending email:', error);
      return { success: false, error: error.message };
    }
  }
}

module.exports = EmailService;
