import 'package:flutter/material.dart';
import 'package:food_recipe/constant/assestconstant.dart';
import 'package:food_recipe/constant/colorconstant.dart';
import 'package:food_recipe/constant/iconconstant.dart';
import 'package:food_recipe/project_spicific/text_theme.dart';
import 'package:get/get.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final List<String> items = ['Fried Rice', 'Pasta', 'Noodles'];
  final List<String> _list = ['Cooking Oil', 'Carrot', 'Salt', 'Pepper', 'Garlic', 'Onion'];
  final List<String> quantities = ['2tsp','2pc','2tsp','2pc','2tsp','2pc'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    Assestconstant.back,
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  "Shopping",
                  style: AppTextTheme.bold.copyWith(fontSize: 18, color: Colors.orange),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ExpansionTile(
                      title: Text(items[index]),
                      leading: Image.asset(Assestconstant.shoppingimage, height: 50, width: 50),
                      children: _list.map((ingredient) {
                        return ListTile(
                          leading: Image.asset(Iconconstant.closecircle,width: 20,height: 20,),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(ingredient),
                              Text(quantities[index])
                            ],
                          ),
                    
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
