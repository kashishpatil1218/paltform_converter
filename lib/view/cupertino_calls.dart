import 'package:flutter/cupertino.dart';

class CupertinoCalls extends StatelessWidget {
  const CupertinoCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Call')),
      child: Center(
        child: Text('Call Page', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}