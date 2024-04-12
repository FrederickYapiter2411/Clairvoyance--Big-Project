import 'package:clairvoyant_tubes/screens/inbox.dart';
import 'package:clairvoyant_tubes/screens/settings.dart';
import 'package:clairvoyant_tubes/screens/transaction.dart';
import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/screens/profile.dart';

class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    _HomePage(),
    TransactionHistory(),
    ProfilePage(),
    Settings(),
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
        title: const Text('user@example.com'),
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
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                _buildGridItem('chat with doctor', Icons.chat_bubble),
                _buildGridItem('Asuransiku', Icons.medical_services),
                _buildGridItem('Toko Kesehatan', Icons.store_rounded),
                _buildGridItem('Home Lab & Vaksinasi', Icons.child_care),
                _buildGridItem(
                    'Make offline appointment', Icons.calendar_today),
                _buildGridItem('Kesehatan Mental', Icons.mood),
                _buildGridItem('Kesehatan Kulit', Icons.local_hospital),
                _buildGridItem('See all', Icons.view_list)
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
