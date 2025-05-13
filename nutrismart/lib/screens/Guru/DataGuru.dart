import 'package:flutter/material.dart';
import 'tambahdataguru.dart'; // Pastikan mengimpor halaman Tambahdataguru

class DataGuru extends StatelessWidget {
  final List<Map<String, String>> guruList = [
    {
      'nama': 'Qhodry Andra Wijaya',
      'sekolah': 'Guru di SDN 1 Harapan',
      'gambar': 'assets/images/org1.png',
    },
    {
      'nama': 'Agustini',
      'sekolah': 'Guru di SMA Cipta Bangsa',
      'gambar': 'assets/images/org2.png',
    },
    {
      'nama': 'Miko Fernando',
      'sekolah': 'Guru di SDN 2 Cempaka',
      'gambar': 'assets/images/org3.png',
    },
    {
      'nama': 'Jasmine Permata',
      'sekolah': 'Guru di SDN 3 Lestari',
      'gambar': 'assets/images/org4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: AppBar(
        title: Text('Data Guru'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 48, 44),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            // Grid guru
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: guruList.map((guru) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(guru['gambar']!),
                          ),
                          SizedBox(height: 10),
                          Text(
                            guru['nama']!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            guru['sekolah']!,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Tombol tambah data guru
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman tambah guru
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tambahdataguru()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 48, 44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text('Tambah Data Guru'),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Saya'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }
}
