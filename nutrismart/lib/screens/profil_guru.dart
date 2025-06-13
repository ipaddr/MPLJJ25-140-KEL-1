import 'package:flutter/material.dart';

class ProfilGuruPage extends StatelessWidget {
  const ProfilGuruPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data – kamu bisa ganti dengan data dari backend atau shared preferences
    const String namaGuru = 'Bapak Ahmad Suryadi';
    const String email = 'ahmad.suryadi@example.com';
    const String noTelepon = '081234567890';
    const String sekolah = 'SDN 01 Jakarta';
    const String mataPelajaran = 'Ilmu Pengetahuan Alam';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Guru'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
            ),
            const SizedBox(height: 20),
            Text(
              namaGuru,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoTile(icon: Icons.email, label: 'Email', value: email),
            _buildInfoTile(icon: Icons.phone, label: 'No. Telepon', value: noTelepon),
            _buildInfoTile(icon: Icons.school, label: 'Sekolah', value: sekolah),
            _buildInfoTile(icon: Icons.book, label: 'Mata Pelajaran', value: mataPelajaran),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/update-admin'); // Ganti dengan route edit guru jika ada
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profil'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/logout_guru');
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Keluar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(label),
        subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        tileColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
