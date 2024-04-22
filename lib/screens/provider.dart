import 'package:clairvoyant_tubes/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void login(String username, String password) {
    // Logic to validate user credentials
    if (username == 'testing' && password == 'testing') {
      _user = User(username: username, password: password);
      notifyListeners();
    } else {
      // Invalid credentials, you can handle this in your UI or other logic
      // For example, you might show an error message to the user
      // or navigate them to a different screen
    }
  }

  void logout() {
    // Simply set the user to null and notify listeners
    _user = null;
    notifyListeners();
  }

  void register(String username, String password) {
    // Check if the username is already taken
    if (isUsernameTaken(username)) {
      // Notify the user that the username is already taken
      // You can handle this in your UI or other logic
      // For example, you might show an error message to the user
      // or prompt them to choose a different username
      return;
    }

    // Create a new User object with the provided username and password
    _user = User(username: username, password: password);

    // Notify listeners that the user has been registered
    notifyListeners();

    // Optionally, you might want to perform additional actions here, such as saving the user data to a database
  }

  // Mock function to check if a username is already taken
  bool isUsernameTaken(String username) {
    // In a real application, you would typically check against a database or some other data source
    // For demonstration purposes, we'll assume 'testing' is the only taken username
    return username == 'testing';
  }
}
