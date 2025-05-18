import 'package:flutter/material.dart';
import 'package:nutrismart/modules/dashboard_home.dart';
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
  final args = settings.arguments;
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
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(
                  child: Text('Halaman tidak ditemukan: ${settings.name}'),
                ),
              ),
            );
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
