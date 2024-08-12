
import 'package:flutter/material.dart';

class Operation extends StatefulWidget {
  const Operation({super.key});

  @override
  State<Operation> createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  List<String> items = ["Flutter", "Dart", "C", "C++", "PHP", "Python","Java"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Context Menu"), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              _showContextMenu(context, items[index], index);
            },
          );
        },
      ),
    );
  }

  void _showContextMenu(BuildContext context, String item, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading:Icon(Icons.edit),
              title:Text("Edit"),
              onTap: () {
                Navigator.pop(context);
                _editData(context, item, index);
              },
            ),
            ListTile(
              leading:Icon(Icons.visibility),
              title:Text("View"),
              onTap: () {
                Navigator.pop(context);
                _viewData(context, item);
              },
            ),
            ListTile(
              leading:Icon(Icons.delete),
              title:Text("Delete"),
              onTap: () {
                setState(() {
                  items.removeAt(index);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _editData(BuildContext context, String item, int index)
  {
    TextEditingController controller = TextEditingController(text: item);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Item"),
          content: TextField(
            controller: controller,
            decoration:  InputDecoration(hintText: "Enter new value"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: ()
              {
                setState(()
                {
                  items[index] = controller.text;// For new value
                });
                Navigator.pop(context);
              },
              child:  Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _viewData(BuildContext context, String item)
  {
    showDialog(
      context: context,
      builder: (BuildContext context)
      {
        return AlertDialog(
          title:  Text("View Item"),
          content: Text(item),
          actions: [
            TextButton(
              onPressed: ()
              {
                Navigator.pop(context);
              },
              child:  Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
