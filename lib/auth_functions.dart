import 'package:cdgi/home1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

Future<UserCredential?> signInWithGoogle() async {
  try {
    // Create GoogleSignIn instance with scopes
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    print("Error signing in with Google: $e");
    return null;
  }
}

signup(email, password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print('------SUCCESS---------');
    Get.offAll(Home1());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Signed in as ${credential.user!.email.toString()}'),
      ),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Signed in as ${e.toString()}')));
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signin(String email, String password, BuildContext context) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    String message = '';

    if (e.code == 'user-not-found') {
      message = 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      message = 'Wrong password provided.';
    } else if (e.code == 'invalid-email') {
      message = 'Invalid email address.';
    } else {
      message = 'Login failed: ${e.message}';
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
    throw Exception(message); // Stop navigation
  }
}
