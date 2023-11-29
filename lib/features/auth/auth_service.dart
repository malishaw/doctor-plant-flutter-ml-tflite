import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/user_model.dart';

class AuthService {
  static const String key = "user";

  Future<bool> register(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = prefs.getString(key) ?? "";

    if (userJson.isNotEmpty) {
      return false; // User already exists
    }

    prefs.setString(key, jsonEncode(user.toMap()));
    return true; // Registration successful
  }

  Future<bool> login(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = prefs.getString(key) ?? "";

    if (userJson.isEmpty) {
      return false; // User does not exist
    }

    Map<String, dynamic> savedUser = jsonDecode(userJson);

    if (user.username == savedUser['username'] && user.password == savedUser['password']) {
      return true; // Login successful
    } else {
      return false; // Invalid credentials
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) != null;
  }
}
