import 'package:flutter/material.dart';
import 'package:nutrismart/models/dashboard_home.dart';
import 'package:nutrismart/screens/DataGuru.dart';
import 'package:nutrismart/screens/DataGuruTersimpan.dart';
import 'package:nutrismart/screens/TambahDataGuru.dart';
import 'package:nutrismart/screens/Dashboard.dart';
import 'package:nutrismart/screens/DataGizi.dart';
import 'package:nutrismart/screens/DataSiswa.dart';
import 'package:nutrismart/screens/student_name_class.dart';
import 'package:nutrismart/screens/student_nutrition_detail.dart';
import 'package:nutrismart/screens/student_nutrition_from.dart';
import 'package:nutrismart/screens/update_admin.dart';
import 'package:nutrismart/screens/login_admin.dart';
import 'package:nutrismart/screens/register_admin.dart';
import 'screens/login_guru.dart';
import 'screens/otp_screen.dart';
import 'screens/register_guru.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/dashboard_guru.dart';
import 'screens/absensi_siswa.dart';
import 'screens/tambah_siswa.dart';
import 'screens/riwayat_pendistribusian.dart';
import 'screens/explore.dart';
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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final args = settings.arguments;

        if (settings.name == '/student-name-class') {
          if (args is Map<String, dynamic>) {
            return MaterialPageRoute(
              builder: (context) => StudentNameClass(
                schoolName: args['schoolName'],
                totalStudents: args['totalStudents'],
                students: args['students'],
                schoolIconUrl: args['schoolIconUrl'],
              ),
            );
          }
          return _errorRoute('Argumen tidak valid untuk /student-name-class');
        }

        if (settings.name == '/student-nutrition-detail') {
          if (args is Map<String, dynamic>) {
            return MaterialPageRoute(
              builder: (_) => StudentNutritionDetail(
                schoolName: args['schoolName'] ?? 'Sekolah tidak diketahui',
              ),
            );
          }
          return _errorRoute('Argumen tidak valid untuk /student-nutrition-detail');
        }

        if (settings.name == '/student-nutrition-form') {
          if (args == null || args is Map<String, dynamic>) {
            final dataArgs = args as Map<String, dynamic>?;
            return MaterialPageRoute(
              builder: (_) => StudentNutritionForm(data: dataArgs?["data"]),
            );
          }
          return _errorRoute('Argumen tidak valid untuk /student-nutrition-form');
        }

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const DashboardHome());
          case '/dashboard':
            return MaterialPageRoute(builder: (_) => const DashboardPage());
          case '/update-admin':
            return MaterialPageRoute(builder: (_) => const UpdateAdmin());
          case '/data-guru':
            return MaterialPageRoute(builder: (_) => const DataGuru());
          case '/data-guru-tersimpan':
            return MaterialPageRoute(builder: (_) => const DataGuruTersimpan());
          case '/tambah-data-guru':
            return MaterialPageRoute(builder: (_) => const Tambahdataguru());
          case '/Datasiswa':
            return MaterialPageRoute(builder: (_) => const Datasiswa());
          case '/data-gizi':
            return MaterialPageRoute(builder: (_) => const Datagizi());
          case '/splash':
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          case '/welcome':
            return MaterialPageRoute(builder: (_) => const WelcomeScreen());
          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginGuru());
          case '/otp':
            return MaterialPageRoute(builder: (_) => const OTPScreen());
          case '/register_guru':
            return MaterialPageRoute(builder: (_) => const RegisterGuruPage());
          case '/dashboard_guru':
            return MaterialPageRoute(builder: (_) => const DashboardGuru());
          case '/login_admin':
            return MaterialPageRoute(builder: (_) => const LoginAdmin());
          case '/register_admin':
            return MaterialPageRoute(builder: (_) => const RegisterAdmin());
          case '/home':
            return MaterialPageRoute(builder: (_) => const MyHomePage(title: 'NutriSmart Home'));
          case '/absensi_siswa':
            return MaterialPageRoute(builder: (_) => const AbsensiSiswaPage());
          case '/tambah_siswa':
            return MaterialPageRoute(builder: (_) => const TambahSiswa());
          case '/riwayat_pendistribusian':
            return MaterialPageRoute(builder: (_) => const RiwayatPendistribusian());
          case '/explore':
            return MaterialPageRoute(builder: (_) => const ExplorePage());
          case '/forgot_password':
            return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
          case '/otp_verification':
            return MaterialPageRoute(builder: (_) => const OTPVerificationPage());
          case '/reset_password':
            return MaterialPageRoute(builder: (_) => const ResetPasswordPage());
          default:
            return _errorRoute('Halaman tidak ditemukan: ${settings.name}');
        }
      },
    );
  }

  MaterialPageRoute _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text(message)),
      ),
    );
  }
}

class DashboardAdmin {
  const DashboardAdmin();
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
