import 'package:flutter/material.dart';
import 'package:paltform_conveter/view/Android/Tab_Bar/setting/contact_page.dart';

import 'add_contact.dart';
import 'call_page.dart';
import 'email_page.dart';


class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Platform converter',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            indicatorColor: Colors.blueGrey,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width:2,color: Colors.blue),
              insets: EdgeInsets.symmetric(horizontal: 40.0),
            ),
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(icon: Icon(Icons.person_add_alt,color: Colors.black,)),
              Tab(
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Calls',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15,color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Setting",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15,color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [

          AddContentPage(),
          ChatsListPage(),
          CallsListPage(),
          ContentPage(),
        ]),
      ),
    );
  }
}
