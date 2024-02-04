import 'package:skeletondemo/product.dart';

class Products {
  List<Product> products;

  Products({
    required this.products,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      products:
          json['products'].map<Product>((e) => Product.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "products": products.map((e) => e.toJson()).toList(),
      };
}
