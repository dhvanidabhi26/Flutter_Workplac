import 'package:flutter/material.dart';


class calculatorpage extends StatelessWidget {
  const calculatorpage ({Key? key});


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState()  => CalculatorState();
}
class CalculatorState extends State<Calculator>
{

  String Method='';
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  String answer = '';


  @override
  Widget build(BuildContext context) {
    var result;
    return SingleChildScrollView(
      child: Form(
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 50,right: 50),
              child: Text('Calculation of two Number',
                  style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold,color: Colors.black)
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextFormField(
                controller: first,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Please Enter Your First Number',
                  labelText: "First Number",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextFormField(
                controller: second,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Please Enter Your Second Number',
                  labelText: "second number",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
            ),


            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Choose your Method :", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ],
            ),

            ListTile(
              title: const Text('Addition'),
              leading: Radio(
                value: 'Addition',
                groupValue: Method,
                onChanged: (value) {
                  setState(() {
                    Method = value!;
                  });
                },
              ),
            ),

            ListTile(
              title: const Text('Subtraction'),
              leading: Radio(
                value: 'Subtraction',
                groupValue: Method,
                onChanged: (value) {
                  setState(() {
                    Method = value!;
                  });
                },
              ),
            ),

            ListTile(
              title: const Text('Multiplication'),
              leading: Radio(
                value: 'Multiplication',
                groupValue: Method,
                onChanged: (value) {
                  setState(() {
                    Method = value!;
                  });
                },
              ),
            ),

            ListTile(
              title: const Text('Division'),
              leading: Radio(
                value: 'Division',
                groupValue: Method,
                onChanged: (value) {
                  setState(() {
                    Method = value!;
                  });
                },
              ),
            ),

            SizedBox(height: 50,width: 50,),
            ElevatedButton(onPressed: ()
            {
              var  a = int.parse(first.text.toString());
              var b = int.parse(second.text.toString());
              var result;

              switch (Method)
              {
                case 'Addition':
                  result = a + b;
                case 'Subtraction':
                  result = a - b;
                case 'Multiplication':
                  result = a * b;
                case 'Division':
                  result = a / b;
                default:
                  break;
              }
              setState(() {
                answer = result != null ? "Answer is: $result" : "Enter Valid numbers";
              });
            },
              child: Text("Answer"),),

            SizedBox(height: 30),
            Text(
              answer,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}


