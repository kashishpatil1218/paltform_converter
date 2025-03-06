import 'package:flutter/material.dart';
import 'package:paltform_conveter/helper/Db_helper.dart';

import '../modal/contact_modal.dart';

class ProviderController extends ChangeNotifier {
  bool isIos = false;
  var txtName = TextEditingController();
  var txtNumber = TextEditingController();
  var txtEmail = TextEditingController();
  var txtBio = TextEditingController();

  DateTime? selectedDate; // for DATE
  TimeOfDay? selectedTime;// FOR TIME

  void convertApp({required bool value}) {
    isIos = value;
    notifyListeners();
  }

  List settingList = [
    "iOS",
    "Edit Profile",
    "Caller Id & spam",
    "Accessibility",
    "Assisted dialing",
    "Blocked numbers",
    "Calling account",
    "Call recoding",
    "Display options",
    "Quick responses",
    "Sounds and vibration",
    "Voicemail",
    "Contact ringtones",
    "caller Id Announcement",
    "Flip to Silence",
  ];

  List<ContactModal> contentList = [];
  List<ContactModal> userList = [];

  void addDatabase({
    required String name,
    required int number,
    required String bio,
    required String email,
    required String tebName,
  }) {
    DbHelper.dbHelper.insertData(
      name: name,
      number: number,
      bio: bio,
      email: email,
      tebName: tebName,
    );
    readDataBase();
    notifyListeners();
  }

  Future<void> readDataBase() async {
    List data = await DbHelper.dbHelper.readDate(
      tebName: DbHelper.dbHelper.dbName,
    );
    contentList = data.map((e) => ContactModal.fromMap(e)).toList();
    notifyListeners();
  }

  Future<void> readUserData() async {
    List data = await DbHelper.dbHelper.readDate(
      tebName: DbHelper.dbHelper.dbUser,
    );
    userList = data.map((e) => ContactModal.fromMap(e)).toList();
    notifyListeners();
  }

  Future<void> updateDataBase({
    required int id,
    required String name,
    required int number,
    required String bio,
    required String email,
    required String tebName,
  }) async {
    ContactModal modal = ContactModal(
      name: name,
      id: id,
      bio: bio,
      email: email,
      number: number,
    );
    await DbHelper.dbHelper.update(modal: modal, tebName: tebName);
    readDataBase();
    notifyListeners();
  }
  void deleteDataBAse({required int id}){
    DbHelper.dbHelper.delete(id: id);
  }
}


