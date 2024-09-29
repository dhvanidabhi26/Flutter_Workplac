import 'package:flutter/material.dart';
import 'package:to_do/homepage.dart';
import 'package:to_do/sharedpreference.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<String> _notes = [];

   TextEditingController _noteController = TextEditingController();

  void _addNote() {
    if (_noteController.text.isNotEmpty) {
      setState(() {
        _notes.add(_noteController.text);
        _noteController.clear();
      });
    }
  }

  void _deleteNoteAtIndex(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Notes"),actions: [
          IconButton(onPressed: ()
          {
            SharedPreferenceHelper().clearData();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Removed")));
            Navigator.pop(context);
          }, icon: Icon(Icons.menu))
      ],
      ),
      body: Padding(
        padding:EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: _notes.isEmpty
                  ? Center(child: Text("No notes available"))
                  : ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(_notes[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteNoteAtIndex(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("New Note"),
                content: TextField(
                  controller: _noteController,
                  decoration:InputDecoration(hintText: "Enter note here"),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child:Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      _addNote();
                      Navigator.of(context).pop();
                    },
                    child:Text("Add"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
