import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paltform_conveter/helper/Db_helper.dart';

import '../modal/contact_modal.dart';

class ProviderController extends ChangeNotifier {
  bool isIos = false;
  var txtName = TextEditingController();
  var txtNumber = TextEditingController();
  var txtEmail = TextEditingController();
  var txtBio = TextEditingController();

  DateTime? selectedDate; // for DA
  DateTime? selectedCupertinoTime; // for DA
  String? contactDate;// TE
  String? contactTime;// TE
  TimeOfDay? selectedTime;// FO

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
  Future<void> deleteDataBAse(int id) async {
   await DbHelper.dbHelper.delete(id: id);
    readDataBase();
  }


  Future<void> datePickerCupertino(BuildContext context) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          showDayOfWeek: true,
          onDateTimeChanged: (value) {
            selectedDate = value;
          },
        ),
      ),
    );
    contactDate = "${selectedDate!.month} / ${selectedDate!.day} / ${selectedDate!.year}";

    notifyListeners();
  }


  Future<void> timePickerCupertino(BuildContext context) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (value) {
            selectedCupertinoTime = value;
          },
        ),
      ),
    );
    contactTime = '${selectedCupertinoTime!.hour}:${selectedCupertinoTime!.minute}';

  }
}


