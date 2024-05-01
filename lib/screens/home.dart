import 'package:clairvoyant_tubes/screens/chat.dart';
import 'package:clairvoyant_tubes/screens/inbox.dart';
import 'package:clairvoyant_tubes/screens/settings.dart';
import 'package:clairvoyant_tubes/screens/shop.dart';
import 'package:clairvoyant_tubes/screens/transaction.dart';
import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/screens/profile.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({required this.username});

  final String username;

  @override
  _MyHomePageState createState() => _MyHomePageState(username1: username);
}

class _MyHomePageState extends State<Home> {
  _MyHomePageState({required this.username1});

  final String username1;
  int _selectedIndex = 0;

  final List<Widget> _children = [
    _HomePage(),
    TransactionHistory(
      selectedItems: [],
    ),
    ProfilePage(),
    SettingsPage(),
  ];

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username1),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Inbox()));
              },
              icon: const Icon(Icons.mail))
        ],
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Transaction History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
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
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ChatPage()));
                    },
                    child: _buildGridItem(
                      'chat with doctor',
                      Icons.chat_bubble,
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Shop()));
                  },
                  child: _buildGridItem('Toko Kesehatan', Icons.store_rounded),
                ),
                _buildGridItem(
                    'Make offline appointment', Icons.calendar_today),
                _buildGridItem('Kesehatan Mental', Icons.mood),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String title, IconData icon) {
    return InkWell(
      onTap: () {},
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
