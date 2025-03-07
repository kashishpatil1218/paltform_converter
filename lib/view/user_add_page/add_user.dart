import 'package:flutter/material.dart';
import 'package:paltform_conveter/helper/Db_helper.dart';
import 'package:paltform_conveter/view/component/input_method.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_provider.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<ProviderController>(context, listen: true);
    var providerFalse = Provider.of<ProviderController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add Your Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 70,
                      child: Icon(Icons.add_a_photo_outlined, size: 35),
                    ),
                  ),
                  SizedBox(height: 10),
                  inputBoxMethod(
                    text: "Enter name.......",
                    controller: providerTrue.txtName,
                    isMaxLines: false,
                    isNumber: false,
                  ),
                  inputBoxMethod(
                    text: "Enter number.......",
                    controller: providerTrue.txtNumber,
                    isMaxLines: false,
                    isNumber: true,
                  ),
                  inputBoxMethod(
                    text: "Enter Email.......",
                    controller: providerTrue.txtEmail,
                    isMaxLines: false,
                    isNumber: false,
                  ),
                  inputBoxMethod(
                    text: "Enter Bio.......",
                    controller: providerTrue.txtBio,
                    isMaxLines: true,
                    isNumber: false,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              providerFalse.addDatabase(
                name: providerTrue.txtName.text,
                number: int.parse(providerTrue.txtNumber.text),
                bio: providerTrue.txtBio.text,
                email: providerTrue.txtEmail.text,
                tebName: DbHelper.dbHelper.dbUser,
              );
              providerTrue.txtName.clear();
              providerTrue.txtBio.clear();
              providerTrue.txtEmail.clear();
              providerTrue.txtNumber.clear();
              Navigator.of(
                context,
              ).pushReplacementNamed('/bottomNavigationBarPage');
            },
            child: Container(
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(
                'Add Profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
