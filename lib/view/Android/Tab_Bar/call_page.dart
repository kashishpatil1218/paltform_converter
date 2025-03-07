import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/home_provider.dart';
import '../../../helper/Db_helper.dart';
import '../../component/input_method.dart';
import 'email_page.dart';

class CallsList extends StatelessWidget {
  const CallsList({super.key});

  @override
  Widget build(BuildContext context) {

    var providerTrue = Provider.of<ProviderController>(context, listen: true);
    var providerFalse = Provider.of<ProviderController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: providerTrue.contentList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = providerTrue.contentList[index];
          return GestureDetector(
            onTap: () async {
              Uri uri = Uri.parse(
                'tel: ${providerTrue.contentList[index].number}',
              );
              launchUrl(uri);
            },
            child: Card(
              color: Colors.blue.shade50,
              child: ListTile(
                leading: IconButton(
                  /// todo logic URL loch
                  onPressed: () async {
                    Uri uri = Uri.parse(
                      'tel: ${providerTrue.contentList[index].number}',
                    );
                    launchUrl(uri);
                  },
                  icon: Icon(Icons.call,color: Colors.grey.shade800,),
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
                  providerTrue.contentList[index].number.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.grey),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder:
                              (context) => SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                MediaQuery.of(
                                  context,
                                ).viewInsets.bottom,
                              ),
                              child: SizedBox(
                                height: 400,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10),
                                            Text(
                                              "Edit Content",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: .5,
                                                fontSize: 20,
                                              ),
                                            ),
                                            inputBoxMethod(
                                              text:
                                              providerTrue
                                                  .contentList[index]
                                                  .name!,
                                              controller:
                                              providerTrue.txtName,
                                              isMaxLines: false,
                                              isNumber: false,
                                            ),
                                            inputBoxMethod(
                                              text:
                                              providerTrue
                                                  .contentList[index]
                                                  .number
                                                  .toString(),
                                              controller:
                                              providerTrue.txtNumber,
                                              isMaxLines: false,
                                              isNumber: true,
                                            ),
                                            inputBoxMethod(
                                              text:
                                              providerTrue
                                                  .contentList[index]
                                                  .email!,
                                              controller:
                                              providerTrue.txtEmail,
                                              isMaxLines: false,
                                              isNumber: false,
                                            ),
                                            inputBoxMethod(
                                              text:
                                              providerTrue
                                                  .contentList[index]
                                                  .bio!,
                                              controller:
                                              providerTrue.txtBio,
                                              isMaxLines: true,
                                              isNumber: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        /// todo : enter a data base code
                                        onTap: () {
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
                                            email:
                                            providerTrue.txtEmail.text,
                                            tebName:
                                            DbHelper.dbHelper.dbName,
                                          );
                                          providerTrue.txtName.clear();
                                          providerTrue.txtNumber.clear();
                                          providerTrue.txtEmail.clear();
                                          providerTrue.txtBio.clear();
                                        },
                                        child: Container(
                                          height: 65,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Edit Content",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: .5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.grey),
                      onPressed: () {
                        showDeleteConfirmation(context, providerFalse, item.id!);
                      },
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}