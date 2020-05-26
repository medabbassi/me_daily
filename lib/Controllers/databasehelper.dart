import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "";
  var status;
  var token;

  loginData(String email, String password) async {
    String myURL = "";

    final response = await http.post(myURL,
        headers: {'Accept': 'application/json'},
        body: {"email": "$email", "password": "$password"});
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data: ${data["error"]}');
    } else {
      print('data: ${data["token"]}');
      _save(data["token"]);
    }
  }

  registrationData(String firstName, String lastName, String email,
      String phoneNumber, String password) async {
    String myUrl2 = "";
    final response = await http.post(myUrl2, headers: {
      'Accept': 'application/json'
    }, body: {
      "firstName": "$firstName",
      "lastName": "$lastName",
      "email": "$email",
      "phoneNumber": "$phoneNumber",
      "password": "$password"
    });
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data: ${data["token"]}');
      _save(data["token"]);
    }
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
