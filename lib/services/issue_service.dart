import 'dart:convert';
import 'dart:ffi';

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
    String url = "https://cdgi-backend-main.onrender.com/submit-issue";
    Map<String, dynamic> bodyTO = {
      "email": email,
      "name": name,
      "text": content,
      "photo": photo,
      "location": {"longitude": long, "latitude": lat},
    };
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
    print(jsonDecode(response.body));
    throw Exception(jsonDecode(response.body));
  }

  Future<List<IssueModel>> getIssuesByUser(String email) async {
    String url = "https://cdgi-backend-main.onrender.com/issues/user";
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
      return issues;
    }
    debugPrint('Response Code Get Issues Failed: ${response.statusCode}');
    throw Exception(jsonDecode(response.body));
  }
}
