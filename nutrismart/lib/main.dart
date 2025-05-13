import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import screens
import 'screens/Dashboard/dashboard_admin.dart';
import 'screens/Guru/DataGuru.dart';
import 'screens/Guru/TambahDataGuru.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriSmart Admin',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff8f8f8),
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardPage(),            // Beranda dashboard   // Halaman Update Admin
        '/data-guru': (context) => DataGuru(),  
        '/tambah-data-guru': (context) => Tambahdataguru() 
              // Halaman Data Guru
      },
    );
  }
}
