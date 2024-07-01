import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/screens/inbox_messages.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(this.judul, this.tempat, this.tanggal, this.waktu,
      {super.key});

  final String judul;
  final String tempat;
  final String tanggal;
  final String waktu;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InboxMessage(
                  judul: judul,
                  tempat: tempat,
                  tanggal: tanggal,
                  waktu: waktu,
                )));
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(tempat, style: const TextStyle(fontSize: 18)),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              Row(
                children: [
                  Text(
                    "$tanggal, $waktu",
                    style: const TextStyle(fontSize: 12),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
