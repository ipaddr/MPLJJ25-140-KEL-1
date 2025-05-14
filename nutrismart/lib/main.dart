import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'screens/login_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/register_guru.dart';
import 'screens/splash_screen.dart';
=======
import 'modules/login_Admin.dart';
import 'modules/Register_Admin.dart';
import 'modules/dashboard_admin.dart';
>>>>>>> 4a93d099c76e2789e166682cda00d513c1babf42

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false, // Hilangkan debug banner
      title: 'NutriSmart',
      theme: ThemeData(
        fontFamily: 'Poppins', // Gunakan font dari pubspec.yaml
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Splash screen ditampilkan pertama kali
      initialRoute: '/otp',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OTPScreen(),
        '/register_guru': (context) => const RegisterGuruPage(),
        '/home': (context) => const MyHomePage(title: 'NutriSmart Home'),
=======
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
>>>>>>> 4a93d099c76e2789e166682cda00d513c1babf42
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
