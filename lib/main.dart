import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paltform_conveter/view/Android/Tab_Bar/setting/contact_page.dart';
import 'package:paltform_conveter/view/Android/Tab_Bar/setting/edite_profilr.dart';
import 'package:paltform_conveter/view/Android/Tab_Bar/tab_bar_page.dart';
import 'package:paltform_conveter/view/Android/user_add_page/add_user.dart';

import 'package:paltform_conveter/view/Ios/cupertino_page.dart';

import 'package:provider/provider.dart';

import 'controller/home_provider.dart';
import 'helper/Db_helper.dart';

void main() {
  runApp(ContactApp());
}

class ContactApp extends StatefulWidget {
  const ContactApp({super.key});

  @override
  State<ContactApp> createState() => _MyAppState();
}

class _MyAppState extends State<ContactApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DbHelper.dbHelper.database;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderController(),
      builder: (context, child) {
        Provider.of<ProviderController>(context, listen: false).readUserData();
        Provider.of<ProviderController>(context, listen: false).readDataBase();

        return (Provider.of<ProviderController>(context, listen: true).isIos)
            ? CupertinoApp(home: CupertinoFormPage(),debugShowCheckedModeBanner: false,)
            : MaterialApp(
          routes: {
            '/':
                (context) =>
            (Provider.of<ProviderController>(
              context,
              listen: true,
            ).userList.isEmpty)
                ? AddUserPage()
                : BottomNavigationBarPage(),
            '/bottomNavigationBarPage':
                (context) => BottomNavigationBarPage(),
            '/content': (context) => ContentPage(),
            '/editProfilePage': (context) => EditProfilePage(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}