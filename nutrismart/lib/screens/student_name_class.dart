import 'package:flutter/material.dart';
import 'nutrition_monitoring_page.dart'; // Ganti dengan path file yang benar

class StudentNameClass extends StatelessWidget {
  final String schoolName;
  final int totalStudents;
  final List<Map<String, dynamic>> students;
  final String schoolIconUrl;

  const StudentNameClass({
    super.key,
    required this.schoolName,
    required this.totalStudents,
    required this.students,
    required this.schoolIconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Siswa"),
        backgroundColor: const Color(0xFF123B3C),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Image.network(
                  schoolIconUrl,
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.school),
                ),
                title: Text(
                  schoolName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Jumlah Siswa Terdaftar : $totalStudents'),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.monitor_heart),
              label: const Text("Lihat Pemantauan Gizi"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF123B3C),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NutritionMonitoringPage(
                      schoolName: schoolName,
                      totalStudents: totalStudents,
                      students: students.map((s) {
                        return {
                          'name': s['name'],
                          'status': s['status'] ?? 'Belum', // default 'Belum'
                        };
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(student['avatar'] ?? ''),
                        onBackgroundImageError: (_, __) =>
                            const Icon(Icons.person),
                      ),
                      title: Text(student['name'] ?? 'Tanpa Nama'),
                      subtitle: Text('Kelas : ${student['class'] ?? '-'}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Tambahkan navigasi jika diperlukan
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Saya'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }
}
