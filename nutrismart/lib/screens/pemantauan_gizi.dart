import 'package:flutter/material.dart';
import 'package:nutrismart/screens/absensi_siswa.dart';
import 'package:nutrismart/screens/dashboard_guru.dart';
import 'package:nutrismart/screens/explore.dart';

class PemantauanGiziPage extends StatelessWidget {
  const PemantauanGiziPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'NutriSmart',
          style: TextStyle(
            color: Colors.teal,
            fontFamily: 'Georgia',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFFE0F2F1),
              child: Icon(Icons.person, color: Colors.teal),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Pemantauan Gizi',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade900,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statusColumn('25\nSiswa Terdaftar', null),
                  _statusColumn('68%', 'Normal', color: Colors.green),
                  _statusColumn('24%', 'Kurang', color: Colors.yellow[700]),
                  _statusColumn('8%', 'Berlebih', color: Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Update Terakhir : 21 April 2025',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 12),
            _giziTile(
              name: 'Tugimin Alexandre Tojiro',
              status: 'Normal',
              date: '14 April 2025',
              icon: Icons.arrow_forward_ios,
              iconColor: Colors.grey,
            ),
            _giziTile(
              name: 'Agustini De Rothschild',
              status: 'Normal',
              date: '14 April 2025',
              icon: Icons.check_box,
              iconColor: Colors.green,
            ),
            _giziTile(
              name: 'Neli Kurnia Felipe',
              status: 'Normal',
              date: '14 April 2025',
              icon: Icons.check_box,
              iconColor: Colors.green,
            ),
            _giziTile(
              name: 'Mardi Mark Philip',
              status: 'Berlebih',
              date: '14 April 2025',
              icon: Icons.error,
              iconColor: Colors.red,
            ),
            _giziTile(
              name: 'Mimi Gucci Gang',
              status: 'Normal',
              date: '14 April 2025',
              icon: Icons.check_box,
              iconColor: Colors.yellow[800],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.teal.shade800,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardGuru()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AbsensiSiswaPage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ExplorePage()),
            );
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

  Widget _statusColumn(String label, String? status, {Color? color}) {
    return Column(
      children: [
        if (status == null)
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        else ...[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            child: CircleAvatar(
              backgroundColor: color ?? Colors.grey,
              radius: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            status,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ]
      ],
    );
  }

  Widget _giziTile({
    required String name,
    required String status,
    required String date,
    required IconData icon,
    required Color? iconColor,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('$status, $date'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 4),
            Text(status),
          ],
        ),
      ),
    );
  }
}
