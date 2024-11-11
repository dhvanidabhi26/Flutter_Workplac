// import 'package:demo_create/custom_widgets/password/password.dart';
// import 'package:demo_create/widget/video_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Other extends StatefulWidget {
//   const Other({super.key});
//
//   @override
//   State<Other> createState() => _OtherState();
// }
//
// class _OtherState extends State<Other> {
//   final TextEditingController _passwordController = TextEditingController();
//   final GlobalKey _passwordKey = GlobalKey();
//
//   void _onNextPressed() {
//     // Check if the password is valid using the key
//     if (_passwordKey.currentState != null && _passwordKey.currentState!.isPasswordValid()) {
//       Get.to(() => VideoPickerDemo());
//     } else {
//       // Show a Snackbar if the password is not valid
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a valid password')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(top: 40),
//         child: Column(
//           children: [
//             Password(
//               key: _passwordKey,  // Assign key here
//               controller: _passwordController,
//               title: "Password",
//               text: "Enter Your Password",
//               textTitle: 'password',
//               textColor: Colors.pink,
//               titleColor: Colors.black,
//               isLabelTextShow: true,
//               titleSize: 25,
//               hintFontSize: 20,
//               labelFontSize: 15,
//             ),
//             ElevatedButton(
//               onPressed: _onNextPressed,
//               child: const Text("Next"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
