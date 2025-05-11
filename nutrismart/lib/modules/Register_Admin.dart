import 'package:flutter/material.dart';

class RegisterAdmin extends StatelessWidget {
  const RegisterAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'NutriSmart',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Image.asset('assets/Images/register_admin.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Lets join us now !',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  _buildTextField(Icons.email, 'Email'),
                  const SizedBox(height: 12),
                  _buildTextField(Icons.person, 'Nama Lengkap'),
                  const SizedBox(height: 12),
                  _buildTextField(Icons.lock, 'Password', obscureText: true),
                  const SizedBox(height: 12),
                  _buildTextField(Icons.phone, 'Nomor Telp'),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 10, 31, 31),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Tambahkan logika untuk pendaftaran

                        // Setelah berhasil daftar, langsung ke dashboard
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already join NutriSmart? '),
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman login admin
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 119, 107),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 0, 116, 104)),
        hintText: hintText,
        filled: true,
        fillColor: Colors.teal.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: obscureText
            ? Icon(Icons.visibility, color: Colors.grey)
            : null,
      ),
    );
  }
}
