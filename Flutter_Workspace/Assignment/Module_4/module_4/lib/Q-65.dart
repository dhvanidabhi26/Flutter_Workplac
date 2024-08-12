
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Exitpage extends StatelessWidget
{
  const Exitpage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exit Demo",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: TextButton(
                  onPressed: ()
                  {
                    showDialog(context: context, builder: (context)
                    {
                      return AlertDialog
                        (
                        title: Text("Are you sure to exit of this app"),
                        actions: [
                          ElevatedButton(onPressed: ()
                          {
                            Navigator.pop(context);
                          }, child: Text("No",style: TextStyle(color: Colors.blue),)),
                          ElevatedButton(onPressed: ()
                          {
                            SystemNavigator.pop();
                          }, child: Text("Yes",style: TextStyle(color: Colors.blue),)),
                        ],
                      );
                    });
                  }, child: Text("Exit",style: TextStyle(color: Colors.blue,fontSize: 22),)),
            )
          ],
        ),
      ),
    );
  }
}