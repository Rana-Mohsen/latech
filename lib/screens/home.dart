import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/sale_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List saleItems = [];

  CollectionReference saleRef = FirebaseFirestore.instance.collection("sales");

  getSale() async {
    var responsebody = await saleRef.get();
    responsebody.docs.forEach((element) {
      setState(() {});

      saleItems.add(element.data());
    });
  }

  @override
  void initState() {
    getSale();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 45, bottom: 20),
          child: Text(
            "Sales",
            style: TextStyle(
                color: Color(0xff0a1034),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 235,
          child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: saleItems.length,
              itemBuilder: (context, i) {
                // print(saleItems[i]['image']);
                // print(saleItems[i]['category']);
                // print(saleItems[i]['sale']);
                return SaleItem(
                  sale: saleItems[i]['sale'],
                  image: saleItems[i]['image'],
                  category: saleItems[i]['category'],
                );
              }),
        ),
      ],
    );
  }
}
