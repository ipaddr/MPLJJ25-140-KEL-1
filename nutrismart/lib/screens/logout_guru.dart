import 'package:flutter/material.dart';

class LogoutGuruPage extends StatelessWidget {
  const LogoutGuruPage({super.key});

  void _logout(BuildContext context) {
    // Simulasi logout, bisa diganti dengan proses sesungguhnya
    Navigator.pushNamedAndRemoveUntil(context, '/login_guru', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Logout'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout, size: 100, color: Colors.teal),
            const SizedBox(height: 20),
            const Text(
              'Yakin ingin keluar dari akun ini?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text('Ya, Logout'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
          ],
        ),
      ),
    );
  }
}
