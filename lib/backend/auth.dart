import 'package:fashtask/core/s_messenger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAuth {
  static final firebaseAuth = FirebaseAuth.instance;

  static Future signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      var cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      ShowSnarBar.succes(context, "You are succesfully Register");
      return cred.user;
    } on FirebaseAuthException catch (error) {
      ShowSnarBar.error(context, error.message.toString());
    }
  }

  Future login() async {}
}
