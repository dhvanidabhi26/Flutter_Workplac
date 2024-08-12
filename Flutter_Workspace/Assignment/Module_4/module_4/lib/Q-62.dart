
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class simple_alert extends StatefulWidget {
  const simple_alert({super.key});

  @override
  State<simple_alert> createState() => _simple_alertState();
}

class _simple_alertState extends State<simple_alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Alert",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 200),
              child: ElevatedButton(
                  onPressed: ()
                  {
                    showalert(context);
                  },
                  style: ElevatedButton.styleFrom
                    (
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shadowColor: Colors.black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    ),
                  child: Text("Click Me",)),
            ),

          ],
        ),
      ),
    );
  }

  void showalert(BuildContext context)
  {
    Widget okbutton = ElevatedButton(
        onPressed: ()
        {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom
          (
          foregroundColor: Colors.white, // For the Text color
          backgroundColor: Colors.blue, // For the Background
          shadowColor: Colors.black, // Shadow color
          elevation: 5, // Elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
        ),
        child: Text("Ok"));

    AlertDialog alert = AlertDialog
      (
      title: Text("Alert",style: TextStyle(fontWeight: FontWeight.bold),),
      content: Text("Are you want to exit ?",style: TextStyle(fontSize: 15),),
      actions:
      [
        okbutton
      ],
    );
    showDialog(context: context, builder: (BuildContext context)
        {
          return alert;
        }
    );

  }



}
