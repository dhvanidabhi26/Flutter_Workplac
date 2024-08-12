import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registrationpage extends StatefulWidget {
  const registrationpage({super.key});

  @override
  State<registrationpage> createState() => _registrationpageState();
}

class _registrationpageState extends State<registrationpage> {

   String _gender = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration",style: TextStyle(fontSize:24,color: Colors.black),),backgroundColor: Colors.cyan.shade500,),
      body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter, colors:
                [
                  Colors.cyan.shade500,
                  Colors.cyan.shade300,
                  Colors.cyan.shade200,
                ]
                ),
              ),
            ),

            Positioned(
                  child: Column(
                      children: [
                     Padding(
                      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                        labelText: "First Name",
                        hintText: "Enter your  Name",
                    ),
                  ),
                ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: " Enter your Email",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gender"),
                              Row(

                                children: [
                                  Radio(
                                      value: "Male",
                                      groupValue: _gender,
                                      onChanged: (value)
                                      {
                                        setState(() {
                                          _gender = value as String;
                                        });
                                      }),Text("Male"),
                                  Radio(
                                      value: "Female",
                                      groupValue: _gender,
                                      onChanged: (value)
                                      {
                                        setState(() {
                                          _gender = value as String;
                                        });
                                      }),Text("Female"),
                                ],
                              )
                            ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Mobile No.",
                              hintText: " Enter your Mobile No.",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Address",
                              hintText: " Enter your Address",
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                        ElevatedButton
                          (
                          onPressed: ()
                          {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>registrationpage()));
                          },style: ElevatedButton.styleFrom

                          (
                            backgroundColor: Colors.cyan.shade500,
                            minimumSize: Size(200, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                          child: Text("Registration",style: TextStyle(fontSize: 14,color: Colors.white),
                          ),
                        ),
                      ],
                ),
            ),
          ],
      ),
    );
  }
}
