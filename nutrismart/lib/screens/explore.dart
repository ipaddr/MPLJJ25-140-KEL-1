import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/dashboard_guru');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/absensi_siswa');
        break;
      case 2:
        // Sudah di halaman Explore
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NutriSmart',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionHeader('Video'),
            videoCard(),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sectionHeader('Video lainnya'),
                TextButton(onPressed: () {}, child: const Text('Lihat semua')),
              ],
            ),
            const SizedBox(height: 8),
            videoRow(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sectionHeader('Artikel'),
                TextButton(onPressed: () {}, child: const Text('Lihat semua')),
              ],
            ),
            artikelList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Absensi'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget videoCard() {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/food.png', fit: BoxFit.cover),
          const ListTile(
            title: Text(
              'Bahaya makanan cepat saji untuk kesehatan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Lorem ipsum dolor sit amet consectetur. Cursus at feugiat enim lectus purus...',
            ),
          ),
        ],
      ),
    );
  }

  Widget videoRow() {
    return Row(
      children: List.generate(3, (_) => Expanded(child: videoThumbnail())),
    );
  }

  Widget videoThumbnail() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/food.png', fit: BoxFit.cover),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Bahaya makanan cepat saji',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget artikelList() {
    return Column(
      children: List.generate(
        5,
        (index) => Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            title: Text('Pentingnya hidup sehat ${index + 1}'),
            trailing: const Text('Robet Downey Jr'),
          ),
        ),
      ),
    );
  }
}
