import 'package:flutter/material.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
  icon: const Icon(Icons.menu, color: Colors.black),
  onPressed: () {
    Navigator.pushNamed(context, '/dashboard_adminPilihan');
  },
),

        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
          CircleAvatar(backgroundColor: Color(0xFFD1E7DD), child: Icon(Icons.person, color: Colors.black)),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'NutriSmart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF2C4A3D),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _InfoCard(
                  icon: Icons.school,
                  label: 'Siswa terdaftar',
                  value: '890',
                ),
                const SizedBox(width: 16),
                _InfoCard(
                  icon: Icons.local_dining,
                  label: 'Data Gizi Terupdate',
                  value: '85 %',
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionCard(
              title: 'Perkembangan Input Data Gizi Bulanan',
              child: const Center(child: Icon(Icons.show_chart, size: 100, color: Colors.black54)),
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _SectionCard(
                    title: 'Aktivitas Terbaru',
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2 jam lalu\nGuru A menginput data siswa baru'),
                        Divider(),
                        Text('4 jam lalu\nGuru B mengupdate status siswa'),
                        Divider(),
                        Text('Kemarin\nGuru C menambahkan siswa baru'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _SectionCard(
                    title: 'Reminder & Notifikasi',
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          color: Color(0xFFF9E5B4),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('⚠️ Sekolah X belum mengupdate data minggu ini'),
                          ),
                        ),
                        Card(
                          color: Color(0xFFD1E7DD),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('✅ Guru Y sudah memverifikasi akun'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionCard(
              title: 'Jumlah Update per Sekolah',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total : 36    Rata-rata: 9'),
                  const SizedBox(height: 8),
                  _SchoolUpdateRow('SD 1 Harapan', 5, Colors.teal[900]!),
                  _SchoolUpdateRow('SD 2 Cempaka', 8, Colors.teal[700]!),
                  _SchoolUpdateRow('SD 3 Lestari', 10, Colors.teal[400]!),
                  _SchoolUpdateRow('SD IT Al-Falah', 13, Colors.teal[200]!),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF2C4A3D),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Absensi'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoCard({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 32),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(value, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF2C4A3D))),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}

Widget _SchoolUpdateRow(String school, int value, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Expanded(flex: 3, child: Text(school)),
        Expanded(
          flex: 6,
          child: LinearProgressIndicator(
            value: value / 15,
            color: color,
            backgroundColor: color.withOpacity(0.2),
            minHeight: 10,
          ),
        ),
        const SizedBox(width: 8),
        Text(value.toString()),
      ],
    ),
  );
}
