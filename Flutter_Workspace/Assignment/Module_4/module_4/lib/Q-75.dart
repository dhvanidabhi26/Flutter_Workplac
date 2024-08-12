import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Acitivitylifecycle extends StatefulWidget {
  const Acitivitylifecycle({super.key});

  @override
  State<Acitivitylifecycle> createState() => _AcitivitylifecycleState();
}

class _AcitivitylifecycleState
    extends State<Acitivitylifecycle> {
  @override
  void initState()
  {
    super.initState();
    toastmessage("onCreate");
  }

  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();
    toastmessage("onStart");
  }

  @override
  void deactivate()
  {
    toastmessage("onPause");
    super.deactivate();
  }

  @override
  void dispose()
  {
    toastmessage("onDestroy");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar
        (
          title: Text("Life Cycle", style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Center
        (
      ),
    );
  }

  void toastmessage(String message)
  {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_RIGHT,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}