import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task3/view/registerPage.dart';
import 'package:task3/widgets/button.dart';
import 'package:task3/widgets/socialmeadiaButton.dart';
import 'package:task3/widgets/textfileds.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 97,
              left: 110,
              right: 110,
            ),
            child: Container(
              //color: Colors.amber,
              width: 167,
              height: 45,
              child: const Text(
                'Login here',
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0XFF1F41BB),
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              //color: Colors.amber,
              width: 228,
              height: 60,
              child: const Text(
                'Welcome back you’ve\n been missed!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          CustomTextField(
            hintText: 'Name',
            inputType: TextInputType.name,
          ),
          CustomTextField(
            hintText: 'Email',
            inputType: TextInputType.emailAddress,
          ),
          CustomTextField(
            hintText: 'Password',
            inputType: TextInputType.visiblePassword,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 170),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot your password?',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          const CustomeButton(
            buttontext: 'Sign in',
            margin: EdgeInsets.only(top: 30, left: 30, right: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: const Text('Create New Account'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 65),
            child: Text('Or continue with'),
          ),
          const SocialMeadiaButton()
        ],
      ),
    );
  }
}
