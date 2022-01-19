import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/model/student.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final _auth = FirebaseAuth.instance;
  var url = "https://student-bf5bc-default-rtdb.firebaseio.com/students.json";
  String nameUrl =
      'https://student-bf5bc-default-rtdb.firebaseio.com/students/datas/name/name';
  Student _student(User student) {
    return student != null ? Student(key: student.uid) : null;
  }

  Future signIn(String email, String password) async {
    try {
      var inputs = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = inputs.user;
      return _student(user);
    } catch (e) {
      print("Error : ${e.toString()}");
      return null;
    }
  }

  Future register(
    String email,
    String password,
  ) async {
    try {
      var inputs = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = inputs.user;
      return _student(user);
    } catch (e) {
      print("Error : ${e.toString()}");
      return null;
    }
  }

  /* Future<String> compareNames() async {
    var response = await http.get(nameUrl);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    for (int i = 0; i < jsonData.length; i++) {
      Student l = new Student();
      l.name = jsonData[i]['name'];
      if (l.name == _auth.currentUser.displayName) {
        print("Success");
        return "true";
      }
    }
    return "false";
  } */
}
