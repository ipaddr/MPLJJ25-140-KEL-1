import 'package:flutter/material.dart';

class Tambahdataguru extends StatelessWidget {
  const Tambahdataguru({super.key});

  void _showAddGuruDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.all(16),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Tambah Data Guru',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Nama Guru',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'NIK',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Nomor Telp',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Sekolah',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Simpan logika di sini
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 48, 44),
                      ),
                      child: const Text('Simpan'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      appBar: AppBar(
        title: const Text('Data Guru'),
        backgroundColor: const Color.fromARGB(255, 0, 48, 44),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showAddGuruDialog(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 48, 44),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text('Tambah Data Guru'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color.fromARGB(255, 0, 48, 44),
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
      ),
    );
  }
}
