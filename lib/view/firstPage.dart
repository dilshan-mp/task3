import 'package:flutter/material.dart';
import 'package:task3/view/loginPage.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                //color: Colors.amber,
                width: 385,
                height: 422,
                child: Image.asset('assets/welcome image.png'),
              ),
            ),
          ),
          Container(
            //color: Colors.amber,
            width: 343,
            height: 106,
            child: const Text(
              "Discover Your\n Dream Job here",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1F41BB)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Container(
            //color: Colors.amber,
            width: 323,
            height: 42,
            child: const Text(
              'Explore all the existing job roles based on your interest and study major',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: Container(
                //color: Colors.amber,
                width: 350,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF1F41BB),
                        fixedSize:
                            const Size(160, 60), // Fixed width and height
                        padding: const EdgeInsets.fromLTRB(20, 15, 20,
                            15), // Padding: top, right, bottom, left
                        elevation: 0, // Remove shadow (for opacity)
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                10), // Border-radius: 10px for top-left
                            topRight: Radius.circular(10), // 0px for top-right
                            bottomLeft:
                                Radius.circular(10), // 0px for bottom-left
                            bottomRight:
                                Radius.circular(10), // 0px for bottom-right
                          ),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize:
                            const Size(160, 60), // Fixed width and height
                        padding: const EdgeInsets.fromLTRB(20, 15, 20,
                            15), // Padding: left, top, right, bottom
                        backgroundColor: Colors
                            .transparent, // Make the background transparent
                        elevation: 0, // Remove shadow (elevation)
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                10), // Border-radius: 10px for top-left
                            topRight: Radius.circular(10), // 0px for top-right
                            bottomLeft:
                                Radius.circular(10), // 0px for bottom-left
                            bottomRight:
                                Radius.circular(10), // 0px for bottom-right
                          ),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
