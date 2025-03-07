import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_provider.dart';

class CupertinoSettings extends StatelessWidget {
  const CupertinoSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<ProviderController>(context, listen: true);
    var providerFalse = Provider.of<ProviderController>(context, listen: false);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('setting')),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: providerTrue.settingList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: CupertinoListTile(
                trailing:
                (providerTrue.settingList[index] == "iOS")
                    ? CupertinoSwitch(
                  value: providerTrue.isIos,
                  onChanged: (bool value) {
                    providerFalse.convertApp(value: value);
                  },
                )
                    : CupertinoButton(
                  child: Icon(CupertinoIcons.forward),
                  onPressed: () {},
                ),
                title: Text(
                  providerTrue.settingList[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    // letterSpacing: .5,
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