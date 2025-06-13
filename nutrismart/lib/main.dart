import 'package:flutter/material.dart';

// Import halaman utama dan fitur
import 'package:nutrismart/screens/admin/dashboard_admin.dart';
import 'package:nutrismart/screens/DataGuru.dart';
import 'package:nutrismart/screens/DataGuruTersimpan.dart';
import 'package:nutrismart/screens/TambahDataGuru.dart';
import 'package:nutrismart/screens/DataGizi.dart';
import 'package:nutrismart/screens/DataSiswa.dart';
import 'package:nutrismart/screens/student_name_class.dart';
import 'package:nutrismart/screens/student_nutrition_detail.dart';
import 'package:nutrismart/screens/student_nutrition_from.dart';
import 'package:nutrismart/screens/update_admin.dart';
import 'package:nutrismart/screens/admin/login_admin.dart';
import 'package:nutrismart/screens/register_admin.dart';
import 'package:nutrismart/screens/login_guru.dart';
import 'package:nutrismart/screens/otp_screen.dart';
import 'package:nutrismart/screens/register_guru.dart';
import 'package:nutrismart/screens/splash_screen.dart';
import 'package:nutrismart/screens/welcome_screen.dart';
import 'package:nutrismart/screens/dashboard_guru.dart';
import 'package:nutrismart/screens/absensi_siswa.dart';
import 'package:nutrismart/screens/tambah_siswa.dart';
import 'package:nutrismart/screens/riwayat_pendistribusian.dart';
import 'package:nutrismart/screens/explore.dart';
import 'package:nutrismart/screens/pemantauan_gizi.dart';
import 'package:nutrismart/screens/forgot_password_page.dart';
import 'package:nutrismart/screens/forgot_pass_otp.dart';
import 'package:nutrismart/screens/forgot_pass_new_pass.dart';
import 'package:nutrismart/screens/popup_keluar.dart';
import 'package:nutrismart/screens/logout_admin.dart';
import 'package:nutrismart/screens/profil_guru.dart';
import 'package:nutrismart/screens/admin/dashboard_adminPilihan.dart';


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
      initialRoute: '/splash',
      onGenerateRoute: _generateRoute,
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/splash':
        return _page(const SplashScreen());
      case '/welcome':
        return _page(const WelcomeScreen());
      case '/login':
        return _page(const LoginGuru());
      case '/otp':
        return _page(const OTPScreen());
      case '/register_guru':
        return _page(const RegisterGuruPage());
      case '/dashboard_guru':
        return _page(const DashboardGuru());
      case '/login_admin':
        return _page(const LoginAdmin());
      case '/register_admin':
        return _page(const RegisterAdmin());
      case '/logout_admin':
        return _page(const LogoutAdminPage());
      case '/update-admin':
        return _page(const UpdateAdmin());
      case '/dashboard_admin':
        return _page(const DashboardAdmin());
      case '/data-guru':
        return _page(const DataGuru());
      case '/data-guru-tersimpan':
        return _page(const DataGuruTersimpan());
      case '/tambah-data-guru':
        return _page(const Tambahdataguru());
      case '/Datasiswa':
        return _page(const Datasiswa());
      case '/data-gizi':
        return _page(const Datagizi());
      case '/absensi_siswa':
        return _page(const AbsensiSiswaPage());
      case '/tambah_siswa':
        return _page(const TambahSiswa());
      case '/riwayat_pendistribusian':
        return _page(const RiwayatPendistribusian());
      case '/explore':
        return _page(const ExplorePage());
      case '/forgot_password':
        return _page(const ForgotPasswordPage());
      case '/otp_verification':
        return _page(const OTPVerificationPage());
      case '/reset_password':
        return _page(const ResetPasswordPage());
      case '/profil_guru':
        return _page(const ProfilGuruPage());
      case '/dashboard_admin': 
        return _page(const DashboardAdmin());
      case '/dashboard_adminPilihan':
           return _page(const DashboardAdminPilihan());  
      case '/student-name-class':
        if (args is Map<String, dynamic>) {
          return _page(StudentNameClass(
            schoolName: args['schoolName'],
            totalStudents: args['totalStudents'],
            students: args['students'],
            schoolIconUrl: args['schoolIconUrl'],
          ));
        }
        return _errorRoute('Argumen tidak valid untuk /student-name-class');
      case '/student-nutrition-detail':
        if (args is Map<String, dynamic>) {
          return _page(StudentNutritionDetail(
            schoolName: args['schoolName'] ?? 'Sekolah tidak diketahui',
          ));
        }
        return _errorRoute('Argumen tidak valid untuk /student-nutrition-detail');
      case '/student-nutrition-form':
        if (args == null || args is Map<String, dynamic>) {
          final dataArgs = args as Map<String, dynamic>?;
          return _page(StudentNutritionForm(data: dataArgs?['data']));
        }
        return _errorRoute('Argumen tidak valid untuk /student-nutrition-form');
      default:
        return _errorRoute('Halaman tidak ditemukan: ${settings.name}');
    }
  }

  MaterialPageRoute _page(Widget child) =>
      MaterialPageRoute(builder: (_) => child);

  MaterialPageRoute _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text(message)),
      ),
    );
  }
}
