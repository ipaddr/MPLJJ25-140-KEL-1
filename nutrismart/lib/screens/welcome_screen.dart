import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EDE1),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.menu, size: 30, color: Colors.black),
              ),
            ),
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
                      color: Color(0xFF2D3C2E),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/nutrismart_food.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login'); 
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register_guru');
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
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
                  'I HAVE A NUTRISMART ADMIN ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register_admin');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF8FAF9D),
                  side: const BorderSide(color: Colors.black),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "I DON'T HAVE A NUTRISMART ADMIN ACCOUNT",
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


