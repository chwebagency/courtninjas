import 'package:flutter/material.dart';
import '../models/event.dart';
import '../services/event_service.dart';

class EventProvider with ChangeNotifier {
  final EventService _eventService = EventService();
  List<Event> _events = [];
  bool _isLoading = false;

  List<Event> get events => _events;
  bool get isLoading => _isLoading;

  Future<void> fetchEvents() async {
    _isLoading = true;
    notifyListeners();
    _events = await _eventService.getEvents();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> createEvent(Event event) async {
    _isLoading = true;
    notifyListeners();
    await _eventService.createEvent(event);
    await fetchEvents(); // Refresh the list after creating a new event
    _isLoading = false;
    notifyListeners();
  }

  Future<Event?> getEventById(String eventId) async {
    return await _eventService.getEventById(eventId);
  }

  Future<void> rsvpToEvent(String eventId, String userId, String status) async {
    await _eventService.rsvpToEvent(eventId, userId, status);
    // Optionally, you might want to refresh the specific event data
    // to reflect the new RSVP status in the UI.
    notifyListeners();
  }
}
