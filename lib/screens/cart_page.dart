import 'package:clairvoyant_tubes/screens/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/screens/transaction.dart';

class CartPage extends StatefulWidget {
  final List<Map> cartItems;
  final Function(List<Map>) onCartUpdated;

  const CartPage({
    Key? key,
    required this.cartItems,
    required this.onCartUpdated,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool get hasItemsInCart => widget.cartItems.isNotEmpty;

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in widget.cartItems) {
      totalPrice += (item['price'] as double) * (item['amount'] as int);
    }
    return totalPrice;
  }

  void _navigateToPayment(BuildContext context) {
    double totalPrice = calculateTotalPrice();
    String medDetails = widget.cartItems
        .map((item) => '${item["name"]} x${item["amount"]}')
        .join(", ");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(
          medDetails: medDetails,
          totalPrice: totalPrice,
          onPaymentFinalized: (selectedItems) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TransactionHistory(),
              ),
            );
          },
          cartItems: widget.cartItems,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: widget.cartItems.isEmpty
                ? Center(child: Text("Keranjang kosong!"))
                : ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return Dismissible(
                        key: Key(item['name'] as String),
                        onDismissed: (direction) {
                          setState(() {
                            widget.cartItems.removeAt(index);
                            widget.onCartUpdated(widget.cartItems);
                          });
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                        child: ListTile(
                          title: Text(item["name"] as String),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["desc"] as String),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Price: Rp.${item["price"]}"),
                                  Row(
                                    children: [
                                      Text("Amount: "),
                                      SizedBox(
                                        width: 150, // Adjust width as needed
                                        child: Slider(
                                          value: item["amount"].toDouble(),
                                          min: 1,
                                          max: 20, // Adjust max value as needed
                                          divisions: 19,
                                          label: item["amount"].toString(),
                                          onChanged: (double newValue) {
                                            setState(() {
                                              item["amount"] = newValue.toInt();
                                              widget.onCartUpdated(
                                                  widget.cartItems);
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_shopping_cart),
                            onPressed: () {
                              setState(() {
                                widget.cartItems.removeAt(index);
                                widget.onCartUpdated(widget.cartItems);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
          SizedBox(height: 20),
          Text(
            'Total Price: Rp.${calculateTotalPrice()}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed:
                hasItemsInCart ? () => _navigateToPayment(context) : null,
            child: Text('Make Payment'),
          ),
        ],
      ),
    );
  }
}
