import 'package:flutter/cupertino.dart';

class CupertinoChats extends StatelessWidget {
  const CupertinoChats({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Chats')),
      child: Center(
        child: Text('Chat Page', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}