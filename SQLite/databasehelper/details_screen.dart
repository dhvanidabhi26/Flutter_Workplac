import 'package:flutter/material.dart';
import 'package:offline_database/database_helper.dart';
import 'package:offline_database/home_screen.dart';

class Details_Screen extends StatefulWidget {
  const Details_Screen({super.key});

  @override
  State<Details_Screen> createState() => _Details_ScreenState();
}

class _Details_ScreenState extends State<Details_Screen> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Map<String, dynamic>> _list = [];

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
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Center(
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_list[index]['name']),
              subtitle: Text(_list[index]['age'].toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      TextEditingController nameController =
                          TextEditingController(text: _list[index]['name']);
                      TextEditingController ageController =
                          TextEditingController(
                              text: _list[index]['age'].toString());
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Edit"),
                            content: Column(
                              children: [
                                Text("Are you sure you want to edit?"),
                                TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      labelText: "Name",
                                    )),
                                TextField(
                                    controller: ageController,
                                    decoration: InputDecoration(
                                      labelText: "Age",
                                    )),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await databaseHelper.update(
                                    _list[index]['id'],
                                    nameController.text,
                                    int.parse(ageController.text),
                                  );
                                  await getData();
                                  Navigator.of(context).pop();

                                },
                                child: Text("Save"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      databaseHelper.delete(_list[index]['id']);
                      getData();
                      setState(() {});
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
