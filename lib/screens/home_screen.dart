import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final Widget child;

  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Determine the selected index based on the current route
    final String location = GoRouterState.of(context).uri.toString();
    int selectedIndex = 0; // Default to Playing
    if (location == '/set-availability') {
      selectedIndex = 1;
    } else if (location == '/captain') {
      selectedIndex = 2;
    } else if (location == '/pending-invites') {
      selectedIndex = 3;
    } else if (location == '/challenges') {
      selectedIndex = 4;
    } else if (location == '/following') {
      selectedIndex = 5;
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120, // Adjust width to fit text
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
            gradient: LinearGradient(
              colors: [Color(0xFF000000), Color(0xFF333333)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
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
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              switch (index) {
                case 0:
                  context.go('/playing');
                  break;
                case 1:
                  context.go('/set-availability');
                  break;
                case 2:
                  context.go('/captain');
                  break;
                case 3:
                  context.go('/pending-invites');
                  break;
                case 4:
                  context.go('/challenges');
                  break;
                case 5:
                  context.go('/following');
                  break;
              }
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.videogame_asset),
                label: Text('Playing'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.event_available),
                label: Text('Set Availability'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shield),
                label: Text('Captain'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.mail),
                label: Text('Pending Invites'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.gamepad),
                label: Text('Challenges'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                label: Text('Following'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
}
