import 'package:chatter/register.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_service.dart';
import 'authicatication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  // Form key
  final _formKey = GlobalKey<FormState>();

  // Google Sign-In instance
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  // Sign in with email and password
  void _signIn() async
  {
    try {
      await AuthenticationService().signInUser(
        _emailController.text,
        _passwordController.text,
      );
      _goToAuth();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  // Navigate to authentication check
  void _goToAuth() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthCheck()),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    double displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        padding:  EdgeInsets.all(26.0),
        children: [
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
              children:
              [
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
                 SizedBox(height: 12),

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
                 SizedBox(height: 12),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  onPressed: ()
                  {
                    if (_formKey.currentState!.validate()) {
                      _signIn();
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:
                    [
                      Icon(Icons.login,color: Colors.white,),
                      SizedBox(width: 8),
                      Text("LOGIN",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  onPressed: () async {
                    await AuthenticationService().googleSignin(context);
                    _goToAuth();
                  },

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.mail,color: Colors.white,),
                      SizedBox(width: 8),
                      Text(" LOGIN WITH GOOGLE",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                 SizedBox(height: 12),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Don't have an account? Click here!",
                        style: TextStyle(
                          color:Colors.deepPurple
                        ),
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
