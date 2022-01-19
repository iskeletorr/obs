import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/camera.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/model/student.dart';
import 'package:flutter_auth/services/auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var url = "https://student-bf5bc-default-rtdb.firebaseio.com/students.json";
  AuthService service = AuthService();

  final fskey = new GlobalKey<FormState>();
  final sk = new GlobalKey<ScaffoldState>();

  final sb = SnackBar(
    content: Text("Success"),
    backgroundColor: Colors.green,
  );

  TextEditingController _name;
  TextEditingController _number;
  TextEditingController _email;
  TextEditingController _password;

  @override
  void initState() {
    super.initState();

    _name = new TextEditingController();
    _number = new TextEditingController();
    _email = new TextEditingController();
    _password = new TextEditingController();
  }

  Future addData() async {
    final text = fskey.currentState;
    final sks = sk.currentState;
    if (text.validate()) {
      text.save();
      final stu = new Student();
      stu.name = _name.text;
      stu.number = _number.text;
      stu.email = _email.text;
      stu.password = _password.text;
      stu.status = false;
      final response = await http.post(url, body: json.encode(stu.toJson()));
      sks.showSnackBar(sb);
      return await service.register(
        _email.text,
        _password.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: sk,
      body: Background(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: fskey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /* Container(
                    child: CameraAccess(),
                    decoration: BoxDecoration(shape: BoxShape.rectangle),
                    width: 160,
                    height: 160,
                  ), */
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Name & Surname",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurple, width: 2.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    controller: _name,
                    validator: (val) =>
                        val.isEmpty ? "Name can\'t be empty" : null,
                    onSaved: (val) => _name.text = val,
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Student Number",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurple, width: 2.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    controller: _number,
                    validator: (val) =>
                        val.isEmpty ? "Number can\'t be empty" : null,
                    onSaved: (val) => _number.text = val,
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurple, width: 2.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    controller: _email,
                    validator: (val) =>
                        val.isEmpty ? "Email can\'t be empty" : null,
                    onSaved: (val) => _email.text = val,
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Password",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurple, width: 2.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    controller: _password,
                    validator: (val) => val.length < 6
                        ? "Password can\'t be shorter than 6 characters"
                        : null,
                    onSaved: (val) => _password.text = val,
                    obscureText: true,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RoundedButton(
                    text: "SIGN UP",
                    press: () async {
                      var a = await addData();
                      print(a);
                    },
                  ),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.popAndPushNamed(
                        context,
                        "${LoginScreen()}",
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
