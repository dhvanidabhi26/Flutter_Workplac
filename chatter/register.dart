import 'package:flutter/material.dart';
import 'authicatication.dart';
import 'homescreen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Form key
  final _formKey = GlobalKey<FormState>();

  // Check if passwords match
  bool _doPasswordsMatch() {
    return _passwordController.text == _confirmPasswordController.text;
  }
  void _signUp() async {
    try {
      await AuthenticationService().signUpUser(
        _emailController.text,
        _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('Register',style: TextStyle(color: Colors.deepPurple),)),
      body: ListView(
        padding: const EdgeInsets.all(26.0),
        children:
        [
         SizedBox(height: displayHeight / 6),
         Icon(Icons.message, size: 90,color: Colors.deepPurple,),
         SizedBox(height: 18),
       Center(
        child: Text(
            "Chatter",
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 25,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            )
        ),
      ),
      SizedBox(height: 20),

      Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration
                  (
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(60)),
                  hintText: "Enter Email",
                  prefixIcon: Icon(Icons.email_outlined,color: Colors.deepPurple[900],),
                )
            ),
            SizedBox(height: 15),

            TextFormField(
              controller: _passwordController,
              obscureText:true,
              decoration: InputDecoration
                (
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
                hintText: "Enter Password",
                prefixIcon: Icon(Icons.lock,color: Colors.deepPurple[900],),

              ),
            ),
               SizedBox(height: 15),

                TextFormField(
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
                    hintText: "Confirm Password",
                    prefixIcon: Icon(Icons.lock,color: Colors.deepPurple[900],),
                  ),
                ),
               SizedBox(height: 15),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (!_doPasswordsMatch()) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Error"),
                            content: const Text("Passwords do not match"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      } else {
                        _signUp();
                      }
                    }
                  },
                  child: Text("REGISTER",style:TextStyle(color: Colors.white),),
                ),
                 SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Already have an account? Click here!",
                        style: TextStyle(color:Colors.deepPurple),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
