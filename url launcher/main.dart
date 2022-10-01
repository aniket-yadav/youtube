/*  add plugin
  url_launcher: ^6.1.6
  
  AndroidManifest.xml
  
  <queries>
        <!-- If your app opens https URLs -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
        </intent>
        <!-- If your app makes calls -->
        <intent>
            <action android:name="android.intent.action.DIAL" />
            <data android:scheme="tel" />
        </intent>
        <!-- If your app emails -->
        <intent>
            <action android:name="android.intent.action.SEND" />
            <data android:mimeType="*/*" />
        </intent>
    </queries>

  
*/ 


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL launcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'URL launcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
/*
Hey everyone today we are going to see a useful plugin , which you can use to launch a webpage or mail or caller or whatsapp etc.
from your flutter app
let see the plugin
let see its setup
that's it

let's see our code 
let's run and then check 
okay we got 4 button here
for web site, gmail, messenger,and caller/dialer

all working 
thanks for watching 
and please subcribe thank you

*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          //  button to launch website
          ElevatedButton(
            onPressed: () {
              // for web simply pass you url and pass that uri to method we created
              Uri uri = Uri.https('flutter.dev'); //https://flutter.dev/
              _launchUrl(uri);
              //  let's see in action
              // yup

            },
            child: const Text("Open web site"),
          ),
          ElevatedButton(
            onPressed: () {
              //  next is mail
              Uri uri = Uri(
                scheme: 'mailto', // this is scheme for mail 
                path: 'flutter@example.com', // you receipient email
                query: encodeQueryParameters(<String, String>{
                  'subject': 'Testing mail launch from fluter app', // subject
                  'body': "this mail body is from flutter code" // body
                }),
              );
              _launchUrl(uri); // pass this uri
              //  let's see 
            },
            child: const Text("Open gmail"),
          ),
          ElevatedButton(
            onPressed: () {
              //  next is sms

              final Uri uri = Uri(
                scheme: 'sms', // scheme
                path: '+919876543210', // mobile no
                queryParameters: <String, String>{
                  'body': Uri.encodeComponent('Hello'), // your message
                },
              );
              _launchUrl(uri); // pass uri
              // let's check

            },
            child: const Text("Open messenger"),
          ),
          ElevatedButton(
            onPressed: () {
              //  next is dialler
              final Uri uri = Uri(
                scheme: 'tel', // this is scheme for call
                path: '+91987654321', // mobile no
              );
              _launchUrl(uri); // pass uri
              //  let's check
            },
            child: const Text("Open dialer/caller"),
          ),
        ],
      ),
    );
  }

//  i have created a func to launch url
//  as name say this plugin uses url to launch different app
//
//  so we got func to launch a uri so let create uri for these 
  Future<void> _launchUrl(Uri url) async {
    try {
      if (await canLaunchUrl(url)) {
        //we canLaunchUrl method you can check your url is good to launch or not , and if you want to check any url if it correct and not you can also use this
        await launchUrl(
          // launchUrl is to launch
          url, // passing our url
        );
      } else {
        throw 'Could not launch $url';
      }
    } catch (_) {}
  }

  String? encodeQueryParameters(Map<String, String> params) {
    // this method is to create encodequery i.e from { 'a':'1'} to https:google.com?a=1 somthing like this
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
