import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class imagearoundtext extends StatefulWidget {
  const imagearoundtext({super.key});

  @override
  State<imagearoundtext> createState() => _imagearoundtextState();
}

class _imagearoundtextState extends State<imagearoundtext> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Types of languages"),backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Image.asset("images/flutter_1.jpeg", height:150, width: 250,),),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20),
                  Image.asset("images/flutter_02.jpg", height:250, width: 100,),

                  SizedBox(height: 20),
                  Text(
                    "languages",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Image.asset("images/flutter_03.png", height:250, width: 100,),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("images/flutter_4.jpeg", height:150, width: 250,),
                ],
              ),
            ]
        ),
      ),
    );
  }
}
