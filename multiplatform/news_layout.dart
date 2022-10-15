import 'package:flutter/material.dart';
import 'package:flutternews/news_model.dart';
import 'package:intl/intl.dart';

class NewsLayout extends StatelessWidget {
  final Articles news;
  const NewsLayout({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF060930),
      child: Column(
        children: [
          //  first we have image
          Image(
            image: NetworkImage(news.urlToImage ??
                ''), // network image for showing image with url

            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // on error we are showing this
              return Container(
                height: 200,
                alignment: Alignment.center,
                child: const Text(
                  "Failed to load image",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                ),
              );
            },
          ),

          //  then we are showing author if it's null then unknown
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  news.author ?? 'Unknown',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                ),
                //  date time ,fot this DateTime format you need plugin intl

                Text(
                  DateFormat("dd MMM").format(
                    DateTime.parse(news.publishedAt ?? ''),
                  ),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                )
              ],
            ),
          ),
          //  title of news
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              news.title ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //  and finally content
          // simple right

          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Text(
              news.content ?? '',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
