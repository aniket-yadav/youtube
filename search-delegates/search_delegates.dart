import 'package:dummy/model/product.dart';
import 'package:dummy/product_list.dart';
import 'package:flutter/material.dart';

class ProductSearchDelegates extends SearchDelegate {
  ProductSearchDelegates({required this.products});

  final List<Product> products;
  List<Product> results = <Product>[];

  @override
  String? get searchFieldLabel => "Enter keywords...";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
      backgroundColor: Colors.amberAccent,
    ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query.isEmpty ? close(context, null) : query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return results.isEmpty
        ? const Center(
            child: Text('No Results', style: TextStyle(fontSize: 20)),
          )
        : ProductList(products: results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    results =
        [...products].where((e) => e.title?.contains(query) == true).toList();
    return results.isEmpty
        ? const Center(
            child: Text('No Results', style: TextStyle(fontSize: 24)),
          )
        : ProductList(products: results);
  }
}
