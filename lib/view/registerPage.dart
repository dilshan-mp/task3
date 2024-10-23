import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task3/view/homePage.dart';
import 'package:task3/view/loginPage.dart';
import 'package:task3/widgets/button.dart';
import 'package:task3/widgets/socialmeadiaButton.dart';
import 'package:task3/widgets/textfileds.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = "";
  String name = "";
  String password = "";
  String confirmPassword = "";

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> register() async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Register Successful', style: TextStyle(fontSize: 20)),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      } on FirebaseAuthException catch (e) {
        String message = '';
        if (e.code == 'weak-password') {
          message = "Password provided is too weak.";
        } else if (e.code == 'email-already-in-use') {
          message = "An account already exists with this email.";
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
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90, left: 85, right: 85),
              child: Container(
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
                width: 326,
                height: 42,
                child: const Text(
                  'Create an account so you can explore all the existing jobs',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            CustomTextField(
              textEditingController: namecontroller,
              hintText: 'Name',
              inputType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
            ),
            CustomTextField(
              textEditingController: emailcontroller,
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
              textEditingController: passwordcontroller,
              hintText: 'Password',
              inputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
            CustomTextField(
              textEditingController: confirmPasswordController,
              hintText: 'Confirm Password',
              inputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter confirm password';
                }
                if (value != passwordcontroller.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            CustomeButton(
              buttontext: 'Sign Up',
              margin: const EdgeInsets.only(left: 30, right: 30, top: 50),
              onPressed: () {
                email = emailcontroller.text.trim();
                name = namecontroller.text.trim();
                password = passwordcontroller.text.trim();
                confirmPassword = confirmPasswordController.text.trim();

                register();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('Already have an account'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 65),
              child: Text('Or continue with'),
            ),
            GestureDetector(
              onTap: () {
                // Social media login logic
              },
              child: const SocialMeadiaButton(),
            )
          ],
        ),
      ),
    );
  }
}
