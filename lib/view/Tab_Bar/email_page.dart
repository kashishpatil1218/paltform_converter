import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/home_provider.dart';

class ChatsListPage extends StatelessWidget {
  const ChatsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<ProviderController>(context, listen: true);
    var providerFalse = Provider.of<ProviderController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: providerTrue.contentList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Uri uri = Uri.parse(
                'mailto: ${providerTrue.contentList[index].email}',
              );
              launchUrl(uri);
            },
            child: Card(
              color: Colors.blue.shade50,
              child: ListTile(
                leading: IconButton(
                  /// todo logic URL loch
                  onPressed: () {
                    Uri uri = Uri.parse(
                      'mailto: ${providerTrue.contentList[index].email}',
                    );
                    launchUrl(uri);
                  },
                  icon: Icon(Icons.alternate_email),color: Colors.grey.shade800,
                ),
                title: Text(
                  providerTrue.contentList[index].name.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                    letterSpacing: .5,
                  ),
                ),
                subtitle: Text(
                  providerTrue.contentList[index].email.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}