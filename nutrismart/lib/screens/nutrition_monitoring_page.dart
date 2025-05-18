import 'package:flutter/material.dart';

class NutritionMonitoringPage extends StatefulWidget {
  final String schoolName;
  final int totalStudents;
  final List<Map<String, dynamic>> students;

  const NutritionMonitoringPage({
    super.key,
    required this.schoolName,
    required this.totalStudents,
    required this.students,
  });

  @override
  State<NutritionMonitoringPage> createState() => _NutritionMonitoringPageState();
}

class _NutritionMonitoringPageState extends State<NutritionMonitoringPage> {
  late List<Map<String, dynamic>> studentList;

  @override
  void initState() {
    super.initState();
    studentList = List<Map<String, dynamic>>.from(widget.students);
  }

  void toggleStatus(int index) {
    setState(() {
      studentList[index]['status'] =
          studentList[index]['status'] == 'Sudah' ? 'Belum' : 'Sudah';
    });
  }

  @override
  Widget build(BuildContext context) {
    int alreadyMonitored = studentList.where((s) => s['status'] == 'Sudah').length;
    int notMonitored = widget.totalStudents - alreadyMonitored;

    double percentSudah = (alreadyMonitored / widget.totalStudents) * 100;
    double percentBelum = (notMonitored / widget.totalStudents) * 100;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF123B3C),
        centerTitle: true,
        title: const Text("NutriSmart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Pemantauan gizi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF123B3C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text("${widget.totalStudents} Siswa Terdaftar", style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("${percentSudah.toStringAsFixed(0)}%", style: const TextStyle(color: Colors.green, fontSize: 20)),
                          const Text("Sudah", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("${percentBelum.toStringAsFixed(0)}%", style: const TextStyle(color: Colors.red, fontSize: 20)),
                          const Text("Belum", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text("Update Terakhir : 21 April 2025"),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.school),
                const SizedBox(width: 8),
                Text(widget.schoolName, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: studentList.length,
                itemBuilder: (context, index) {
                  final student = studentList[index];
                  return Card(
                    child: ListTile(
                      title: Text(student['name']),
                      subtitle: const Text("14 April 2025"),
                      trailing: InkWell(
                        onTap: () => toggleStatus(index),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              student['status'] == 'Sudah' ? Icons.check_box : Icons.cancel,
                              color: student['status'] == 'Sudah' ? Colors.green : Colors.red,
                            ),
                            const SizedBox(width: 8),
                            Text(student['status']),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Absen'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }
}
