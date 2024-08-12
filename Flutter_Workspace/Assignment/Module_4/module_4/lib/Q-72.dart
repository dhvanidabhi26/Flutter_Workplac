import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Phonecall extends StatefulWidget {
  const Phonecall({super.key});

  @override
  State<Phonecall> createState() => _PhonecallState();
}

class _PhonecallState extends State<Phonecall>
{
  void initState()
  {
    super.initState();
    Permissions();
  }
  Future<void> Permissions() async
  {
    var status = await Permission.phone.request();
    if (status.isDenied)
    {
      showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text("Request for permission"),
            content: Text("Allow permission for phone call"),
            actions:
            [
              TextButton(child: Text("Deny",style: TextStyle(color: Colors.black),),

                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(child: Text("Allow",style: TextStyle(color: Colors.black),),
                onPressed: () async
                {
                  await openAppSettings();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text('Phone App'),),
      body: Center
        (
        child: Text('Permissin for phone call',style: TextStyle(color: Colors.blue),),

      ),
    );
  }
}