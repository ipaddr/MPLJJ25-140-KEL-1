import 'package:flutter/material.dart';
import 'dashboard_guru.dart';
import 'absensi_siswa.dart';
import 'explore.dart';

class RiwayatPendistribusian extends StatelessWidget {
  const RiwayatPendistribusian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'NutriSmart',
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundColor: Color(0xFFDFF5F0),
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              'Riwayat Pendistribusian',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Georgia',
              ),
            ),
            const SizedBox(height: 10),

            // Image
            Image.asset(
              'assets/images/distribution.png', // ganti dengan path sesuai aset
              height: 150,
            ),
            const SizedBox(height: 10),

            const Text(
              'SD Cipta Bangsa Persada, Bandung',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Georgia',
              ),
            ),

            const SizedBox(height: 20),

            // List
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF2C4C4B),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView(
                  children: [
                    _buildItem("Rabu, 20 April 2025", "Selesai", "17/25 Hadir"),
                    _buildItem("Jumat, 22 April 2025", "Selesai", "24/25 Hadir"),
                    _buildItem("Senin, 25 April 2025", "Selesai", "25/25 Hadir"),
                    _buildItem("Rabu, 27 April 2025", "Selesai", "25/25 Hadir"),
                    _buildItem("Jumat, 29 April 2025", "Menunggu", "-"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF2C4C4B),
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Absensi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const DashboardGuru()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const AbsensiSiswaPage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ExplorePage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildItem(String date, String status, String hadir) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.circle, size: 10, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                date,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Text(
              'Status : $status',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(width: 10),
            Text(
              hadir,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        const Divider(color: Colors.white70),
      ],
    );
  }
}
