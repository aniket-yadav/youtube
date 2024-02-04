class Product {
  num id;
  String title;
  String description;
  num price;
  String brand;
  String thumbnail;

  Product({
    required this.brand,
    required this.description,
    required this.id,
    required this.price,
    required this.thumbnail,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      brand: json["brand"],
      description: json["description"],
      id: json["id"],
      price: json["price"],
      thumbnail: json["thumbnail"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() => {
        "brand": brand,
        "description": description,
        "id": id,
        "price": price,
        "thumbnail": thumbnail,
        "title": title,
      };
}
