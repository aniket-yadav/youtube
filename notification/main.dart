import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void main() async {
  AwesomeNotifications().initialize(
      null,
      
      [
        NotificationChannel(
         
          channelGroupKey: 'basic_tests',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance
              .High, 
        ),
      ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    AwesomeNotifications().actionStream.listen((event) {
      print(event.body);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Local Notification"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                AwesomeNotifications().createNotification(
                  content: NotificationContent(
                    channelKey: "basic_channel",
                    id: 1,
                    title: "Notification title",
                    body: "Notification body",
                    bigPicture:
                        "https://images.unsplash.com/photo-1656274990019-979c5d603bb5",
                    notificationLayout: NotificationLayout.BigPicture,
                  ),
                );
              },
              child: const Text("Show Notification"),
            )
          ],
        ),
      ), 
      
    );
  }
}
