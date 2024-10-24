import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task3/view/registerPage.dart';
import 'package:task3/widgets/button.dart';
import 'package:task3/widgets/socialmeadiaButton.dart';
import 'package:task3/widgets/textfileds.dart';
import 'package:task3/view/homePage.dart'; // Import homepage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Successful', style: TextStyle(fontSize: 20)),
          ),
        );

        // Navigate to homepage after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      } on FirebaseAuthException catch (e) {
        String message = '';
        if (e.code == 'user-not-found') {
          message = "No user found for that email.";
        } else if (e.code == 'wrong-password') {
          message = "Wrong password provided for that user.";
        } else {
          message = "An error occurred. Please try again.";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(message, style: const TextStyle(fontSize: 18)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 97, left: 110, right: 110),
              child: Container(
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
              textEditingController: emailController,
              hintText: 'Email',
              inputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
            ),
            CustomTextField(
              textEditingController: passwordController,
              obscureText: true,
              hintText: 'Password',
              inputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170),
              child: TextButton(
                onPressed: () {
                  // Handle password reset logic here
                },
                child: const Text(
                  'Forgot your password?',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            CustomeButton(
              onPressed: login, // Call login function
              buttontext: 'Sign in',
              margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
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
            const SocialMeadiaButton(),
          ],
        ),
      ),
    );
  }
}
