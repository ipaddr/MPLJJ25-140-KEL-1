import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginGuru extends StatefulWidget {
  const LoginGuru({super.key});

  @override
  State<LoginGuru> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginGuru> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // 🔗 Fungsi untuk login ke backend
  Future<void> loginAdmin(String email, String password) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.10:8000/api/login'), // GANTI sesuai IP backend kamu
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Login sukses: $data');

        // TODO: simpan token, navigasi ke halaman utama
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login berhasil!')),
        );
      } else {
        final res = jsonDecode(response.body);
        setState(() {
          _errorMessage = res['message'] ?? 'Login gagal';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Terjadi kesalahan koneksi: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Image.asset('assets/Images/login_admin.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome back!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextFormField(Icons.email, 'Email', controller: emailController),
                    const SizedBox(height: 12),
                    _buildTextFormField(Icons.lock, 'Password',
                        controller: passwordController, obscureText: true),
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
                        onPressed: _isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  loginAdmin(emailController.text, passwordController.text);
                                }
                              },
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                'Login',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Belum punya akun? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 119, 119),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(IconData icon, String hintText,
      {bool obscureText = false, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hintText tidak boleh kosong';
        }
        if (hintText == 'Email' && !value.contains('@')) {
          return 'Format email tidak valid';
        }
        if (hintText == 'Password' && value.length < 6) {
          return 'Password minimal 6 karakter';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 2, 117, 106)),
        hintText: hintText,
        filled: true,
        fillColor: Colors.teal.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: obscureText
            ? const Icon(Icons.visibility, color: Colors.grey)
            : null,
      ),
    );
  }
}
