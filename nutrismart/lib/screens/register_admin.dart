import 'package:flutter/material.dart';

class RegisterAdmin extends StatefulWidget {
  const RegisterAdmin({super.key});

  @override
  State<RegisterAdmin> createState() => _RegisterAdminState();
}

class _RegisterAdminState extends State<RegisterAdmin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Title
              const Text(
                'NutriSmart',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: Colors.black87,
                ),
              ),

              const Text(
                'ADMIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 24),

              // Image (gunakan asset image jika tersedia)
              Image.asset(
                'assets/images/admin_register.png', // Ubah sesuai path kamu
                height: 180,
              ),

              const SizedBox(height: 20),

              const Text(
                "Let's join us now !",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 24),

              // Email
              _buildTextField(
                icon: Icons.person_outline,
                hint: 'Email',
                controller: emailController,
              ),

              const SizedBox(height: 16),

              // Nama Lengkap
              _buildTextField(
                icon: Icons.person,
                hint: 'Nama Lengkap',
                controller: nameController,
              ),

              const SizedBox(height: 16),

              // Password
              _buildTextField(
                icon: Icons.vpn_key,
                hint: 'Password',
                controller: passwordController,
                isPassword: true,
              ),

              const SizedBox(height: 16),

              // Nomor Telp
              _buildTextField(
                icon: Icons.phone,
                hint: 'Nomor Telp',
                controller: phoneController,
              ),

              const SizedBox(height: 28),

              // Button Daftar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Tambahkan aksi daftar
                  },
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Link login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already join NutriSmart? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login_admin');
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? _obscurePassword : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon),
          hintText: hint,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
