import 'package:clairvoyant_tubes/screens/chat.dart';
import 'package:clairvoyant_tubes/screens/inbox.dart';
import 'package:clairvoyant_tubes/screens/provider.dart';
import 'package:clairvoyant_tubes/screens/settings.dart';
import 'package:clairvoyant_tubes/screens/shop.dart';
import 'package:clairvoyant_tubes/screens/transaction.dart';
import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/screens/profile.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final User user;

  Home({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    _HomePage(),
    TransactionHistory(),
    ProfilePage(),
    SettingsPage(),
  ];

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> title = ["Home", "Transaction History", "Profile", "Settings"];

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var username = userProvider.user?.username ?? "Guest";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(title[_selectedIndex]),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Inbox()));
              },
              icon: const Icon(Icons.mail))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, $username!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: _children[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Transaction History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildGridItem(
                  'Chat with Doctor',
                  Icons.chat_bubble,
                  () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChatPage()));
                  },
                ),
                _buildGridItem(
                  'Health Shop',
                  Icons.store_rounded,
                  () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Shop()));
                  },
                ),
                _buildGridItem(
                  'Make Offline Appointment',
                  Icons.calendar_today,
                  () {},
                ),
                _buildGridItem(
                  'Mental Health',
                  Icons.mood,
                  () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Feature Unavailable'),
                          content:
                              Text('Sorry, this feature is still unavailable.'),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: Colors.blue,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
