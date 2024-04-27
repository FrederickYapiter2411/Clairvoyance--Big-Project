import 'package:flutter/material.dart';

class DetailChat extends StatelessWidget {
  DetailChat({super.key, required this.gambar, required this.name});

  String gambar;
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B202D),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(gambar),
                ),
                const SizedBox(width: 15),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: ('Quicksand'),
                      color: Colors.white70),
                ),
                const Spacer(),
                const Icon(
                  Icons.search_rounded,
                  color: Colors.white70,
                  size: 40,
                )
              ],
            ),
            const SizedBox(height: 30),
            const Center(
                child: Text("Today 12:30",
                    style: TextStyle(color: Colors.white70))),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff373E4E),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Hello! How are you doing?",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 300.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff7A8194),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "I'm good! It's all great!",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff3D4354),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: 270,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Message",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
