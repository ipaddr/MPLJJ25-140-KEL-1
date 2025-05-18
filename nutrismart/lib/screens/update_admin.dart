import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class UpdateAdmin extends StatelessWidget {
  const UpdateAdmin ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'NutriSmart',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 10, 58, 53)),
        ),
        actions: [
          const Icon(Icons.notifications_none, color: Colors.black),
          const SizedBox(width: 16),
          CircleAvatar(backgroundColor: Colors.teal.shade100, child: const Icon(Icons.person)),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Top boxes
            Row(
              children: [
                Expanded(child: _statBox('Siswa Terdaftar', '890', Icons.school, Colors.pink)),
                const SizedBox(width: 16),
                Expanded(child: _statBox('Data Gizi Terupdate', '85%', Icons.health_and_safety, const Color.fromARGB(255, 0, 48, 44),)),
              ],
            ),
            const SizedBox(height: 16),

            // Chart
            _card(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Perkembangan Input Data Gizi Bulanan", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 150, child: _buildDummyChart()),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Activity & Notification
            Row(
              children: [
                Expanded(
                  child: _card(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Aktivitas Terbaru", style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text("2 jam lalu\nGuru A menginput data siswa baru"),
                        SizedBox(height: 8),
                        Text("4 jam lalu\nGuru B memperbarui status siswa"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _card(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Reminder & Notifikasi", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        _reminderTile(Icons.warning, "Sekolah X belum mengisi data minggu ini", Colors.orange),
                        _reminderTile(Icons.check_circle, "Guru Y sudah menuntaskan data", const Color.fromARGB(255, 0, 48, 44),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Jumlah update per sekolah
            _card(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Jumlah Update per Sekolah", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _schoolUpdate("SD Harapan", 2),
                  _schoolUpdate("SD Cendikia", 7),
                  _schoolUpdate("SD Tunas", 9),
                  _schoolUpdate("SDIT Al Falah", 3),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 🔘 Tombol Navigasi ke Halaman Data Guru
            ElevatedButton.icon(
              icon: const Icon(Icons.people),
              label: const Text("Lihat Data Guru"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 48, 44),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/data-guru');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 0, 48, 44),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Absensi'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }

  Widget _statBox(String title, String value, IconData icon, Color color) {
    return _card(
      Row(
        children: [
          CircleAvatar(backgroundColor: color.withOpacity(0.2), child: Icon(icon, color: color)),
          const SizedBox(width: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(fontSize: 18)),
          ]),
        ],
      ),
    );
  }

  Widget _card(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: child,
    );
  }

  static Widget _reminderTile(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 12))),
      ],
    );
  }

  Widget _schoolUpdate(String name, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          LinearProgressIndicator(
            value: value / 20,
            backgroundColor: Colors.grey[200],
            color: const Color.fromARGB(255, 0, 48, 44),
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildDummyChart() {
    return BarChart(
      BarChartData(
        barGroups: List.generate(
          6,
          (i) => BarChartGroupData(
            x: i,
            barRods: [BarChartRodData(toY: (i + 1) * 3.0, color: Colors.teal)],
          ),
        ),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
      ),
    );
  }
}
