/*
add this plugins
  another_transformer_page_view: ^2.0.0 # this is for pageview
  http: ^0.13.5 # api call
  intl: ^0.17.0 # data formatting



*/


import 'dart:convert';

import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/news_model.dart';
import 'package:flutternews/page_transformers.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterNews(),
    );
  }
}

class FlutterNews extends StatefulWidget {
  const FlutterNews({super.key});

  @override
  State<FlutterNews> createState() => _FlutterNewsState();
}

class _FlutterNewsState extends State<FlutterNews> {
  List<Articles> newsArticles = [];
  bool _loading = false;
  @override
  void initState() {
    getNews();
    super.initState();
  }

  /*
Hey everyone , Today we are going to build a simple news app
with the help of newsorg api
let's see
you need a api key to call these api 
and getting api key is really simple
you just have to give email id and name etc that all
so lets see how app then i'll explain how i did it

okay so let's start with ui
let's see plugin 

app flow id simle on init i'm calling getNEws method

this is all about getting data and showing it 
but how am i showing this animation 
so for this animation you need 
that's all 
Thanks for watching
please like ,comment and subcribe



  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : TransformerPageView(
                // i am showing data in pageview and that even in transformer pageview
                scrollDirection: Axis.vertical,
                transformer:
                    DepthPageTransformer(), // this is the animation which i am using
                //  we will see more about this widget/plugin in some other video
                itemBuilder: (context, index) => Container(
                  color: const Color(0xFF060930),
                  child: Column(
                    children: [
                      //  first we have image
                      Image(
                        image: NetworkImage(newsArticles[index].urlToImage ??
                            ''), // network image for showing image with url
                        width: double.infinity,
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
                              newsArticles[index].author ?? 'Unknown',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white60,
                              ),
                            ),
                            //  date time ,fot this DateTime format you need plugin intl

                            Text(
                              DateFormat("dd MMM").format(
                                DateTime.parse(
                                    newsArticles[index].publishedAt ?? ''),
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
                          newsArticles[index].title ?? '',
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
                          newsArticles[index].content ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: newsArticles.length,
              ),
      ),
    );
  }

  getNews() async {
    setState(() {
      _loading = true;
    });
    try {
      //  where i am call newsorg api with http plugin's help
      // https://newsapi.org/v2/top-headlines?country=us&apiKey=562838d733f0476d8e981f6038bf6cdc
      var res = await http.get(
        Uri.https("newsapi.org", 'v2/top-headlines',
            {'country': 'in', 'apiKey': '562838d733f0476d8e981f6038bf6cdc'}),
      );
      if (res.statusCode == 200) {
        //  after succesful response converting json to dart object
        //  let's see model class
        NewsResponse response = NewsResponse.fromJson(jsonDecode(res.body));
        if (response.articles != null && response.articles!.isNotEmpty) {
          //  now after getting response i am storing it in
          setState(() {
            newsArticles = response.articles ?? []; // newsarticles
            //  yeah while this is happening i 'm showing a loading
          });
        }
      }
    } catch (_) {
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
