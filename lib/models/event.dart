import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime dateTime;
  final String location;
  final String creatorId;
  final String creatorName;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.dateTime,
    required this.location,
    required this.creatorId,
    required this.creatorName,
  });

  factory Event.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Event(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      dateTime: (data['dateTime'] as Timestamp).toDate(),
      location: data['location'] ?? '',
      creatorId: data['creatorId'] ?? '',
      creatorName: data['creatorName'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'dateTime': Timestamp.fromDate(dateTime),
      'location': location,
      'creatorId': creatorId,
      'creatorName': creatorName,
    };
  }
}
