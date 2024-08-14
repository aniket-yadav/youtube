import 'package:flutter/material.dart';

//https://api.slingacademy.com/public/sample-photos/$index.jpeg
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*
 Hey Everyone , Today we are going to see new widget added in flutter vrsion 3.24 
 i.e. CarouselView
 earlier we had to use external plugin for it 
 but fromnow on we don't need that
 so i have already created code and everything so let's see it

  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(
            // remember carousel is a widget which requires height , so don't miss this
            height: 250,
            child: CarouselView(
              // here is our new widget
              elevation: 2,
              onTap: (tapIndex) {
                // this also give onTap option
                _showImageDialog(
                    context, // here we are just popping the image on Tap
                    "https://api.slingacademy.com/public/sample-photos/${tapIndex + 1}.jpeg");
              },
              padding: const EdgeInsets.all(10),
              itemExtent: MediaQuery.of(context).size.width -
                  30, // this is required field , this defines the width of the item/slide
              itemSnapping:
                  true, // this is to ensure we slide complete between to item
              children: List.generate(10, (index) {
                // i'm just useing List generate to show 10 image
                return Image(
                  image: NetworkImage(
                      "https://api.slingacademy.com/public/sample-photos/${index + 1}.jpeg"),
                );
              }),
            ),
          ),
        ],
      ),
    );
    // let's see this code in action
    // That's it for today thanks for watching ,
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    // this is our simple dialog display code
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
