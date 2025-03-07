import 'package:flutter/material.dart';


class TabBarWithPageView extends StatelessWidget {
  const TabBarWithPageView({super.key, required this.toggleApp});

  final VoidCallback toggleApp;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(onPressed: toggleApp, child: Text('button')),
          ],
          title: Text('Platform Converter'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person_add_alt),),
              Tab(text: 'Chats',),
              Tab(text: 'Calls',),
              Tab(text: 'Settings',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // AddContact(),
            Center(child: Text("Home Screen", style: TextStyle(fontSize: 24))),
            Center(
              child: Text("Favorites Screen", style: TextStyle(fontSize: 24)),
            ),
            Center(
              child: Text("Settings Screen", style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}