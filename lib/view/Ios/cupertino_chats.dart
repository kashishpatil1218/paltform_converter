import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/home_provider.dart';

class CupertinoChats extends StatelessWidget {
  const CupertinoChats({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<ProviderController>(context, listen: true);
    var providerFalse = Provider.of<ProviderController>(context, listen: false);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Chats')),
      child: ListView.builder(
        itemCount: providerTrue.contentList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = providerTrue.contentList[index];

          return GestureDetector(
            onTap: () {
              Uri uri = Uri.parse('mailto:${item.email}');
              launchUrl(uri);
            },
            child: CupertinoListTile(

              title: Text(
                item.name.toString(),
                style: TextStyle(
                  color: CupertinoColors.separator,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                item.email.toString(),
                style: TextStyle(color: CupertinoColors.separator),
              ),
             trailing: Icon(CupertinoIcons.chat_bubble_2),
            ),
          );
        },
      ),
    );
  }
}

