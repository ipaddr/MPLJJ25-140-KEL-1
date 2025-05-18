import 'package:flutter/material.dart';
import 'package:nutrismart/screens/Dashboard.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(), // Dashboard
    Center(child: Text("Halaman Siswa")),
    Center(child: Text("Halaman Guru")),
    Center(child: Text("Halaman Gizi")),
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
            _buildDrawerItem(Icons.people, 'Data Siswa', '/Datasiswa'),
            _buildDrawerItem(Icons.person, 'Data Guru', '/data-guru'),
            _buildDrawerItem(Icons.local_hospital, 'Data Gizi', '/data-gizi'),
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
            icon: Icon(Icons.person),
            label: 'Guru',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Gizi',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, [String? routeName]) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context);
        if (routeName != null) {
          Navigator.pushNamed(context, routeName);
        }
      },
    );
  }
}
