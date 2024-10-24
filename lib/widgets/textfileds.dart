import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final bool obscureText;

  // Constructor to accept dynamic hint text
  CustomTextField({
    required this.hintText,
    required this.inputType,
    required this.textEditingController,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: inputType,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          //fillColor: Color.fromARGB(255, 141, 165, 255),
          //filled: true,
          hintText: hintText,
          contentPadding: const EdgeInsets.fromLTRB(
              20, 20, 35, 20), // Padding: left, top, right, bottom
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), // Border-radius: 10px top-left
              topRight: Radius.circular(10), // 0px top-right
              bottomLeft: Radius.circular(10), // 0px bottom-left
              bottomRight: Radius.circular(10), // 0px bottom-right
            ),
            borderSide: BorderSide(width: 2),
          ),
        ),
      ),
    );
  }
}
