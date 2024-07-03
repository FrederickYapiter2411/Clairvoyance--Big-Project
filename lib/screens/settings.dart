import 'package:clairvoyant_tubes/screens/login.dart';
import 'package:clairvoyant_tubes/screens/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[850] : Colors.blue,
              ),
              child: Stack(
                children: [
                  ClipPath(
                    clipper: BannerClipper(),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.blueGrey,
                      child: Center(
                        child: Text(
                          'Settings Menu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_4),
              title: const Text('Dark mode'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleDarkMode(value);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              onTap: () {
                // Handle language selection
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Handle notifications settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                // Handle about us
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Settings Page Content"),
      ),
    );
  }
}

// Custom Clipper for Banner
class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 30); // Adjust the slant height here
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
