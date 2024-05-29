import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/models/messages.dart';
import 'package:clairvoyant_tubes/widgets/card.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<MessageData> messageDatas = [
    MessageData(
        judul: "Check-Up",
        tempat: "Ruangan A Lantai 3",
        mulai: "08.00",
        selesai: "10.00"),
    MessageData(
        judul: "Pengambilan Obat",
        tempat: "Gudang Farmasi",
        mulai: "10.00",
        selesai: "10.30"),
    MessageData(
        judul: "Rontgen",
        tempat: "Ruang Radiologi",
        mulai: "13.00",
        selesai: "15.00")
  ];

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
                leading: Icon(Icons.delete),
                title: Text('Delete All Messages'),
                onTap: () {
                  // Handle deleting all messages
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 102, 03, 219),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ...messageDatas
              .map((e) => MessageCard(e.judul, e.tempat, e.mulai, e.selesai)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(context),
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 102, 03, 219),
      ),
    );
  }
}
