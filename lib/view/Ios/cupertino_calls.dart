import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/home_provider.dart';
import '../../helper/Db_helper.dart';
import 'cupertino_page.dart';

class CupertinoCalls extends StatelessWidget {
  const CupertinoCalls({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<ProviderController>(context, listen: true);
    var providerFalse = Provider.of<ProviderController>(context, listen: false);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Calls"),),
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
              child: Card(
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
                      child: Icon(CupertinoIcons.phone,size: 25,)),
                
                
                  title: Text(
                    providerTrue.contentList[index].name.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: CupertinoColors.black,
                      letterSpacing: 0.5
                    ),
                  ),
                  subtitle:Text(
                    providerTrue.contentList[index].number.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                  trailing: Row(
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder:
                                (context) => CupertinoPageScaffold(
                              navigationBar: CupertinoNavigationBar(
                                middle: Text(
                                  "Edit Content",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .5,
                                  ),
                                ),
                              ),
                              child: SafeArea(
                                child: Column(
                                  children: [
                                    buildTextField(
                                      icon: CupertinoIcons.person,
                                      text: 'Enter Name...',
                                      controller: providerTrue.txtName,
                                    ),
                                    buildTextField(
                                      icon: CupertinoIcons.phone,
                                      text: 'Enter Number...',
                                      controller: providerTrue.txtNumber,
                                    ),
                                    buildTextField(
                                      icon: CupertinoIcons.chat_bubble_text,
                                      text: 'Enter Email...',
                                      controller: providerTrue.txtEmail,
                                    ),
                                    buildTextField(
                                      icon: CupertinoIcons.doc,
                                      text: 'Enter bio...',
                                      controller: providerTrue.txtBio,
                                    ),
                                    SizedBox(height: 20),
                                    SizedBox(
                                      height: 50,
                                      width: 150,
                                      child: CupertinoButton.filled(
                                        child: Text("Save"),
                                        onPressed: () {
                                          providerFalse.updateDataBase(
                                            id:
                                            providerTrue
                                                .contentList[index]
                                                .id!,
                                            name: providerTrue.txtName.text,
                                            number: int.parse(
                                              providerTrue.txtNumber.text,
                                            ),
                                            bio: providerTrue.txtBio.text,
                                            email: providerTrue.txtEmail.text,
                                            tebName: DbHelper.dbHelper.dbName,
                                          );
                                          providerTrue.txtName.clear();
                                          providerTrue.txtNumber.clear();
                                          providerTrue.txtEmail.clear();
                                          providerTrue.txtBio.clear();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Icon(CupertinoIcons.pencil),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          providerFalse.deleteDataBAse(
                            providerTrue.contentList[index].id!,
                          );
                        },
                        child: Icon(CupertinoIcons.delete),
                      ),
                    ],
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
