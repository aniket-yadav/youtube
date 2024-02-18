/*

  add_to_cart_animation: ^2.0.3  


*/

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:addtocartanimationdemo/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  Function(GlobalKey)? runAddToCartAnimation;
  var _cartQuantityItems = 0;

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.9,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: false,
      ),
      createAddToCartAnimation: (addToCart) {
        runAddToCartAnimation = addToCart;
      },
      jumpAnimation: const JumpAnimationOptions(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add To Cart"),
          actions: [
            if (_cartQuantityItems > 0)
              IconButton(
                icon: const Icon(Icons.remove_shopping_cart),
                onPressed: () {
                  _cartQuantityItems = 0;
                  cartKey.currentState!.runClearCartAnimation();
                  setState(() {});
                },
              ),
            const SizedBox(width: 16),
            AddToCartIcon(
              key: cartKey,
              icon: const Icon(Icons.shopping_cart),
              badgeOptions: BadgeOptions(
                active: (_cartQuantityItems > 0),
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              key: UniqueKey(),
              product: products[index],
              addToCartClick: addToCartClick,
            );
          },
        ),
      ),
    );
  }

  void addToCartClick(GlobalKey widgetKey) async {
    if (runAddToCartAnimation != null) {
      await runAddToCartAnimation!(widgetKey);
      await cartKey.currentState!
          .runCartAnimation((++_cartQuantityItems).toString());
      setState(() {});
    }
  }
}

class ProductCard extends StatelessWidget {
  final dynamic product;
  final Function(GlobalKey) addToCartClick;
  final GlobalKey widgetKey = GlobalKey();

  ProductCard({super.key, this.product, required this.addToCartClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                key: widgetKey,
                child: Image.network(
                  product["image"],
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Text(
                  product['title'],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price: \$${product['price']}",
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.star_rate,
                color: Colors.yellow,
              ),
              Text(
                "${product['rating']['rate']} (${product['rating']['count']})",
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              addToCartClick(widgetKey);
            },
            child: const Text(
              "Add To Cart",
              style: TextStyle(
                color: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
