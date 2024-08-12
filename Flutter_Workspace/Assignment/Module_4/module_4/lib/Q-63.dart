
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserChoice extends StatefulWidget {
  const UserChoice({super.key});

  @override
  State<UserChoice> createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Choice"),backgroundColor: Colors.blue,),
      body: Center(
        child: ElevatedButton(
          onPressed: ()
          {
            ShowAlert(context);
          },
            style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue, // Text color
            shadowColor: Colors.black, // Shadow color
            elevation: 5, // Elevation
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), // Rounded corners),
            ),
        ),child: Text("Click Me"),
    )
      )
    );
  }

  void ShowAlert(BuildContext context)
  {
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog
            (
            title: Text("Choose an option",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            content: Text("Select Any One:",style: TextStyle(fontSize: 14,),),
            actions:
            [
              TextButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "Positive Button Pressed",
                        gravity: ToastGravity.BOTTOM);
                  },
                  child: Text("Positive",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),)),
              TextButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "Negative Button Pressed",
                        gravity: ToastGravity.BOTTOM);
                  },
                  child: Text("Negative",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),)),
              TextButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "Neutral Button Pressed",
                        gravity: ToastGravity.BOTTOM);
                  },
                  child: Text("Neutral",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),))
            ],
            );
        }
        );
  }

}
