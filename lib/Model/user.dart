import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String password;

  const User(
      {
        required this.email,
        required this.password});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot["email"],
      password: snapshot["password"]
    );
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
