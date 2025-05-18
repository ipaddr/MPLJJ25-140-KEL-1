import 'package:flutter/material.dart';

class DataGuruTersimpan extends StatelessWidget {
  const DataGuruTersimpan({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh data guru yang tersimpan (sementara)
    final List<Map<String, String>> dataGuru = [
      {
        'nama': 'Budi Santoso',
        'email': 'budi@example.com',
        'nik': '1234567890123456',
        'telepon': '08123456789',
        'sekolah': 'SMP Negeri 1 Padang',
      },
      {
        'nama': 'Siti Aminah',
        'email': 'siti@example.com',
        'nik': '9876543210987654',
        'telepon': '08211234567',
        'sekolah': 'SMA Negeri 2 Bukittinggi',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Guru Tersimpan'),
        backgroundColor: const Color.fromARGB(255, 0, 48, 44),
      ),
      backgroundColor: const Color(0xFFF1F1F1),
      body: ListView.builder(
        itemCount: dataGuru.length,
        itemBuilder: (context, index) {
          final guru = dataGuru[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: ${guru['nama']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Email: ${guru['email']}'),
                  Text('NIK: ${guru['nik']}'),
                  Text('Telepon: ${guru['telepon']}'),
                  Text('Sekolah: ${guru['sekolah']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
