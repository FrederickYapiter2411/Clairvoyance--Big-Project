import 'package:clairvoyant_tubes/screens/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage ({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User? user = userProvider.user;

    if (user == null) {
      return const Center(
        child: Text('No user logged in.'),
      );
    }
    return  Scaffold(
      body: Center(
        child: Column(
            children: [
              const SizedBox(height: 10,),
              const CircleAvatar(
                backgroundImage: AssetImage("lib/images/profilePic.jpg"),
                maxRadius: 130,
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      minimumSize: const Size(180, 50)
                    ),
                    child: const Text("Edit Profile", style: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(height: 30,),

                  Row(
                    children: [
                      const SizedBox(
                        width: 80 ,
                        child: Center(
                          child: Icon(Icons.person, size: 40, ))),

                      SizedBox(
                        height: 40,
                        child: Text(
                          ' ${user.username}',
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30,),

                  Row(
                    children: [
                      const SizedBox(
                        width: 80 ,
                        child: Center(
                          child: Icon(Icons.mail, size: 40, ))),

                      SizedBox(
                        height: 40,
                        child: Text(
                          ' ${user.email}',
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(
                        width: 80 ,
                        child: Center(
                          child: Icon(Icons.calendar_month, size: 40, ))),

                      SizedBox(
                        height: 40,
                        child: Text(
                          ' ${user.email}',
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),

                ],
              )
            ],
          ),
        ),  
    );
  }
}
