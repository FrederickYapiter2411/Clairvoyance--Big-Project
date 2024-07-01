import 'package:clairvoyant_tubes/screens/transaction.dart';
import 'package:flutter/material.dart';

typedef void PaymentFinalizedCallback(List<Map> selectedItems);

class PaymentPage extends StatefulWidget {
  final String medDetails;
  final double totalPrice;
  final PaymentFinalizedCallback onPaymentFinalized;
  final List<Map> cartItems;

  const PaymentPage({
    Key? key,
    required this.medDetails,
    required this.totalPrice,
    required this.onPaymentFinalized,
    required this.cartItems,
  }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Selected Items:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.medDetails,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Text(
              'Total Price: Rp.${widget.totalPrice}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Choose payment method:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedPaymentMethod,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPaymentMethod = newValue!;
                      });
                    },
                    items: <String>[
                      'Credit Card',
                      'PayPal',
                      'Bank Transfer',
                      'Cash on Delivery',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 10),
                PopupMenuButton<String>(
                  onSelected: (String newValue) {
                    setState(() {
                      _selectedPaymentMethod = newValue;
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'Credit Card',
                      child: Text('Credit Card'),
                    ),
                    const PopupMenuItem(
                      value: 'PayPal',
                      child: Text('PayPal'),
                    ),
                    const PopupMenuItem(
                      value: 'Bank Transfer',
                      child: Text('Bank Transfer'),
                    ),
                    const PopupMenuItem(
                      value: 'Cash on Delivery',
                      child: Text('Cash on Delivery'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _finalizePayment(context),
              child: const Text('Finalize Payment'),
            ),
          ],
        ),
      ),
    );
  }

  void _finalizePayment(BuildContext context) {
    List<Map> selectedItems = [];

    selectedItems.addAll(widget.cartItems.map((item) {
      return {
        "name": item["name"],
        "amount": item["amount"],
        "price": item["price"],
      };
    }));

    widget.onPaymentFinalized(selectedItems);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const TransactionHistory(),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment confirmed. Transaction completed.'),
        duration: Duration(seconds: 5),
      ),
    );
  }
}
