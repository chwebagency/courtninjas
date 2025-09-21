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
import 'screens/events_screen.dart';
import 'screens/event_details_screen.dart';
import 'screens/create_event_screen.dart';
import 'widgets/app_custom_transition_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

AppCustomTransitionPage<void> _buildTransition(Widget child) {
  return AppCustomTransitionPage(
    child: child,
    transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/events', // Set initial route to /events
  routes: [
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => _buildTransition(const LoginScreen()),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) =>
          _buildTransition(HomeScreen(child: child)),
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              _buildTransition(const PlayingScreen()),
        ),
        GoRoute(
          path: '/playing',
          pageBuilder: (context, state) =>
              _buildTransition(const PlayingScreen()),
        ),
        GoRoute(
          path: '/set-availability',
          pageBuilder: (context, state) =>
              _buildTransition(const SetAvailabilityScreen()),
        ),
        GoRoute(
          path: '/captain',
          pageBuilder: (context, state) =>
              _buildTransition(const CaptainScreen()),
        ),
        GoRoute(
          path: '/pending-invites',
          pageBuilder: (context, state) =>
              _buildTransition(const PendingInvitesScreen()),
        ),
        GoRoute(
          path: '/challenges',
          pageBuilder: (context, state) =>
              _buildTransition(const ChallengesScreen()),
        ),
        GoRoute(
          path: '/following',
          pageBuilder: (context, state) =>
              _buildTransition(const FollowingScreen()),
        ),
        GoRoute(
            path: '/events',
            pageBuilder: (context, state) =>
                _buildTransition(const EventsScreen()),
            routes: [
              GoRoute(
                path: 'create',
                parentNavigatorKey: _rootNavigatorKey, // Display outside the shell
                pageBuilder: (context, state) =>
                    _buildTransition(const CreateEventScreen()),
              ),
              GoRoute(
                path: ':id',
                parentNavigatorKey: _rootNavigatorKey, // Display outside the shell
                pageBuilder: (context, state) {
                  final eventId = state.pathParameters['id']!;
                  return _buildTransition(EventDetailsScreen(eventId: eventId));
                },
              ),
            ]),
      ],
    ),
  ],
);
