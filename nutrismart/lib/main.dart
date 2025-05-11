import 'package:flutter/material.dart';
import 'modules/login_Admin.dart';
import 'modules/Register_Admin.dart';
import 'modules/dashboard_admin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriSmart',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // Set awal halaman login
      home: const LoginAdmin(),
      // Tambahkan semua rute di sini
      routes: {
        '/login': (context) => const LoginAdmin(),
        '/register': (context) => const RegisterAdmin(),
        '/dashboard': (context) => const DashboardAdmin(),
      },
    );
  }
}
