import 'dart:convert';

import 'package:http/http.dart' as http;

createAccessCode(skTest) async {
  // skTest -> Secret key
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $skTest'
  };
  Map data = {"amount": 600, "email": "johnsonoye34@gmail.com"};
  String payload = json.encode(data);
  return null;
}
