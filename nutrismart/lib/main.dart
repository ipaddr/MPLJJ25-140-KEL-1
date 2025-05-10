import 'package:flutter/material.dart';
import 'Register_Admin.dart';
import 'login_Admin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriSmart',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const RegisterAdmin(),
        '/login': (context) => const LoginAdmin(), // sesuaikan dengan file login
      },
    );
  }
}
