import 'package:flutter/material.dart';
import 'package:nutrismart/screens/login_admin.dart';
import 'package:nutrismart/screens/register_admin.dart';
import 'screens/login_guru.dart';
import 'screens/otp_screen.dart';
import 'screens/register_guru.dart';
import 'screens/splash_screen.dart';
import 'modules/dashboard_admin.dart';
import 'screens/welcome_screen.dart';
import 'screens/dashboard_guru.dart';

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
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/splash', // Tampilkan Splash Screen saat pertama dibuka
      routes: {
        // Splash screen
        '/splash': (context) => const SplashScreen(),

        // Welcome screen
        '/welcome': (context) => const WelcomeScreen(),

        // Untuk user guru
        '/login': (context) => const LoginGuru(),
        '/otp': (context) => const OTPScreen(),
        '/register_guru': (context) => const RegisterGuruPage(),
        '/dashboard_guru': (context) => const DashboardGuru(),

        // Untuk admin
        '/login_admin': (context) => const LoginAdmin(),
        '/register_admin': (context) => const RegisterAdmin(),
        '/dashboard': (context) => const DashboardAdmin(),

        // Contoh halaman home
        '/home': (context) => const MyHomePage(title: 'NutriSmart Home'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
