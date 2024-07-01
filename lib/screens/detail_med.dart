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
        (index) => const Icon(
              Icons.star,
              color: Colors.orange,
            ));
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Detail")),
      ),
      body: ListView(
        children: [
          Image.network(med["img"] as String),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              med["name"] as String,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rating,
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Price: Rp ${(med["price"] ?? 0)}",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: const BoxDecoration(
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
                        const Icon(
                          Icons.add_box,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Price"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Rp ${(med["price"] ?? 0)}"),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.category,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Classification"),
                        const SizedBox(
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
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(med['desc'] as String),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                addToCart(med); // Add item to cart
                Navigator.pop(context); // Navigate back to previous screen
              },
              child: const Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}
