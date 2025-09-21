import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event.dart';

class EventService {
  final CollectionReference _eventsCollection = FirebaseFirestore.instance
      .collection('events');

  Future<List<Event>> getEvents() async {
    try {
      QuerySnapshot snapshot = await _eventsCollection
          .orderBy('dateTime', descending: true)
          .get();
      return snapshot.docs.map((doc) => Event.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error getting events: $e');
      return [];
    }
  }

  Future<Event?> getEventById(String eventId) async {
    try {
      DocumentSnapshot doc = await _eventsCollection.doc(eventId).get();
      if (doc.exists) {
        return Event.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error getting event by ID: $e');
      return null;
    }
  }

  Future<void> createEvent(Event event) async {
    try {
      await _eventsCollection.add(event.toFirestore());
    } catch (e) {
      print('Error creating event: $e');
    }
  }

  Future<void> rsvpToEvent(String eventId, String userId, String status) async {
    try {
      await _eventsCollection.doc(eventId).collection('rsvps').doc(userId).set({
        'status': status,
      });
    } catch (e) {
      print('Error RSVPing to event: $e');
    }
  }

  Future<void> deleteEvent(String eventId) async {
    try {
      await _eventsCollection.doc(eventId).delete();
    } catch (e) {
      print('Error deleting event: $e');
    }
  }
}
