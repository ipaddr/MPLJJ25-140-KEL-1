import 'package:flutter/material.dart';

class DashboardGuru extends StatelessWidget {
  const DashboardGuru({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Text.rich(
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
                const Text(
                  'Guru di SMA Cipta Bangsa Persada Bandung',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Container(
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
                      style: TextStyle(
                        color: Color.fromARGB(252, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _menuButton('Daftar Siswa', 'assets/Images/daftar_siswa.jpg'),
                    _menuButton('Riwayat', 'assets/Images/riwayat.jpg'),
                    _menuButton('Pemantauan Gizi', 'assets/Images/gizi.jpg'),
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
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _cityCard('Bandung'),
                      _cityCard('Padang'),
                      _cityCard('Jakarta'),
                      _cityCard('Bali'),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    return Column(
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
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
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

  Widget _cityCard(String city) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.teal.shade200,
            ),
          ),
          const SizedBox(height: 4),
          Text(city, style: const TextStyle(fontWeight: FontWeight.w600)),
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
                image: AssetImage('assets/Images/article.jpg'),
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
