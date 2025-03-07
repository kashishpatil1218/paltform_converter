

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../controller/home_provider.dart';
import '../../helper/Db_helper.dart';
import 'cupertino_calls.dart';
import 'cupertino_chats.dart';
import 'cupertino_settings.dart';
import 'dart:io';

class CupertinoFormPage extends StatefulWidget {
  @override
  State<CupertinoFormPage> createState() => _CupertinoFormPageState();
}

class _CupertinoFormPageState extends State<CupertinoFormPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_add_solid),
            label: 'PERSON',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'CHATS',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'CALLS',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'SETTINGS',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) => FormScreen());
          case 1:
            return CupertinoTabView(builder: (context) => CupertinoChats());
          case 2:
            return CupertinoTabView(builder: (context) => CupertinoCalls());
          default:
            return CupertinoTabView(builder: (context) => CupertinoSettings());
        }
      },
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<ProviderController>(context, listen: true);
    var providerFalse = Provider.of<ProviderController>(context, listen: false);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Platform Converter', style: TextStyle(fontSize: 20)),
        trailing: CupertinoSwitch(
          activeTrackColor: CupertinoColors.activeBlue,
          value: providerTrue.isIos,
          onChanged: (bool value) {
            providerFalse.convertApp(value: value);
          },
        ),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CupertinoColors.quaternaryLabel,
                      image: _image != null
                          ? DecorationImage(
                        image: FileImage(_image!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: _image == null
                        ? Icon(
                      CupertinoIcons.camera,
                      color: CupertinoColors.activeBlue,
                      size: 40,
                    )
                        : null,
                  ),
                ),
                SizedBox(height: 20),
                buildTextField(
                  icon: CupertinoIcons.person,
                  text: 'Full Name',
                  controller: providerTrue.txtName,
                ),
                buildTextField(
                  controller: providerTrue.txtNumber,
                  icon: CupertinoIcons.phone,
                  text: 'Phone Number',
                ),
                buildTextField(
                  icon: CupertinoIcons.mail,
                  text: 'email',
                  controller: providerTrue.txtEmail,
                ),
                buildTextField(
                  controller: providerTrue.txtBio,
                  icon: CupertinoIcons.chat_bubble_text,
                  text: 'Chat Conversation',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      CupertinoButton(
                        child: Icon(CupertinoIcons.calendar),
                        onPressed: () {
                          providerFalse.datePickerCupertino(context);
                        },
                      ),
                      (providerTrue.contactDate == null)
                          ? Text("Pick date")
                          : Text(providerTrue.contactDate!),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      CupertinoButton(
                        child: Icon(CupertinoIcons.time),
                        onPressed: () {
                          providerFalse.timePickerCupertino(context);
                        },
                      ),
                      (providerTrue.contactTime == null)
                          ? Text("Pick time")
                          : Text(providerTrue.contactTime!),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: CupertinoButton.filled(
                    child: Text("Save"),
                    onPressed: () {
                      providerFalse.addDatabase(
                        name: providerTrue.txtName.text,
                        number: int.parse(providerTrue.txtNumber.text),
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
      ),
    );
  }
}


Padding buildTextField({
  required IconData icon,
  required String text,
  required controller,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(child: Icon(icon)),
        SizedBox(width: 10),
        Expanded(
          flex: 20,
          child: CupertinoTextField(
            controller: controller,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: CupertinoColors.secondaryLabel),
            ),
            placeholder: text,
            padding: EdgeInsets.all(12),
          ),
        ),
      ],
    ),
  );
}