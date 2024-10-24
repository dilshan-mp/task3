import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task3/services/auth.dart';

class SocialMeadiaButton extends StatefulWidget {
  const SocialMeadiaButton({super.key});

  @override
  State<SocialMeadiaButton> createState() => _SocialMeadiaButtonState();
}

class _SocialMeadiaButtonState extends State<SocialMeadiaButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          //color: Colors.amber,
          width: 200,
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  AuthMethods().signInWithGoogle(context);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(60, 44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: SvgPicture.asset(
                  'assets/icons8-google (1).svg',
                  width: 24,
                  height: 24,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(60, 44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: SvgPicture.asset(
                  'assets/icons8-facebook (1).svg',
                  width: 24,
                  height: 24,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(60, 44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: SvgPicture.asset(
                  'assets/icons8-apple (1).svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
