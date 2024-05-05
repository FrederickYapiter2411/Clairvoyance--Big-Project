import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/models/transaction_detail.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  late List<Transaction> transactions;
  late List<Transaction> filteredTransactions;
  late String selectedFilter;
  final List<String> _method = [
    "All",
    "Cash on Delivery",
    "PayPal",
    "Credit Card",
    "Bank Transfer"
  ];

  @override
  void initState() {
    super.initState();
    transactions = [
      Transaction(title: 'Aspirin', method: 'Cash on Delivery', price: 5000.0),
      Transaction(title: 'Tylenol', method: 'PayPal', price: 2000.0),
      Transaction(title: 'Amoxicillin', method: 'Credit Card', price: 1000.0),
      Transaction(title: 'Penicillin', method: 'Bank Transfer', price: 3000.0),
      Transaction(title: 'Prozac', method: 'Cash on Delivery', price: 4000.0),
    ];
    filteredTransactions = transactions;
    selectedFilter = "All";
  }

  void _filterTransactions(String filter) {
    setState(() {
      selectedFilter = filter;
      filteredTransactions = transactions;
      if (filter == 'All') {
      } else {
        filteredTransactions = transactions
            .where((transaction) => transaction.method == filter)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              children: _method.map((e) {
                return FilterChip(
                  backgroundColor: Colors.blueAccent,
                  selectedColor: Colors.blueAccent,
                  label: Text(
                    e,
                    style: const TextStyle(color: Colors.white),
                  ),
                  selected: selectedFilter == e,
                  onSelected: (selected) {
                    _filterTransactions(selected ? e : 'All');
                  },
                );
              }).toList(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = filteredTransactions[index];
                  return ListTile(
                    title: Text(transaction.title),
                    subtitle: Text(transaction.method),
                    trailing: Text(
                      '\Rp ${transaction.price.toStringAsFixed(2)},-',
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
