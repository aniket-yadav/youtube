import 'package:testhero/model/product.dart';

class ProductResponse {
  List<Product>? products;
  ProductResponse({this.products});

  factory ProductResponse.fromJson(Map<String, dynamic>? json) =>
      ProductResponse(
          products: json?['products']
              ?.map<Product>((e) => Product.fromJson(e))
              .toList());
}
