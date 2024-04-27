import 'package:flutter/material.dart';

class DetailMed extends StatelessWidget {
  final Map med;
  final Function(Map) addToCart;

  const DetailMed({Key? key, required this.med, required this.addToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Icon> rating = List.generate(
        (med["rate"] ?? 0) as int,
        (index) => Icon(
              Icons.star,
              color: Colors.orange,
            ));
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Detail")),
      ),
      body: ListView(
        children: [
          Image.network(med["img"] as String),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              med["name"] as String,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rating,
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Price: Rp ${(med["price"] ?? 0)}",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.add_box,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Price"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Rp ${(med["price"] ?? 0)}"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.category,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Classification"),
                        SizedBox(
                          height: 5,
                        ),
                        Text(med["classification"] as String),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(med['desc'] as String),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                addToCart(med); // Add item to cart
                Navigator.pop(context); // Navigate back to previous screen
              },
              child: Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}
