import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Helper method for creating TextFormField
  Widget buildTextField({
    required String labelText,
    required String hintText,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Container(
        width: 300,
        height: 50,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.greenAccent[70],
          ),
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/images02.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to Quizzit",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      // Username Field
                      buildTextField(
                        labelText: 'Username',
                        hintText: 'Enter username',
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),

                      // Email Field
                      buildTextField(
                        labelText: 'Email',
                        hintText: 'Enter email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),

                      // Mobile Number Field
                      buildTextField(
                        labelText: 'Mobile Number',
                        hintText: 'Enter mobile number',
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a mobile number';
                          }
                          if (value.length != 10) {
                            return 'Mobile number must be 10 digits';
                          }
                          return null;
                        },
                      ),

                      // Password Field
                      buildTextField(
                        labelText: 'Password',
                        hintText: 'Enter password',
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),

                      // Confirm Password Field
                      buildTextField(
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your password',
                        controller: _confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),

                      // Terms and Privacy Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked = newValue ?? false;
                              });
                            },
                            activeColor: Colors.purple,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle the "Terms & Privacy" link tap
                            },
                            child: RichText(
                              text: TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Terms & Privacy",
                                    style: TextStyle(
                                      color: Colors.deepPurple[700],
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),
                      MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() && _isChecked) {
                            // Perform the signup action
                          } else if (!_isChecked) {
                            // Show a message that terms must be accepted
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please agree to the Terms & Privacy')),
                            );
                          }
                        },
                        color: Colors.deepPurple[500],
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text("Sign up"),
                      ),

                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("------------------- OR -------------------"),
                      ),
                      SizedBox(height: 5,),
                      Image.asset("images/g1.png",height: 50,width: 50,),


                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.deepPurple[700]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

