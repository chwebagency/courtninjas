import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../models/event.dart';
import '../providers/event_provider.dart';

class EventDetailsScreen extends StatelessWidget {
  final String eventId;

  const EventDetailsScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () async {
              final eventProvider = Provider.of<EventProvider>(
                context,
                listen: false,
              );
              await eventProvider.deleteEvent(eventId);
              // Show a confirmation message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Event deleted successfully')),
              );
              // Go back to the previous screen
              context.pop();
            },
          ),
        ],
      ),
      body: FutureBuilder<Event?>(
        future: Provider.of<EventProvider>(
          context,
          listen: false,
        ).getEventById(eventId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Event not found.'));
          }

          final event = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  event.imageUrl,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 250, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      _buildDetailRow(
                        Icons.calendar_today,
                        DateFormat.yMMMd().add_jm().format(event.dateTime),
                      ),
                      const SizedBox(height: 10.0),
                      _buildDetailRow(Icons.location_on, event.location),
                      const SizedBox(height: 10.0),
                      _buildDetailRow(
                        Icons.person,
                        'Created by ${event.creatorName}',
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        event.description,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                      const SizedBox(height: 24.0),
                      _buildButtons(context, event.id),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context, String eventId) {
    // In a real app, you would get the current user's ID
    const userId = 'current_user_id'; // Placeholder

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Provider.of<EventProvider>(
              context,
              listen: false,
            ).rsvpToEvent(eventId, userId, 'going');
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('You are going!')));
          },
          icon: const Icon(Icons.check_circle, color: Colors.white),
          label: const Text('Going', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            Provider.of<EventProvider>(
              context,
              listen: false,
            ).rsvpToEvent(eventId, userId, 'interested');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('You are interested!')),
            );
          },
          icon: const Icon(Icons.star, color: Colors.white),
          label: const Text(
            'Interested',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ],
    );
  }
}
