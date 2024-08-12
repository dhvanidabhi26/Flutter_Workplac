import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:module_5/constant/color.dart';
import 'package:module_5/constant/style.dart';
import 'package:module_5/custom_widgets/date_time.dart';
import 'package:module_5/custom_widgets/radio_button.dart';
import 'package:module_5/custom_widgets/snackbar.dart';
import 'package:module_5/custom_widgets/textformfield.dart';
import 'package:module_5/custom_widgets/title.dart';
import 'package:module_5/database/database.dart';
import 'package:module_5/pages/first_page.dart';

class UserDataEnterPage extends StatefulWidget {
  const UserDataEnterPage({super.key});

  @override
  State<UserDataEnterPage> createState() => _UserDataEnterPageState();
}

class _UserDataEnterPageState extends State<UserDataEnterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController dateInputController = TextEditingController();
  final TextEditingController timeInputController = TextEditingController();
  String priorityValue = 'Not Mention';

  List<Map<String, dynamic>> userDataList = [];

  @override
  void initState() {
    super.initState();
    dateInputController.text = "";
    timeInputController.text = "";
    _refreshData();
  }

  Future<void> addData() async {
    await SQLiteDatabase.createData(
      nameController.text,
      descController.text,
      priorityValue,
      dateInputController.text,
      timeInputController.text,
      '',
    );
    _refreshData();
  }

  void _refreshData() async {
    final data = await SQLiteDatabase.getAllData();
    setState(() {
      userDataList = data;
    });
  }

  void validationCheck() {
    if (nameController.text.isEmpty ||
        descController.text.isEmpty ||
        priorityValue == 'Not Mention' ||
        dateInputController.text.isEmpty ||
        timeInputController.text.isEmpty) {
      CustomDialog(
        context: context,
        title: 'Please fill all details!',
        backgroundColor: Colors.redAccent,
        icon: Icons.error_outline,
      );
    } else {
      addData();
      CustomDialog(
        context: context,
        title: 'Successfully added Data...',
        icon: Icons.file_download_done,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primeColor,
        title: Text(
          'User Enter Tasks',
          style: CustomStyle.AppStyle(color: Colors.white, fontsizs: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            CustomTitle(title: 'Task Name*'),
            CustomTextField(
              controller: nameController,
              hintText: 'Enter Task Name',
            ),
            CustomTitle(title: 'Task Description*'),
            CustomTextField(
              controller: descController,
              hintText: 'Enter Task Description',
              maxLines: 4,
            ),
            CustomTitle(title: 'Task Priority*'),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  CustomRadioButton(
                    title: 'High',
                    value: 'High',
                    groupValue: priorityValue,
                    onChanged: (value) {
                      setState(() {
                        priorityValue = value!;
                      });
                    },
                  ),
                  CustomRadioButton(
                    title: 'Medium',
                    value: 'Medium',
                    groupValue: priorityValue,
                    onChanged: (value) {
                      setState(() {
                        priorityValue = value!;
                      });
                    },
                  ),
                  CustomRadioButton(
                    title: 'Low',
                    value: 'Low',
                    groupValue: priorityValue,
                    onChanged: (value) {
                      setState(() {
                        priorityValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.4,
                  child: CustomDateTimeField(
                    controller: dateInputController,
                    title: 'Task Date*',
                    prefixIcon: Icon(Icons.calendar_today, color: primeColor),
                    hintText: "Select Date",
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null) {
                        String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                        setState(() {
                          dateInputController.text = formattedDate;
                        });
                      }
                    },
                  ),
                ),
                Container(
                  width: size.width * 0.4,
                  child: CustomDateTimeField(
                    controller: timeInputController,
                    title: 'Task Time*',
                    prefixIcon:
                    Icon(Icons.watch_later_outlined, color: primeColor),
                    hintText: "Select Time",
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        DateTime dateTime = DateTime(
                            2022, 1, 1, pickedTime.hour, pickedTime.minute);
                        setState(() {
                          timeInputController.text =
                              DateFormat('h:mm a').format(dateTime);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                width: size.width * 0.6,
                margin: EdgeInsets.only(top: size.height * 0.035),
                child: ElevatedButton(
                  onPressed: validationCheck,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 1.5,
                  ),
                  child: Text(
                    'Submit',
                    style: CustomStyle.AppStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
