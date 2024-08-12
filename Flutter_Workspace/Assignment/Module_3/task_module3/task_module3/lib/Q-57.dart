import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class changecolor extends StatefulWidget {
  const changecolor({super.key});

  @override
  State<changecolor> createState() => _changecolorState();
}

class _changecolorState extends State<changecolor> {

  Color _selectedColor = Colors.white;

  void _changeColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select color for background",style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),
      body: Container(
        color: _selectedColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RadioListTile(
                title: Text('Purple'),
                value: Colors.deepPurpleAccent, groupValue: _selectedColor, onChanged: (Color?  value)
              {
                _changeColor(value!);
              },
              ),
              RadioListTile(
                title: Text('Blue'),
                value: Colors.blue, groupValue: _selectedColor, onChanged: (Color?  value)
              {
                _changeColor(value!);
              },
              ),
              RadioListTile(
                title: Text('Pink'),
                value: Colors.pink, groupValue: _selectedColor, onChanged: (Color?  value)
              {
                _changeColor(value!);
              },
              ),
              RadioListTile(
                title: Text('Green'),
                value: Colors.green, groupValue: _selectedColor, onChanged: (Color?  value){
                _changeColor(value!);
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
