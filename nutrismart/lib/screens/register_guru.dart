import 'package:flutter/material.dart';

class RegisterGuruPage extends StatefulWidget {
  const RegisterGuruPage({super.key});

  @override
  State<RegisterGuruPage> createState() => _RegisterGuruPageState();
}

class _RegisterGuruPageState extends State<RegisterGuruPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // warna latar seperti di desain
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'NutriSmart',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F3D35), // warna hijau tua
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/teacher.png', // ganti sesuai path gambar Anda
                height: 200,
              ),
              const SizedBox(height: 16),
              const Text(
                'Lets join us now !',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 24),

              // Input Fields
              _buildInputField(icon: Icons.email, hint: "Email"),
              _buildInputField(icon: Icons.credit_card, hint: "NIK"),
              _buildInputField(icon: Icons.person, hint: "Nama Lengkap"),
              _buildPasswordField(),
              _buildInputField(icon: Icons.phone, hint: "Nomor Telp"),
              _buildInputField(icon: Icons.school, hint: "Sekolah"),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // logika daftar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F2D26), // warna gelap
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Already join NutriSmart? "),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({required IconData icon, required String hint}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12)],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.grey[700]),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12)],
      ),
      child: TextField(
        obscureText: _obscurePassword,
        decoration: InputDecoration(
          hintText: "Password",
          prefixIcon: const Icon(Icons.key, color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
