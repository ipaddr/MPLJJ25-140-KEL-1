import 'package:flutter/material.dart';

class AbsensiSiswaPage extends StatelessWidget {
  const AbsensiSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'NutriSmart',
          style: TextStyle(
            color: Color(0xFF2E4D3D),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFFD3F3E6),
              child: Icon(Icons.person, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Halaman Absensi Siswa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E4D3D),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Capture a photo of the classroom with student's faces attendance taking",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset('assets/images/absensi_foto.png'),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('15 Siswa hadir'),
                TextButton(onPressed: () {}, child: const Text('Ambil Ulang')),
                TextButton(onPressed: () {}, child: const Text('Submit')),
              ],
            ),
            const Divider(thickness: 1),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Rekap Hari Ini',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            ..._buildStudentList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF2E4D3D),
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/dashboard_guru');
          } else if (index == 1) {
            // stay on current page
          } else if (index == 2) {
            // Navigasi ke halaman explore jika dibutuhkan
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Absensi'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }

  List<Widget> _buildStudentList() {
    final students = [
      {'name': 'Alenxandre Graham', 'status': 'Hadir'},
      {'name': 'Violet De Scarlet', 'status': 'Hadir'},
      {'name': 'Lucas Garbada', 'status': 'Tidak Hadir'},
      {'name': 'Mardi El Nino', 'status': 'Tidak Hadir'},
      {'name': 'Ijad Salamander', 'status': 'Hadir'},
    ];

    return students.map((student) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.teal.shade200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.circle_outlined, size: 16),
                  const SizedBox(width: 10),
                  Text(
                    student['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2E4D3D),
                    ),
                  ),
                ],
              ),
              Text(
                student['status']!,
                style: TextStyle(
                  color: student['status'] == 'Hadir'
                      ? Colors.teal
                      : Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
