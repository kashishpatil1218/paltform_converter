// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter/material.dart';
//
// class CupertinoFormPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('Platform Converter', style: TextStyle(fontSize: 20)),
//         trailing: CupertinoSwitch(value: true, onChanged: (bool value) {}),
//       ),
//       child: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CupertinoButton(
//                 child: CircleAvatar(
//                   radius: 70,
//                   backgroundColor: Colors.blue.shade50,
//                   child: Icon(
//                     CupertinoIcons.camera,
//                     color: Colors.white,
//                     size: 30,
//                   ),
//                 ),
//                 onPressed: () {},
//               ),
//               SizedBox(height: 20),
//               buildTextField(icon: CupertinoIcons.person, text: 'Full Name'),
//               buildTextField(icon: CupertinoIcons.phone, text: 'Phone Number'),
//               buildTextField(
//                 icon: CupertinoIcons.chat_bubble_text,
//                 text: 'Chat Concersation',
//               ),
//               SizedBox(height: 20),
//               SizedBox(
//                 height: 50,
//                 width: 150,
//                 child: CupertinoButton.filled(
//
//
//                   sizeStyle: CupertinoButtonSize.large,
//                   minSize: 25.0,
//                   child: Text("Save"), onPressed: () {
//
//                 },),
//               )
//
//             ],
//           ),
//         ),
//
//       ),
//     );
//   }
//
//   Padding buildTextField({required IconData icon, required String text}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(child: Icon(icon)),
//           SizedBox(width: 10),
//           Expanded(
//             flex: 20,
//             child: CupertinoTextField(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(color: Colors.black38),
//               ),
//               placeholder: text,
//               padding: EdgeInsets.all(12),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cupertino_calls.dart';
import 'cupertino_chats.dart';
import 'cupertino_settings.dart';

class CupertinoFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'PERSON',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'CHATS',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'CALLS',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'SETTINGS',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) => FormScreen());
          case 1:
            return CupertinoTabView(builder: (context) => CupertinoChats());
          case 2:
            return CupertinoTabView(builder: (context) => CupertinoCalls());
          default:
            return CupertinoTabView(builder: (context) => CupertinoSettings());
        }
      },
    );
  }
}

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Platform Converter', style: TextStyle(fontSize: 20)),
        trailing: CupertinoSwitch(value: true, onChanged: (bool value) {}),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue.shade50,
                  child: Icon(
                    CupertinoIcons.camera,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              buildTextField(icon: CupertinoIcons.person, text: 'Full Name'),
              buildTextField(icon: CupertinoIcons.phone, text: 'Phone Number'),
              buildTextField(
                icon: CupertinoIcons.chat_bubble_text,
                text: 'Chat Conversation',
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 150,
                child: CupertinoButton.filled(
                  child: Text("Save"),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTextField({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: Icon(icon)),
          SizedBox(width: 10),
          Expanded(
            flex: 20,
            child: CupertinoTextField(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black38),
              ),
              placeholder: text,
              padding: EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }
}


