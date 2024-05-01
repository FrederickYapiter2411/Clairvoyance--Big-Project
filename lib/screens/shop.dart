import 'package:flutter/material.dart';
import 'package:clairvoyant_tubes/screens/cart_page.dart';
import 'package:clairvoyant_tubes/screens/detail_med.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<Map> meds = [
    {
      "name": "Acetaminophen (Tylenol)",
      "img": "lib/images/meds/tylenol.png",
      "desc":
          "Obat golongan analgesik untuk pereda rasa nyeri dan penurun demam.",
      "price": 4000,
      "classification": "Analgesic",
    },
    {
      "name": "Ibuprofen (Advil, Motrin)",
      "img": "lib/images/meds/motrin.png",
      "desc": "Obat yang digunakan untuk mengurangi demam dan nyeri.",
      "price": 6000,
      "classification": "Analgesic",
    },
    {
      "name": "Aspirin",
      "img": "lib/images/meds/aspirin.png",
      "desc": "Obat untuk meredakan nyeri, demam, dan peradangan.",
      "price": 3000,
      "classification": "Analgesic",
    },
    {
      "name": "Amoxicillin",
      "img": "lib/images/meds/amoxicillin.png",
      "desc":
          "Obat antibiotik untuk mengatasi infeksi bakteri, seperti sakit tenggorokan, diare, pneumonia dan infeksi telinga.",
      "price": 4000,
      "classification": "Antibiotic",
    },
    {
      "name": "Ciprofloxacin (Cipro)",
      "img": "lib/images/meds/ciprofloxacin.png",
      "desc":
          "Obat antibiotik golongan quinolone, bekerja dengan cara menghambat enzim topoisomerase IV dan DNA gyrase yang diperlukan oleh bakteri untuk memperbanyak diri.",
      "price": 4000,
      "classification": "Antibiotic",
    },
    {
      "name": "Penicillin",
      "img": "lib/images/meds/penicillin.png",
      "desc": "Antibiotik yang digunakan untuk mengobati infeksi bakteri.",
      "rate": 5,
      "price": 4000,
      "classification": "Antibiotic",
    },
    {
      "name": "Sertraline (Zoloft)",
      "img": "lib/images/meds/zoloft.png",
      "desc":
          "Obat antidepresan yang termasuk golongan penghambat ambilan yang spesifik dari Serotonin/Selective Serotonin Reuptake Inhibitors (SSRI).",
      "price": 4000,
      "classification": "Antidepressant",
    },
    {
      "name": "Fluoxetine (Prozac)",
      "img": "lib/images/meds/prozac.png",
      "desc":
          "Obat untuk mengatasi depresi, gangguan obsesif kompulsif (OCD), gangguan disforik pramenstruasi, bulimia, atau serangan panik.",
      "price": 4000,
      "classification": "Antidepressant",
    },
    {
      "name": "Escitalopram (Lexapro)",
      "img": "lib/images/meds/lexapro.png",
      "desc":
          "Obat ini digunakan untuk mengobati gangguan mental/mood tertentu (seperti depresi , kecemasan).",
      "price": 4000,
      "classification": "Antidepressant",
    },
    {
      "name": "Amlodipine (Norvasc)",
      "img": "lib/images/meds/norvasc.png",
      "desc":
          "Obat yang mengandung amlodipine, zat aktif yang digunakan untuk mengatasi tekanan darah tinggi..",
      "price": 4000,
      "classification": "Antihypertension",
    },
    {
      "name": "Lisinopril (Prinivil, Zestril)",
      "img": "lib/images/meds/lisinopril.png",
      "desc":
          "Obat untuk menurunkan tekanan darah pada penderita hipertensi sehingga risiko terjadinya komplikasi, seperti serangan jantung atau stroke, akan berkurang. Obat ini juga digunakan pada pasien gagal jantung atau pascaserangan jantung.",
      "price": 4000,
      "classification": "Antihypertension",
    },
    {
      "name": "Metoprolol (Lopressor)",
      "img": "lib/images/meds/metoprolol.png",
      "desc":
          "Obat ini biasanya digunakan untuk mengobati tekanan darah tinggi, nyeri dada (angina), dan gagal jantung.",
      "price": 4000,
      "classification": "Antihypertension",
    }
  ];

  List<Map> cartItems = [];
  List<String> classifications = [];
  List<Map> filteredMeds = [];

  List<String> selectedClassifications = [];

  @override
  void initState() {
    super.initState();
    classifications =
        meds.map((e) => e["classification"] as String).toSet().toList();
    filteredMeds = List.from(meds);
  }

  void addToCart(Map newItem) {
    bool itemExists = cartItems.any((item) => item["name"] == newItem["name"]);

    if (itemExists) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Item Already in Cart"),
            content: Text("This item is already in your cart."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        newItem['amount'] = 1;
        cartItems.add(newItem);
      });
    }
  }

  void updateCartItems(List<Map> newCartItems) {
    setState(() {
      cartItems = newCartItems;
    });
  }

  void filterMedicines(List<String> selectedClassifications) {
    setState(() {
      if (selectedClassifications.isEmpty) {
        filteredMeds = List.from(meds);
      } else {
        filteredMeds = meds
            .where((med) =>
                selectedClassifications.contains(med["classification"]))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("List Obat")),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartPage(
                  cartItems: cartItems,
                  onCartUpdated: updateCartItems,
                ),
              ));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: classifications.map((classification) {
                return FilterChip(
                  label: Text(classification),
                  selected: selectedClassifications.contains(classification),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedClassifications.add(classification);
                      } else {
                        selectedClassifications.remove(classification);
                      }
                      filterMedicines(selectedClassifications);
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: filteredMeds.map((e) {
                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(e["img"] as String),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return DetailMed(
                                  med: e,
                                  addToCart: addToCart,
                                );
                              }),
                            );
                          },
                          child: Text(e["name"] as String),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
