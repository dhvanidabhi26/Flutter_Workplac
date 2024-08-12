import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReverseNumberScreen extends StatefulWidget {
  @override
  _ReverseNumberScreenState createState() => _ReverseNumberScreenState();
}

class _ReverseNumberScreenState extends State<ReverseNumberScreen> {
  int _number = 0;
  int _reversedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reverse Number'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number, // type only number
              onChanged: (value) {
                setState(() {
                  _number = int.tryParse(value) ?? 0;
                });
              },

              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _reversedNumber = reverseNumber(_number);
                });
              },
              child: Text('Reverse'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Reversed Number: $_reversedNumber',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  reverseNumber(int number) {
    int reversedNumber = 0;
    while (number != 0) {
      int digit = number % 10;
      reversedNumber = (reversedNumber * 10) + digit;
      number ~/= 10;
    }
    return reversedNumber;
  }
}
