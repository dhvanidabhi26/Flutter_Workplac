import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({Key? key}) : super(key: key);

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  String answerText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: firstController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter First Number',
                  labelText: 'First Number',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: secondController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter last Number',
                  labelText: 'last Number',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    answerText = printBetweenNumbers();
                  });
                },
                child: Text('Answer'),
              ),
              SizedBox(height: 20),
              Text(answerText),
            ],
          ),
        ),
      ),
    );
  }

  String printBetweenNumbers() {
    int firstNumber = int.tryParse(firstController.text) ?? 0;
    int secondNumber = int.tryParse(secondController.text) ?? 0;

    if (firstNumber < secondNumber)
    {
      List<int> numbers = [];
      for (int i = firstNumber + 1; i < secondNumber; i++) {
        numbers.add(i);
      }
      return 'Answer: ${numbers}';
    } else {
      return 'Enter valid numbers';
    }
  }
}

