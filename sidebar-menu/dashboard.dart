import 'package:flutter/material.dart';
import 'package:testhero/sidebar_menu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sidebar Menu Demo"),
        backgroundColor: Colors.amber,
      ),
      drawer: const SidebarMenu(),
      body: Container(
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: const Text("Dashboard"),
      ),
    );
  }
}
