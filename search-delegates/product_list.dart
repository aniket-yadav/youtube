import 'package:dummy/model/product.dart';
import 'package:dummy/product_item.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        });
  }
}
