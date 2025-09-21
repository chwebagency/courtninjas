import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/captain_screen.dart';
import 'screens/challenges_screen.dart';
import 'screens/following_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/pending_invites_screen.dart';
import 'screens/playing_screen.dart';
import 'screens/set_availability_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HomeScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const PlayingScreen(),
        ),
        GoRoute(
          path: '/playing',
          builder: (context, state) => const PlayingScreen(),
        ),
        GoRoute(
          path: '/set-availability',
          builder: (context, state) => const SetAvailabilityScreen(),
        ),
        GoRoute(
          path: '/captain',
          builder: (context, state) => const CaptainScreen(),
        ),
        GoRoute(
          path: '/pending-invites',
          builder: (context, state) => const PendingInvitesScreen(),
        ),
        GoRoute(
          path: '/challenges',
          builder: (context, state) => const ChallengesScreen(),
        ),
        GoRoute(
          path: '/following',
          builder: (context, state) => const FollowingScreen(),
        ),
      ],
    ),
  ],
);
