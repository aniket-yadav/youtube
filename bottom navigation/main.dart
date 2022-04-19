import 'package:flutter/material.dart';

void main() {
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
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  final List<Widget> _screens = [
    Container(
      color: Colors.redAccent,
      child: const Text("HOME"),
      alignment: Alignment.center,
    ),
    Container(
      color: Colors.greenAccent,
      child: const Text("MAP"),
      alignment: Alignment.center,
    ),
    Container(
      color: Colors.orangeAccent,
      child: const Text("SETTINGS"),
      alignment: Alignment.center,
    ),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabClick,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: "Map",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ]),
      body: PageView(
        children: _screens,
        controller: _pageController,
        onPageChanged: pageChanged,
      ),
    );
  }

  void pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onTabClick(int index) {
    _pageController.jumpToPage(index);
  }
}
