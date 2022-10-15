import 'dart:convert';

import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/check_device.dart';
import 'package:flutternews/device_enum.dart';
import 'package:flutternews/news_layout.dart';
import 'package:flutternews/news_model.dart';
import 'package:flutternews/page_transformers.dart';
import 'package:http/http.dart' as http;

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

Hey everyone, 
you have heard that in flutter with single code base you can run your app on web/ desktop, and mobile
so today i am going to show you this
yes
before we start i am using my last video  which was on news so if you have to watch that yet , please do
i am going to convert that to web and desktop 

basically  you don't need anything  else to make your mobile app into website or desktop
app
 you just have to handle some responsiveness and feature which do not support on other
 so to make you app work on all three device/platform 
 first you need to check on whic device you app is running 

 now that you know on which device you are running let's see the changes 
 required to run on all device


Thanks for watching
please subcribe ,like 

  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDevice() != Devices.mobile // i am not showing app bar in mobile  ,so here i am checking if not mobile show app
          ? AppBar(
              title: const Text(
              "Flutter News",
            ))
          : null,
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Align(
                alignment: Alignment.topCenter,
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 600, // next i have constraint my with to 600 so that it don't take full width on web and desktop 
                  ),
                  child: getDevice() == Devices.mobile // here animation used in mobile is not possible/ will not look good on web and desktop
                      ? TransformerPageView( // show i have separated 
                        //  and showing it with 2 different widget for mobile and web/desktop
                          scrollDirection: Axis.vertical,
                          transformer: getDevice() == Devices.mobile
                              ? DepthPageTransformer()
                              : null, 
                        
                          itemBuilder: (context, index) =>
                              NewsLayout(news: newsArticles[index]), // UI /news layout 
                          itemCount: newsArticles.length,
                        ) // for mobile
                      : ListView.builder(
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: NewsLayout(news: newsArticles[index]),
                          ),
                          itemCount: newsArticles.length,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                        ), // listview for web /desktop
                        //  that it 
                        //  by handling situation like this you can develop mobile / web / desktop app with single code base
                        //  lets again see it
                ),
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
        NewsResponse response = NewsResponse.fromJson(jsonDecode(res.body));
        if (response.articles != null && response.articles!.isNotEmpty) {
         
          setState(() {
            newsArticles = response.articles ?? []; // newsarticles
           
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
