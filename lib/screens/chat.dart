import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clairvoyant_tubes/screens/detail_chat.dart';

class ChatPage extends StatelessWidget {
  final List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
    "doctor5.jpg",
    "doctor6.jpg",
  ];

  final List<bool> activeStatus = [
    true, // doctor1
    false, // doctor2
    true, // doctor3
    false, // doctor4
    true, // doctor5
    true, // doctor6
  ];

  ChatPage({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.chat),
                title: const Text('New Chat'),
                onTap: () {
                  // Handle starting a new chat
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Chat Settings'),
                onTap: () {
                  // Handle chat settings
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter active doctors for the carousel
    List<int> activeIndexes = [];
    List<String> activeImgs = [];
    for (int i = 0; i < imgs.length; i++) {
      if (activeStatus[i]) {
        activeImgs.add(imgs[i]);
        activeIndexes.add(i);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 102, 03, 219),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Messages",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.search, color: Color(0xFF7165D6)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Active Now",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imgs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    width: 65,
                    height: 65,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Stack(
                      textDirection: TextDirection.rtl,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 65,
                            width: 65,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "lib/images/${imgs[index]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(3),
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: activeStatus[index]
                                  ? Colors.green
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Better View",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: activeImgs.map((img) {
                int index = activeImgs.indexOf(img);
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailChat(
                              gambar:
                                  "lib/images/${imgs[activeIndexes[index]]}",
                              name: "Doctor ${activeIndexes[index] + 1}",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("lib/images/$img"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Recent Chat",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: imgs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailChat(
                            gambar: "lib/images/${imgs[index]}",
                            name: "Doctor ${index + 1}",
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "lib/images/${imgs[index]}",
                      ),
                    ),
                    title: Text(
                      "Doctor ${index + 1}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      "Hello, Doctor",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    trailing: const Text(
                      "12.30",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(context),
        backgroundColor: const Color.fromARGB(255, 102, 03, 219),
        child: const Icon(Icons.more_horiz),
      ),
    );
  }
}
