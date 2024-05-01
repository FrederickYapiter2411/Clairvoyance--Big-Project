import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  final List<Map> selectedItems;

  const TransactionHistory({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: widget.selectedItems.length,
        itemBuilder: (context, index) {
          final item = widget.selectedItems[index];
          return ListTile(
            title: Text(item['name'] ?? ''),
            subtitle: Text('Quantity: ${item['amount']}'),
          );
        },
      ),
    );
  }
}
