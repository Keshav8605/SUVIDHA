import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../models/issue_model.dart';
import 'package:http/http.dart' as http;

class IssueService {
  Future<IssueModel> createIssue(
    String email,
    String name,
    String content,
  ) async {
    String url = "https://cdgi-backend-main.onrender.com/submit-issue";
    Map<String, dynamic> bodyTO = {
      "email": email,
      "name": name,
      "text": content,
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
    throw Exception(jsonDecode(response.body));
  }
}
