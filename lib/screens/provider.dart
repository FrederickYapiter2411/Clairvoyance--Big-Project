import 'dart:io';

import 'package:flutter/material.dart';

class User {
  final String username;
  final String email;
  final String password;
  final dynamic profile;
  final String birthdate;

  User(
      {required this.username,
      required this.email,
      required this.password,
      required this.profile,
      required this.birthdate});
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
        password: account['password'],
        profile: account['profile'],
        birthdate: account['birthdate'],
      );
      notifyListeners();
    }
  }

  void addPFP(File value) {
    if (_user != null) {
      print("JALANNNNNNNNNNNNBIASA");
      _user = User(
        username: _user!.username,
        email: _user!.email,
        password: _user!.password,
        profile: value,
        birthdate: _user!.birthdate,
        
      );
      for (var user in listUsers) {
        if (user['email'] == _user!.email &&
            user['password'] == _user!.password) {
          user['profile'] = value;
          print("JALANNNNNNNNNNNNNNNNNNNNNNLOOP");
          print(value);
          break;
        }
      }
      print(value);
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
        'profile': "",
      });
      _user = User(
          username: username, email: email, password: password, profile: "", birthdate: "");
      notifyListeners();
    }
  }

  void updateUserProfile(User updatedUser) {
  if (_user != null) {
    _user = updatedUser;
    for (var user in listUsers) {
      if (user['email'] == _user!.email && user['password'] == _user!.password) {
        user['user_name'] = updatedUser.username;
        user['email'] = updatedUser.email;
        user['birthdate'] = updatedUser.birthdate;
        break;
      }
    }
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
    "user_name": "a",
    "email": "a",
    "password": "a",
    "profile": "",
    "birthdate": "",
  },
  {
    "user_name": "test",
    "email": "test@gmail.com",
    "password": "12345678",
    "profile": "",
    "birthdate": "",
  },
  {
    "user_name": "budiono siregar",
    "email": "budi@gmail.com",
    "password": "12345",
    "profile": "",
    "birthdate": "",
  },
  {
    "user_name": "bot",
    "email": "123",
    "password": "123",
    "profile": "",
    "birthdate": "",
  }
];
