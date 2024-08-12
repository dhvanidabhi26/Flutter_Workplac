import 'package:flutter/material.dart';

class Datepicker extends StatefulWidget {
  const Datepicker({super.key});

  @override
  State<Datepicker> createState() => _DatepickerState();
}

class _DatepickerState extends State<Datepicker> {
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date Picker",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body:Center(
        child: TextFormField(
          controller: date,
          decoration: InputDecoration(
            hintText: "Select Date",
            prefixIcon: IconButton(onPressed:()
            {
                showDatePicker(context: context, firstDate: DateTime(2001), lastDate: DateTime(2050)).then((value)
                {
                  date.text = value.toString();
                });
            }
              ,icon: Icon(Icons.calendar_month_sharp),)
          ),
        ),
      ),
    );
  }
}
