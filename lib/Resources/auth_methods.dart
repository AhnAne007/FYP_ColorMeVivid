import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User user;

  //SignUp User or Register New User
  Future<String> signUpUser(
      {required String email, required String password}) async {
    String res = "Some Error Occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
        await _firestore.collection("users").doc(_auth.currentUser?.uid).set({
          "email": email,
          "savedimages": [],
          "uid": _auth.currentUser?.uid,
        });
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some Error Occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginOut() async {
    String res = "Some Error Occured";
    try {
      await _auth.signOut();
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
