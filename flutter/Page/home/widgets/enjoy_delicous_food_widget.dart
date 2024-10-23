import 'package:flutter/material.dart';

class EnjoyDelicousFoodWidget extends StatelessWidget {
  final bool isSelected;
  final String image;
  final String name;
  final VoidCallback onPress;

  const EnjoyDelicousFoodWidget({
    super.key,
    required this.isSelected,
    required this.image,
    required this.name, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: isSelected ? 4.0 : 1.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 40,
                width: 40,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
