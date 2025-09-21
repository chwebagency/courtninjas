import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/event_provider.dart';
import '../widgets/event_card.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({super.key});

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventProvider>(context, listen: false).fetchEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    const currentUserId = 'current_user_id'; // Placeholder for auth

    return Scaffold(
      body: Consumer<EventProvider>(
        builder: (context, eventProvider, child) {
          if (eventProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final myEvents = eventProvider.events
              .where((e) => e.rsvps.containsKey(currentUserId))
              .toList();

          if (myEvents.isEmpty) {
            return const Center(
              child: Text(
                'You haven\'t RSVP\'d to any events yet.\nGo to the Events tab to find some!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: myEvents.length,
            itemBuilder: (context, index) {
              final event = myEvents[index];
              return EventCard(event: event, currentUserId: currentUserId);
            },
          );
        },
      ),
    );
  }
}
