import 'package:english_dictionary/Database/Dbhelper.dart';
import 'package:english_dictionary/widgets/color.dart';
import 'package:flutter/material.dart';

class EditStudents extends StatefulWidget {
  late String word;
  EditStudents({required this.word});

  @override
  EditState createState() => EditState();
}

class EditState extends State<EditStudents> {
  final TextEditingController wordController = TextEditingController();
  final TextEditingController meaningController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MyDb mydb = MyDb();

  @override
  void initState() {
    mydb.open();

    Future.delayed(Duration(milliseconds: 500), () async {
      var data = await mydb.getStudent(widget.word);
      if (data != null) {
        wordController.text = data["word"];
        meaningController.text = data["meaning"].toString();
        setState(() {});
      } else {
        print("No data with word: " + widget.word.toString());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Word"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: wordController,
                decoration: InputDecoration(
                  labelText: "Your Word",
                  hintText: "Word",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a word';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: meaningController,
                decoration: InputDecoration(
                  labelText: "Meaning of Word",
                  hintText: "Meaning",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the meaning';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    mydb.db.rawUpdate(
                      "UPDATE students SET word = ?, meaning = ? WHERE word = ?",
                      [wordController.text, meaningController.text, widget.word],
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Data Updated")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: kBrown, // Text color
                  shadowColor: Colors.black, // Shadow color
                  elevation: 5, // Elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
                child: Text("Save Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
