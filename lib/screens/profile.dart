import 'dart:io';

import 'package:clairvoyant_tubes/screens/edit_profile.dart';
import 'package:clairvoyant_tubes/screens/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _selectedImage = File("");

  Future _getImageFromGallery() async {
    XFile? pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);
    if (pickedImage != null) {
      setState(() {
        File file = File(pickedImage.path);
        _selectedImage = file;
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
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CircleAvatar(
              backgroundImage: value.user!.profile != ""
                  ? FileImage(value.user!.profile
                      .path) // KALAU PAKE HP GANTI JADI FileImage(value.user!.profile)
                  : null,
              maxRadius: 130,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    right: -30,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _getImageFromGallery();
                        value.addPFP(_selectedImage);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(side: BorderSide.none) ,
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(180, 60)),
                      child: const Icon(Icons.camera, color: Colors.black,),
                      ),
                ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const editProfilePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      minimumSize: const Size(180, 50)),
                  child: const Text("Edit Profile",
                      style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                        width: 80,
                        child: Center(
                            child: Icon(
                          Icons.person,
                          size: 40,
                        ))),
                    SizedBox(
                      height: 40,
                      child: Text(
                        ' ${user.username}',
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                        width: 80,
                        child: Center(
                            child: Icon(
                          Icons.mail,
                          size: 40,
                        ))),
                    SizedBox(
                      height: 40,
                      child: Text(
                        ' ${user.email}',
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                        width: 80,
                        child: Center(
                            child: Icon(
                          Icons.calendar_month,
                          size: 40,
                        ))),
                    SizedBox(
                      height: 40,
                      child: Text(
                        ' ${user.birthdate}',
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      })),
    );
  }
}
