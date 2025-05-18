import 'package:flutter/material.dart';
import 'student_name_class.dart'; // Import halaman tujuan

class Datasiswa extends StatelessWidget {
  const Datasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Siswa'),
        backgroundColor: const Color(0xFF123B3C),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.school),
          label: const Text('Lihat Data Siswa'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF123B3C),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentNameClass(
                  schoolName: 'SMP Negeri 1',
                  totalStudents: 3,
                  schoolIconUrl: 'assets/images/sekolah1.png',
                  students: [
                    {
                      'name': 'Timoty',
                      'class': '7A',
                      'avatar': 'assets/images/org1.png',
                    },
                    {
                      'name': 'Siti',
                      'class': '7B',
                      'avatar': 'assets/images/org2.png',
                    },
                    {
                      'name': 'Andi',
                      'class': '7C',
                      'avatar': 'assets/images/org3.png',
                    },
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Jelajah'),
        ],
      ),
    );
  }
}
