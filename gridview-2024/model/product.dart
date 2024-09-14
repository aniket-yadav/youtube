import 'package:dummy/model/review.dart';

class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? rating;
  String? brand;
  List<Review>? reviews;
  String? thumbnail;
  Product({
    this.brand,
    this.category,
    this.description,
    this.id,
    this.price,
    this.rating,
    this.reviews,
    this.title,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic>? json) => Product(
        brand: json?['brand'],
        category: json?['category'],
        description: json?['description'],
        id: json?['id'],
        price: json?['price'],
        rating: json?['rating'],
        reviews:
            json?['reviews']?.map<Review>((e) => Review.fromJson(e)).toList(),
        title: json?['title'],
        thumbnail: json?['thumbnail'],
      );
}
