

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../controller/home_provider.dart';
import '../../../helper/Db_helper.dart';
import '../../component/input_method.dart';

class AddContent extends StatefulWidget {
  const AddContent({super.key});

  @override
  State<AddContent> createState() => _AddContentPageState();
}

class _AddContentPageState extends State<AddContent> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderController>(context, listen: false).readDataBase();
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      radius: 70,
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? const Icon(Icons.add_a_photo_outlined, size: 35)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  inputBoxMethod(
                    text: "Enter name...",
                    controller: providerTrue.txtName,
                    isMaxLines: false,
                    isNumber: false,
                  ),
                  inputBoxMethod(
                    text: "Enter Number...",
                    controller: providerTrue.txtNumber,
                    isMaxLines: false,
                    isNumber: true,
                  ),
                  inputBoxMethod(
                    text: "Enter Email ID...",
                    controller: providerTrue.txtEmail,
                    isMaxLines: false,
                    isNumber: false,
                  ),
                  inputBoxMethod(
                    text: "Enter Bio...",
                    controller: providerTrue.txtBio,
                    isMaxLines: true,
                    isNumber: false,
                  ),
                  ListTile(
                    title: Text(
                      selectedDate == null
                          ? "Select Date"
                          : "Date: \${selectedDate!.day}-\${selectedDate!.month}-\${selectedDate!.year}",
                    ),
                    leading: const Icon(Icons.calendar_today),
                    onTap: () => _selectDate(context),
                  ),
                  ListTile(
                    title: Text(
                      selectedTime == null
                          ? "Select Time"
                          : "Time: \${selectedTime!.format(context)}",
                    ),
                    leading: const Icon(Icons.access_time),
                    onTap: () => _selectTime(context),
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
                tebName: DbHelper.dbHelper.dbName,
              );

              providerTrue.txtName.clear();
              providerTrue.txtNumber.clear();
              providerTrue.txtEmail.clear();
              providerTrue.txtBio.clear();

              setState(() {
                selectedDate = null;
                selectedTime = null;
                _image = null;
              });
            },
            child: Container(
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff578FCA),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Add Contact",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
