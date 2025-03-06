import 'package:flutter/material.dart';
import 'package:paltform_conveter/view/Tab_Bar/add_contact.dart';
import 'package:paltform_conveter/view/Tab_Bar/call_page.dart';
import 'package:paltform_conveter/view/Tab_Bar/email_page.dart';
import 'package:paltform_conveter/view/Tab_Bar/setting/contact_page.dart';

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
            indicatorColor: Colors.white,
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
