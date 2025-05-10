import 'package:flutter/material.dart';
import 'login_admin.dart'; // <- sesuaikan nama file yang baru

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
      home: const LoginAdmin(), // <- sesuaikan nama class yang baru
    );
  }
}
