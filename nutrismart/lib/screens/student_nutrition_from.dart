import 'package:flutter/material.dart';

class StudentNutritionForm extends StatelessWidget {
  final Map<String, dynamic>? data;
  const StudentNutritionForm({this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[700], // Latar belakang gelap
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(
        "Tambah Data Siswa",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white, // Ubah warna teks menjadi putih
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInput("Nama Siswa"),
            _buildInput("Kelas"),
            _buildInput("Tinggi Badan(cm)", type: TextInputType.number),
            _buildInput("Berat Badan(kg)", type: TextInputType.number),
            _buildInput("Sekolah"),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            foregroundColor: Colors.white, // Tombol putih
            side: const BorderSide(color: Colors.white), // Border putih
          ),
          child: const Text("Batal"),
        ),
        ElevatedButton(
          onPressed: () {
            // Simpan logika di sini
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Tombol putih
            foregroundColor: Colors.teal[800], // Teks tombol
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: const Text("Simpan"),
        ),
      ],
    );
  }

  Widget _buildInput(String label, {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        keyboardType: type,
        decoration: InputDecoration(
          hintText: label,
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white, // Warna field input
        ),
      ),
    );
  }
}
