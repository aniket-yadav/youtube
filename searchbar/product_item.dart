import 'package:dummy/model/product.dart';
import 'package:dummy/product_details.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    product: product,
                  ),
                ),
              );
            },
            child: Hero(
              tag: product.thumbnail ?? '',
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFD5DCDE),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Image.network(
                  product.thumbnail ?? '',
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
              tag: product.title ?? '',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  product.title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "\$ ${product.price}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
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
                "${product.rating}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
