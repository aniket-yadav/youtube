import 'package:dummy/model/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Hero(
          tag: widget.product.title ?? '',
          child: Material(
            color: Colors.transparent,
            child: Text(
              widget.product.title ?? '',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.product.thumbnail ?? '',
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD5DCDE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Image.network(
                    widget.product.thumbnail ?? '',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.product.title ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  Text(
                    "\$ ${widget.product.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
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
                    "${widget.product.rating}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  Hero(
                    tag: ValueKey(widget.product),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.amberAccent),
                      ),
                      onPressed: () {},
                      child: const Text("Add To Cart"),
                    ),
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.product.description ?? '',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const Divider(),
              ...?widget.product.reviews?.map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.reviewerName ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "${e.rating}",
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        e.comment ?? "",
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
