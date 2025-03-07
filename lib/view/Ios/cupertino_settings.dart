import 'package:flutter/cupertino.dart';

class CupertinoSettings extends StatelessWidget {
  const CupertinoSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('setting')),
      child: Center(
        child: Text('setting Page', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}