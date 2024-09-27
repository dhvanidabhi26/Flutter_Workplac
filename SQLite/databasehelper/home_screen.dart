import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offline_database/database_helper.dart';
import 'package:offline_database/details_screen.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Map<String, dynamic>> _list = [];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }


  Future<void> getData() async {
   final data = await databaseHelper.read();
   setState(() {
     _list = data;
   });
  }

  @override
  Widget build(BuildContext context) {
    print(_list);
    return Scaffold(
      appBar: AppBar(title: Text("Database"),),
      body: Column(
        children: [
          TextField(controller: _nameController,),
          TextField(controller: _ageController,),
          ElevatedButton(onPressed: (){
            databaseHelper.insert(_nameController.text, int.parse(_ageController.text));
            getData();
            setState(() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Details_Screen()));
            });
          }, child: Text("Submit")),
        ],
      ),
    );
  }
}
