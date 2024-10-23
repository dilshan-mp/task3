import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String buttontext;
  final EdgeInsetsGeometry margin;
  const CustomeButton(
      {super.key, required this.buttontext, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357,
      height: 60,
      margin: margin,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: const Color(0XFF1F41BB)),
        child: Text(
          buttontext,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
