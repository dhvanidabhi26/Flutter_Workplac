import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  String selected = '';
  List<String> cities = ['Botad', 'Rajkot', 'Vadodara', 'Junagadh', 'Ahmadabad',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select City',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            SizedBox(height: 60,),
            ElevatedButton(onPressed: () {
              showdialog(context);
            },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
                shadowColor: Colors.black, // Shadow color
                elevation: 5, // Elevation
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), // Rounded corners),
                ),
              ),child: Text("Choice City"),
            ),
            SizedBox(height: 20,),
            Text(selected,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),)
          ],

        ),
      ),
    );
  }

  void showdialog(BuildContext context)
  {
    showDialog(
      context: context,
      builder: (BuildContext context)
      {
        return AlertDialog
          (
            title: Text('list of cities'),
            content: Container(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true, // For the alertdialog size
                itemCount: cities.length,
                itemBuilder: (BuildContext context, int index)
                {
                  return ListTile
                    (
                    title: Text(cities[index]),
                    onTap: ()
                    {
                      setState(()
                      {
                        selected = cities[index];
                      });
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            )
        );
      },
    );
  }
}