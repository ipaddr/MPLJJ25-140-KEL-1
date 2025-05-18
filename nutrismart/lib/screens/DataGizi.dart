import 'package:flutter/material.dart';
import 'package:nutrismart/screens/student_nutrition_detail.dart';

class Datagizi extends StatelessWidget {
  const Datagizi({super.key});

  @override
  Widget build(BuildContext context) {
    final schools = [
      {
        'name': 'SDN 1 Harapan',
        'desc': 'Sekolah Dasar Negeri 1 Harapan',
        'image': 'assets/images/sekolah1.png',
      },
      {
        'name': 'SDN 2 Cempaka',
        'desc': 'Sekolah Dasar Negeri 2 Cempaka',
        'image': 'assets/images/sekolah2.png',
      },
      {
        'name': 'SDN 3 Lestari',
        'desc': 'Sekolah Dasar Negeri 3 Lestari',
        'image': 'assets/images/sekolah3.png',
      },
      {
        'name': 'SD IT Al Falah',
        'desc': 'Sekolah Dasar Islam Terpadu Al Falah',
        'image': 'assets/images/sekolah4.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Gizi Siswa"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Program Makanan Bergizi Gratis",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: schools.length,
                itemBuilder: (context, index) {
                  final school = schools[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(school['image']!),
                        radius: 25,
                      ),
                      title: Text(
                        school['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(school['desc']!),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StudentNutritionDetail(
                              schoolName: school['name']!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/dashboard-admin');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/absensi_siswa');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/data-gizi');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Absensi'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
      ],
    );
  }
}
