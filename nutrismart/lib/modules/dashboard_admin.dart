import 'package:flutter/material.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selectedIndex = 0;

  // Dummy widget halaman
  final List<Widget> _pages = [
    Center(child: Text("Beranda Dashboard")),
    Center(child: Text("Halaman Siswa")),
    Center(child: Text("Halaman Guru")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NutriSmart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: const Color(0xFF0A1F1F),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF0A1F1F),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0A1F1F),
              ),
              child: Text(
                'NutriSmart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            _buildDrawerItem(Icons.home, 'Dashboard'),
            _buildDrawerItem(Icons.people, 'Data Siswa'),
            _buildDrawerItem(Icons.person, 'Data Guru'),
            _buildDrawerItem(Icons.calendar_today, 'Data Gizi'),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF0A1F1F),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Siswa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context); // tutup drawer
        // Tambahkan navigasi logika sesuai halaman yang diinginkan
      },
    );
  }
}
