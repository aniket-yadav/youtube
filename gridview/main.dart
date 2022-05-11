import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  data to show
  List<String> _products = [
    "https://dummyjson.com/image/i/products/1/thumbnail.jpg",
    "https://dummyjson.com/image/i/products/2/thumbnail.jpg",
    "https://dummyjson.com/image/i/products/3/thumbnail.jpg",
    "https://dummyjson.com/image/i/products/4/thumbnail.jpg",
    "https://dummyjson.com/image/i/products/5/thumbnail.jpg",
    "https://dummyjson.com/image/i/products/6/thumbnail.png",
    "https://dummyjson.com/image/i/products/7/thumbnail.jpg",
    "https://dummyjson.com/image/i/products/8/thumbnail.jpg",
    "https://dummyjson.com/image/i/products/9/thumbnail.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const FittedBox(
            child: Text(
              "Grid View",
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: _products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Image.network(_products[index]),
                );
              }),
        ));
  }
}
