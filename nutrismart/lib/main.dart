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
import 'screens/absensi_siswa.dart';
import 'screens/tambah_siswa.dart';
import 'screens/riwayat_pendistribusian.dart';
import 'screens/explore.dart';
import 'screens/pemantauan_gizi.dart';
import 'screens/forgot_password_page.dart';
import 'screens/forgot_pass_otp.dart';
import 'screens/forgot_pass_new_pass.dart';




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
      initialRoute: '/reset_password',
      routes: {
        // Splash & Welcome
        '/splash': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),

        // Guru
        '/login': (context) => const LoginGuru(),
        '/otp': (context) => const OTPScreen(),
        '/register_guru': (context) => const RegisterGuruPage(),
        '/dashboard_guru': (context) => const DashboardGuru(),

        // Admin
        '/login_admin': (context) => const LoginAdmin(),
        '/register_admin': (context) => const RegisterAdmin(),
        '/dashboard': (context) => const DashboardAdmin(),

        // Home Placeholder
        '/home': (context) => const MyHomePage(title: 'NutriSmart Home'),

        // Fitur
        '/absensi_siswa': (context) => const AbsensiSiswaPage(),
        '/tambah_siswa': (context) => const TambahSiswa(),

        // Tambahan
        '/riwayat_pendistribusian': (context) => const RiwayatPendistribusian(),
        '/explore': (context) => const ExplorePage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/otp_verification': (context) => const OTPVerificationPage(),
        '/reset_password': (context) => const ResetPasswordPage(),



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
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/absensi_siswa');
              },
              icon: const Icon(Icons.person_search),
              label: const Text('Buka Absensi Siswa'),
            ),
            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/tambah_siswa');
              },
              icon: const Icon(Icons.person_add),
              label: const Text('Tambah Siswa'),
            ),
            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/riwayat_pendistribusian');
              },
              icon: const Icon(Icons.history),
              label: const Text('Riwayat Pendistribusian'),
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
