import 'package:clairvoyant_tubes/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool DarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkMode ? Colors.black : Colors.white,
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.brightness_4),
            title: Text('Dark mode',
            style: TextStyle(color: !DarkMode ? Colors.black : Colors.white ),),
            trailing: Switch(
              value: DarkMode,
              onChanged: (value) {
                setState(() {
                  DarkMode = value;
                });
              },
              
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title:  Text('Language',
            style: TextStyle(color: !DarkMode ? Colors.black : Colors.white ),),
            onTap: () {
              // Handle language selection
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title:  Text('Notifications',
            style: TextStyle(color: !DarkMode ? Colors.black : Colors.white ),),
            onTap: () {
              // Handle notifications settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title:  Text('About Us', 
            style: TextStyle(color: !DarkMode ? Colors.black : Colors.white ),),
            onTap: () {
              // Handle notifications settings
            },
          ),
          TextButton(
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login(),), (route) => false);
              },
              child:
              const Text("Logout",style: TextStyle(fontSize: 16.0, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}