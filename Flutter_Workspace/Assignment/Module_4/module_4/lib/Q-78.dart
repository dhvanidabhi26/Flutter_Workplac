import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Welcome',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Column(
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                      hintText: "Please Enter Your Name",
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color:Colors.black),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: _addItem,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              shadowColor: Colors.black,
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('Add'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _showItemDialog(_items[index]),
                  onLongPress: () => _showContextMenu(context, index),
                  child: ListTile(
                    title: Text(_items[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addItem() {
    if (_textController.text.isNotEmpty)
    {
      setState(()
      {
        _items.add(_textController.text);
        _textController.clear();
      });
    }
  }

  void _showItemDialog(String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item'),
          content: Text(item),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showContextMenu(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Item'),
              onTap: () {
                Navigator.of(context).pop();
                _editItem(index);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete Item'),
              onTap: () {
                Navigator.of(context).pop();
                _confirmDeleteItem(index);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editItem(int index) {
    _textController.text = _items[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: 'Edit Name',
            ),
          ),
          actions:[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                _textController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  _items[index] = _textController.text;
                  _textController.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this item?'),
          actions:[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                setState(() {
                  _items.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
