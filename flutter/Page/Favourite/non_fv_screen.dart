import 'package:flutter/material.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';

class NonFvScreen extends StatefulWidget {
  const NonFvScreen({super.key});

  @override
  State<NonFvScreen> createState() => _NonFvScreenState();
}

class _NonFvScreenState extends State<NonFvScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.asset(Assestconstant.back,height: 40,width: 40,),
               Text("Favouite",style: AppTextTheme.bold.copyWith(fontSize: 18),
                ),
              ],
            ),
          )
        ],
    );
  }
}
