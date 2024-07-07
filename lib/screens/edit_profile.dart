import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package for DateFormat
import 'package:provider/provider.dart';
import 'package:clairvoyant_tubes/screens/provider.dart'; // Update this with your actual import path

class editProfilePage extends StatefulWidget {
  const editProfilePage({Key? key}) : super(key: key);

  @override
  _editProfilePageState createState() => _editProfilePageState();
}

class _editProfilePageState extends State<editProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with current user data if available
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
      User? user = userProvider.user;
      if (user != null) {
        _usernameController.text = user.username;
        _emailController.text = user.email;
        _setFormattedBirthdate(user.birthdate); // Set formatted birthdate
      }
    });
  }

  void _setFormattedBirthdate(String? birthdate) {
    if (birthdate != null && birthdate.isNotEmpty) {
      DateTime parsedDate = DateTime.parse(birthdate); // Parse birthdate string to DateTime
      String formattedDate = DateFormat.yMMMMd().format(parsedDate); // Format to full month name
      setState(() {
        _birthdateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User? user = userProvider.user;

    if (user == null) {
      return const Center(
        child: Text('No user logged in.'),
      );
    }

    return Scaffold(
      body: Center(
        child: Consumer<UserProvider>(builder: (context, value, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _birthdateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Birthdate',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      _setFormattedBirthdate(pickedDate.toString());
                    }
                  },
                ),
                const SizedBox(height: 16.0),

                ElevatedButton(
                  onPressed: () {
                    // Save changes to user profile
                    User updatedUser = User(
                      username: _usernameController.text,
                      email: _emailController.text,
                      birthdate: _birthdateController.text,
                      profile: user.profile, // assuming profile is also part of user
                      password: user.password,
                    );
                    Navigator.pop(context);
                    value.updateUserProfile(updatedUser);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
