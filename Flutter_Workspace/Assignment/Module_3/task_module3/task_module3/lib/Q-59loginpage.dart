import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Q-59registrationpage.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      // Use Stack to position elements on top of each other
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height/2,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.cyan.shade500,
              Colors.cyan.shade300,
              Colors.cyan.shade200,
            ]),
          ),

          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  "Welcome to Inside Android",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          // Use Positioned to specify the position of the Card
          top: MediaQuery.of(context).size.height / 3,
          // Adjust position as needed
          left: 0,
          right: 0,
          height: MediaQuery.of(context).size.height / 1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email", hintText: "Enter your email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", hintText: "Enter your password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("Forget Password ?"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => registrationpage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan.shade500,
                      minimumSize: Size(200, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
