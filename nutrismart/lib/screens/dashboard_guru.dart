import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:nutrismart/screens/absensi_siswa.dart';
import 'package:nutrismart/screens/explore.dart';
import 'package:nutrismart/screens/riwayat_pendistribusian.dart';
import 'package:nutrismart/screens/pemantauan_gizi.dart';

class DashboardGuru extends StatefulWidget {
  const DashboardGuru({super.key});

  @override
  State<DashboardGuru> createState() => _DashboardGuruState();
}

class _DashboardGuruState extends State<DashboardGuru> {
  int _currentIndex = 0;

  void _onTapBottomNav(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AbsensiSiswaPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ExplorePage()),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              FadeInDown(
                child: const Text.rich(
                  TextSpan(
                    text: 'Hi, ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: 'Agustini',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Text(
                'Guru di SMA Cipta Bangsa Persada Bandung',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 20),
              FadeIn(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('25 Siswa Terdaftar'),
                          SizedBox(height: 8),
                          Text('18 Sudah Terpantau'),
                        ],
                      ),
                      Icon(Icons.person, size: 40, color: Colors.teal),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '90% sudah terpantau minggu ini.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Lihat Detail',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _menuButton('Daftar Siswa', 'assets/images/daftar_siswa.png'),
                  _menuButton('Riwayat', 'assets/images/riwayat.png'),
                  _menuButton('Pemantauan Gizi', 'assets/images/gizi.png'),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.warning, color: Colors.black87),
                    SizedBox(width: 10),
                    Text('Pendistribusian selanjutnya : Rabu 12 / August / 2025'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _actionButton(Icons.add, 'Tambah Siswa Baru'),
                  _actionButton(Icons.camera_alt, 'Ambil Foto Absensi'),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Cek Lokasi Pendistribusian',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cek Ketersediaan di kotamu',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.teal.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Padang ; 4 sekolah terdaftar'),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _cityCard('Bandung', 'assets/images/bandung.png'),
                    _cityCard('Padang', 'assets/images/padang.png'),
                    _cityCard('Jakarta', 'assets/images/jakarta.png'),
                    _cityCard('Bali', 'assets/images/bali.png'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Kamu mungkin suka',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Lihat semua',
                    style: TextStyle(color: Colors.teal),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _articleCard(),
                  _articleCard(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapBottomNav,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Absensi'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
        selectedItemColor: Colors.teal,
      ),
    );
  }

  Widget _menuButton(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (title == 'Riwayat') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RiwayatPendistribusian()),
          );
        } else if (title == 'Pemantauan Gizi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PemantauanGiziPage()),
          );
        }
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 2)],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {
        if (label == 'Tambah Siswa Baru') {
          Navigator.pushNamed(context, '/tambah_siswa');
        } else if (label == 'Ambil Foto Absensi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AbsensiSiswaPage()),
          );
        }
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _cityCard(String city, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            height: 140,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.black45,
              ),
              child: Text(
                city,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 1)],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _articleCard() {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('assets/images/article.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Text('Article', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const Text('8 high-protein fruits to try', maxLines: 2, overflow: TextOverflow.ellipsis),
          const Text('Start reading →', style: TextStyle(color: Colors.teal, fontSize: 12)),
        ],
      ),
    );
  }
}
