import 'package:flutter/material.dart';
import 'package:testhero/search.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("User XYZ"),
            accountEmail: const Text("userxyz@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1701205395454-eafa6ea02920",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Search()));
            },
            child: const ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.security),
            title: Text("Privacy Policy"),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          const ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.redAccent,
            ),
            title: Text("Logout"),
          )
          
        ],
      ),
    ); 
  }
}
