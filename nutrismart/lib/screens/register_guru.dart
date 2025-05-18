import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterGuruPage extends StatefulWidget {
  const RegisterGuruPage({super.key});

  @override
  State<RegisterGuruPage> createState() => _RegisterGuruPageState();
}

class _RegisterGuruPageState extends State<RegisterGuruPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();

  bool _obscurePassword = true;

  Future<void> _registerGuru() async {
    final url = Uri.parse("http://localhost:5000/auth/register");

    // Validasi form kosong
    if (emailController.text.isEmpty ||
        nikController.text.isEmpty ||
        nameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        schoolController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua field harus diisi!")),
      );
      return;
    }

    // JSON payload
    final bodyData = {
      "email": emailController.text,
      "nik": nikController.text,
      "name": nameController.text,
      "password": passwordController.text,
      "phoneNumber": phoneNumberController.text, 
      "school": schoolController.text,
    };

    print("Mengirim data ke backend: $bodyData");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(bodyData),
      );

      print("Status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["status"] == "success") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Pendaftaran berhasil!")),
        );
        Navigator.pop(context); // Navigasi kembali ke login atau halaman sebelumnya
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"] ?? "Pendaftaran gagal.")),
        );
      }
    } catch (e) {
      print("Error saat register: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Terjadi kesalahan: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
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
                  color: Color(0xFF2F3D35),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/register_guru.png',
                height: 200,
              ),
              const SizedBox(height: 16),
              const Text(
                'Let\'s join us now!',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 24),

              // Input Fields
              _buildInputField(controller: emailController, icon: Icons.email, hint: "Email"),
              _buildInputField(controller: nikController, icon: Icons.credit_card, hint: "NIK"),
              _buildInputField(controller: nameController, icon: Icons.person, hint: "Nama Lengkap"),
              _buildPasswordField(),
              _buildInputField(controller: phoneNumberController, icon: Icons.phone, hint: "Nomor Telp"),
              _buildInputField(controller: schoolController, icon: Icons.school, hint: "Sekolah"),

              const SizedBox(height: 24),

              // Tombol DAFTAR
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _registerGuru,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F2D26),
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
                  Text("Sudah punya akun? "),
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

  Widget _buildInputField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12)],
      ),
      child: TextField(
        controller: controller,
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
        controller: passwordController,
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
