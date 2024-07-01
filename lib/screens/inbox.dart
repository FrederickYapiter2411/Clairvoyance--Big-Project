import 'package:clairvoyant_tubes/data/inbox_data.dart';
import 'package:flutter/material.dart';
// import 'package:clairvoyant_tubes/models/messages.dart';
import 'package:clairvoyant_tubes/widgets/card.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
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
              .map((e) => MessageCard(e.judul, e.tempat, e.tanggal, e.waktu)),
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
