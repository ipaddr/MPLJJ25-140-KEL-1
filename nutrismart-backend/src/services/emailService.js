const nodemailer = require('nodemailer');
const dotenv = require('dotenv');
dotenv.config(); 

const EMAIL_SERVICE = process.env.EMAIL_SERVICE;
const EMAIL_USER = process.env.EMAIL_USER;
const EMAIL_PASSWORD = process.env.EMAIL_PASSWORD;

class EmailService {
  static async sendEmail(to, otp) {
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: EMAIL_USER,
        pass: EMAIL_PASSWORD
      }
    });

    const mailOptions = {
      from: EMAIL_FROM,
      to: to,
      subject: 'Your OTP Code',
      text: `Your OTP code is: ${otp}`
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
