import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/home_provider.dart';

class CupertinoCalls extends StatelessWidget {
  const CupertinoCalls({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<ProviderController>(context, listen: true);
    var providerFalse = Provider.of<ProviderController>(context, listen: false);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("call"),),
      child: Center(
        child: ListView.builder(
          itemCount: providerTrue.contentList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Uri uri = Uri.parse(
                  'tel : ${providerTrue.contentList[index].number}',
                );
                launchUrl(uri);
              },
              child: CupertinoListTile(

                leading: GestureDetector(
                  onTap: () {
                    {
                      Uri uri = Uri.parse(
                        'tel: ${providerTrue.contentList[index].number}',
                      );
                      launchUrl(uri);
                    };
                  },
                    child: Icon(CupertinoIcons.phone,)),


                title: Text(
                  providerTrue.contentList[index].name.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.secondaryLabel,
                  ),
                ),
                subtitle:Text(
                  providerTrue.contentList[index].number.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.secondaryLabel,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
