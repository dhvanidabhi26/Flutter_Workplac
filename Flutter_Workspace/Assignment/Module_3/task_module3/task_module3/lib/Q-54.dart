import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fontsizepage extends StatefulWidget {
  const fontsizepage({super.key});

  @override
  State<fontsizepage> createState() => _fontsizepageState();
}

class _fontsizepageState extends State<fontsizepage>
{

  double fontsize =20.0;

  void increaseFontSize(){
    setState(() {
      fontsize +=2.0;
    });
  }
  void decreaseFontSize(){
    setState(() {
      fontsize -=2.0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Font Size",
              style: TextStyle(fontSize: fontsize),),


          SizedBox(height: 20),


        Container(

          child: Row(

           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             TextButton(
                 onPressed: increaseFontSize,
                 child: Text("Increase"),
                 //child: Icon(Icons.text_increase),
                 //backgroundColor: Colors.white,
             ),
             SizedBox(width: 16,),
             TextButton(
               onPressed: decreaseFontSize,
               child: Text("Decrease")

             ),
           ],
                 ),
        ),]
        ),

    ),
    );
  }
}
