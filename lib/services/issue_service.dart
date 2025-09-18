import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/issue_model.dart';
import 'package:http/http.dart' as http;

class IssueService {
  Future<IssueModel> createIssue(
    String email,
    String name,
    String content,
    String? photo,
    double? lat,
    double? long,
  ) async {
    bool isloc = true;
    if (lat == null || long == null) {
      isloc = false;
    }
    String url = "https://suvidha-backend-fmw2.onrender.com/submit-issue";
    Map<String, dynamic> bodyTO = isloc
        ? {
            "email": email,
            "name": name,
            "text": content,
            "photo": photo,
            "location": {"longitude": long, "latitude": lat},
          }
        : {"email": email, "name": name, "text": content, "photo": photo};
    String jsonBody = jsonEncode(bodyTO);
    final response = await http.post(
      Uri.parse(url),
      body: jsonBody,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      debugPrint('Response Code Login: ${response.statusCode}');
      final String responseBody = response.body;
      IssueModel issue = IssueModel.fromRawJson(responseBody);

      return issue;
    }
    debugPrint('Response Code Login Failed: ${response.statusCode}');
    throw Exception(jsonDecode(response.body));
  }

  static Future<bool> updateIssueStatus(String ticketId) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;

      final response = await http.post(
        Uri.parse(
          'https://suvidha-backend-fmw2.onrender.com/issues/$ticketId/complete',
        ),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'completion_type': 'user',
          'email': currentUser!.email ?? "admin@g.com",
        }),
      );
      print(response.statusCode);
      print(response.body);
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating issue status: $e');
      return false;
    }
  }

  Future<List<IssueModel>> getIssuesByUser(String email) async {
    String url = "https://suvidha-backend-fmw2.onrender.com/issues/user";
    Map<String, dynamic> bodyTO = {"email": email};
    String jsonBody = jsonEncode(bodyTO);
    final response = await http.post(
      Uri.parse(url),
      body: jsonBody,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      debugPrint('Response Code Get Issues: ${response.statusCode}');
      final String responseBody = response.body;
      List<dynamic> jsonList = jsonDecode(responseBody);
      List<IssueModel> issues = jsonList
          .map((json) => IssueModel.fromJson(json))
          .toList();
      print(responseBody);
      return issues;
    }
    debugPrint('Response Code Get Issues Failed: ${response.statusCode}');
    throw Exception(jsonDecode(response.body));
  }
}
