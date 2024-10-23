import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 85, right: 85),
            child: Container(
              //color: Colors.amber,
              width: 250,
              height: 45,
              child: const Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0XFF1F41BB)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Container(
              //color: Colors.red,
              width: 326,
              height: 42,
              child: const Text(
                'Create an account so you can explore all the existing jobs',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}