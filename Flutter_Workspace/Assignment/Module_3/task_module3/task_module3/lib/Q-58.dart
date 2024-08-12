import 'package:flutter/material.dart';

class SeekBarExample extends StatefulWidget {
  @override
  _SeekBarExampleState createState() => _SeekBarExampleState();
}

class _SeekBarExampleState extends State<SeekBarExample> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Voice: $_currentValue',
              style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 20.0),
            Slider(
              value: _currentValue,
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: (double value)
              {
                setState(() {
                  _currentValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


