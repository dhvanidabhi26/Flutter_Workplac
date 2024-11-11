import 'package:flutter/material.dart';
import 'password_validator.dart';

class Password extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final double titleSize;
  final Color titleColor;
  final String text;
  final Color textColor;
  final double textSize;
  final bool isLabelTextShow;
  final Icon icon;

  const Password({
    Key? key,
    required this.title,
    required this.controller,
    required this.text,
    required this.textColor,
    required this.titleColor,
    required this.isLabelTextShow,
    required this.titleSize,
    required this.textSize,
    required this.icon,
  }) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool passwordVisible = false;
  String _errorMessage = '';

  void _checkPassword() {
    final password = widget.controller.text;
    setState(() {
      _errorMessage = PasswordValidator.validatePassword(password);
    });
  }

  bool isPasswordValid() {
    final password = widget.controller.text;
    return PasswordValidator.validatePassword(password).isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            TextFormField(
            obscureText: !passwordVisible,
            controller: widget.controller,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              labelText: widget.isLabelTextShow ? widget.title : null,
              hintText: widget.text,
              helperText: _errorMessage.isNotEmpty ? _errorMessage : null,
              helperStyle: const TextStyle(color: Colors.red, fontSize: 13),
              hintStyle: TextStyle(color: widget.textColor, fontSize: widget.textSize),
              labelStyle: TextStyle(color: widget.titleColor, fontSize: widget.titleSize),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.black,
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            onChanged: (_) => _checkPassword(),
          ),
        ],
      ),
    );
  }
}
