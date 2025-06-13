import 'package:flutter/material.dart';

class DashboardAdminPilihan extends StatelessWidget {
  const DashboardAdminPilihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1C1C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'NutriSmart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 40),
              _buildMenuItem(
                icon: Icons.home_outlined,
                text: 'Dashboard',
                context: context,
                route: '/dashboard_admin',
                isActive: true,
              ),
              const SizedBox(height: 20),
              _buildMenuItem(
                icon: Icons.person_outline,
                text: 'Data Siswa',
                context: context,
                route: '/Datasiswa',
              ),
              const SizedBox(height: 20),
              _buildMenuItem(
                icon: Icons.badge_outlined,
                text: 'Data Guru',
                context: context,
                route: '/data-guru',
              ),
              const SizedBox(height: 20),
              _buildMenuItem(
                icon: Icons.calendar_today_outlined,
                text: 'Data Gizi',
                context: context,
                route: '/data-gizi',
              ),
              const SizedBox(height: 20),
              _buildMenuItem(
                icon: Icons.logout,
                text: 'LogOut',
                context: context,
                route: '/logout_admin',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required BuildContext context,
    required String route,
    bool isActive = false,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              )
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Icon(icon,
                color: isActive ? const Color(0xFF0E1C1C) : Colors.white),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                color: isActive ? const Color(0xFF0E1C1C) : Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
