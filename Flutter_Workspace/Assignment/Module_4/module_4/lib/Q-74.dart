import 'package:flutter/material.dart';


class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text('Main screen'),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("Main Screen",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            SizedBox(height: 20,),

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => nextscreen()));
              },child: Text("Go to next Page"),
            ),
          ],
        ),
      ),
    );
  }
}

class nextscreen extends StatefulWidget {
  const nextscreen({super.key});

  @override
  State<nextscreen> createState() => _nextscreenState();
}

class _nextscreenState extends State<nextscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text('Second Screen'),backgroundColor: Colors.blue,),
      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("Second Screen",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            SizedBox(height: 25,),

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => mainscreen()));
              },child: Text("Back to Main Page"),
            ),
          ],
        ),
      ),
    );
  }
}
