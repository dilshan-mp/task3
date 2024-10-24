import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task3/services/database.dart';
import 'package:task3/view/homePage.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:
            "205005601964-9tr5619si3m6tdmsnbv2qc5t2sqscb74.apps.googleusercontent.com", // Use the correct Web Client ID
      );

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        UserCredential result = await auth.signInWithCredential(credential);
        User? userDetails = result.user;

        if (userDetails != null) {
          Map<String, dynamic> userInfoMap = {
            "email": userDetails.email,
            "name": userDetails.displayName,
            "imgUrl": userDetails.photoURL,
            "id": userDetails.uid
          };

          await DatabaseMethods().addUser(userDetails.uid, userInfoMap);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));
        }
      } else {
        print("Google Sign-In canceled by user.");
      }
    } catch (e) {
      print("Error during Google Sign-In: $e");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Google Sign-In failed. Please try again.")));
    }
  }
}
