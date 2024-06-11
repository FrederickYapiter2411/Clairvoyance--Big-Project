import 'package:flutter/material.dart';

class User {
  final String username;
  final String email;
  final String password;

  User({required this.username, required this.email, required this.password});
}

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void login(String username, String password) {
    var account = listUsers.firstWhere(
        (user) => user['user_name'] == username && user['password'] == password,
        orElse: () => {});
    if (account.isNotEmpty) {
      _user = User(
          username: account['user_name'],
          email: account['email'],
          password: account['password']);
      notifyListeners();
    }
  }

  void register(String username, String email, String password) {
    var accountExist =
        listUsers.where((user) => user['email'] == email).toList();

    if (accountExist.isEmpty) {
      listUsers.add({
        'user_name': username,
        'email': email,
        'password': password,
      });
      _user = User(username: username, email: email, password: password);
      notifyListeners();
    }
  }

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}

List<Map<String, dynamic>> listUsers = [
  {
    "user_name": "test",
    "email": "test@gmail.com",
    "password": "12345678",
  },
  {
    "user_name": "budiono siregar",
    "email": "budi@gmail.com",
    "password": "12345",
  },
  {
    "user_name": "bot",
    "email": "123",
    "password": "123",
  }
];
