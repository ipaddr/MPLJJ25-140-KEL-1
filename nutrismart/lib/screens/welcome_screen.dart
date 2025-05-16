import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EDE1), // Warna krem seperti pada desain
      body: SafeArea(
        child: Column(
          children: [
            // Menu icon
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.menu, size: 30, color: Colors.black),
              ),
            ),

            // Logo & Slogan
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                children: const [
                  Text(
                    'NutriSmart',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Georgia',
                      color: Color(0xFF2D3C2E), // Hijau gelap
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Smart Nutrition, Better Life.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Images (dibatasi agar tidak terlalu besar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 200, // Atur tinggi agar gambar tidak terlalu besar
                child: Image.asset(
                  'assets/images/nutrismart_food.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol: I have a NutriSmart Account
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login_user');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C6B5B),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'I HAVE A NUTRISMART ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Tombol: I do not have a NutriSmart Account
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register_user');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D2C26),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'I DO NOT HAVE A NUTRISMART ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Tombol: Login as Admin
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login_admin');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF649179),
                  side: const BorderSide(color: Colors.black),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'LOGIN AS ADMIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
