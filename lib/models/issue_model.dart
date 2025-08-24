import 'dart:convert';

class IssueModel {
  final String ticketId;
  final String category;
  final String address;
  final Location? location; // nullable
  final String description;
  final String title;
  final String? photo; // nullable
  final String status;
  final String createdAt;
  final List<String> users;
  final int issueCount;
  final String originalText;

  IssueModel({
    required this.ticketId,
    required this.category,
    required this.address,
    required this.location,
    required this.description,
    required this.title,
    required this.photo,
    required this.status,
    required this.createdAt,
    required this.users,
    required this.issueCount,
    required this.originalText,
  });

  factory IssueModel.fromRawJson(String str) =>
      IssueModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssueModel.fromJson(Map<String, dynamic> json) => IssueModel(
    ticketId: json["ticket_id"],
    category: json["category"],
    address: json["address"],
    location: json["location"] != null
        ? Location.fromJson(json["location"])
        : null,
    description: json["description"],
    title: json["title"],
    photo: json["photo"], // may be null
    status: json["status"],
    createdAt: json["created_at"],
    users: List<String>.from(json["users"].map((x) => x)),
    issueCount: json["issue_count"],
    originalText: json["original_text"],
  );

  Map<String, dynamic> toJson() => {
    "ticket_id": ticketId,
    "category": category,
    "address": address,
    "location": location?.toJson(), // use ? for null safety
    "description": description,
    "title": title,
    "photo": photo,
    "status": status,
    "created_at": createdAt,
    "users": List<dynamic>.from(users.map((x) => x)),
    "issue_count": issueCount,
    "original_text": originalText,
  };
}

class Location {
  final double longitude;
  final double latitude;

  Location({required this.longitude, required this.latitude});

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    longitude: (json["longitude"] ?? 0).toDouble(),
    latitude: (json["latitude"] ?? 0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
  };
}
