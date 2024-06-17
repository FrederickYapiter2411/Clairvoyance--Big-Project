import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/screens/inbox.dart';

// ignore: must_be_immutable
class InboxMessage extends StatelessWidget {
  InboxMessage(
      {super.key,
      required this.judul,
      required this.tempat,
      required this.mulai,
      required this.selesai});

  String judul;
  String tempat;
  String mulai;
  String selesai;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 80, right: 80, top: 80, bottom: 40),
            child: Image.asset('lib/images/health.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              judul,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          Text(tempat,
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Text("$mulai s/d $selesai", style: const TextStyle(color: Colors.grey)),
          const Spacer(),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Inbox()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(24),
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          const Spacer()
        ],
      ),
    );
  }
}
