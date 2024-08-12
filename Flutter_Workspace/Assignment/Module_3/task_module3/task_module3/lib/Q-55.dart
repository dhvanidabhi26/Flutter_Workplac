import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class checkbox extends StatefulWidget {
  const checkbox({super.key});

  @override
  State<checkbox> createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {

  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CheckBox Example"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Checkbox(
              value: ischecked,
              onChanged: (value)
                {
                  setState(() {
                    ischecked= value!;
                  });
                }),
            SizedBox(height: 20),
            Visibility(
                visible: ischecked,
                child: Text("CheckBox Demo"))],
        ),
      ),

    );
  }
}
