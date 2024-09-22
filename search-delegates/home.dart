import 'dart:convert';

import 'package:dummy/model/product.dart';
import 'package:dummy/model/product_response.dart';
import 'package:dummy/product_details.dart';
import 'package:dummy/product_search_delegates.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  List<Product> products = List<Product>.empty();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Products"),
        elevation: 6,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: ProductSearchDelegates(products: products));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          product: products[index],
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: products[index].thumbnail ?? '',
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD5DCDE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Image.network(
                        products[index].thumbnail ?? '',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: Colors.transparent,
                  child: Hero(
                    tag: products[index].title ?? '',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        products[index].title ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$ ${products[index].price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                    ),
                    Text(
                      "${products[index].rating}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  getProducts() async {
    var res = await http.get(Uri.https("dummyjson.com", "products"));
    ProductResponse response = ProductResponse.fromJson(jsonDecode(res.body));
    setState(() {
      products = response.products ?? [];
    });
  }
}
