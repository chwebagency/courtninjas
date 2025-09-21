import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final Widget child;

  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    // Helper function to create navigation items
    Widget _buildNavItem(BuildContext context, String title, String route, IconData icon) {
      final bool isSelected = location == route;
      return ListTile(
        leading: Icon(icon, color: isSelected ? Theme.of(context).primaryColor : Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () => context.go(route),
        selected: isSelected,
      );
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: TextButton.icon(
          icon: const Icon(Icons.home, color: Colors.white),
          label: const Text('Home', style: TextStyle(color: Colors.white)),
          onPressed: () => context.go('/home'),
        ),
        title: const Text(
          'CourtNinjas',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF333964),
          ),
        ),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text('Logout', style: TextStyle(color: Colors.white)),
            onPressed: () => context.go('/login'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 240,
            child: Container(
              color: const Color(0xFF333964),
              child: ListView(
                children: [
                  _buildNavItem(context, 'Playing', '/playing', Icons.videogame_asset),
                  _buildNavItem(context, 'Set Availability', '/set-availability', Icons.event_available),
                  _buildNavItem(context, 'Captain', '/captain', Icons.shield),
                  _buildNavItem(context, 'Pending Invites', '/pending-invites', Icons.mail),
                  _buildNavItem(context, 'Challenges', '/challenges', Icons.gamepad),
                  _buildNavItem(context, 'Following', '/following', Icons.people),
                ],
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1, color: Colors.white24),
          Expanded(
            child: Container(
              color: Colors.white.withOpacity(0.09),
              child: child,
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1, color: Colors.white24),
          SizedBox(
            width: 240,
            child: Container(
              color: const Color(0xFF333964),
            ),
          ),
        ],
      ),
    );
  }
}