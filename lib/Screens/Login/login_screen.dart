import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/lessons.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/services/auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService service = AuthService();
  final formStateKey = new GlobalKey<FormState>();

  TextEditingController _password;
  TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _email = new TextEditingController();
    _password = new TextEditingController();
  }

  Future<bool> loginCheck() async {
    final text = formStateKey.currentState;
    if (text.validate()) {
      text.save();
      var c = await service.signIn(_email.text, _password.text);
      if (c != null) {
        Navigator.pushNamed(context, "/lessons");
        return true;
      } else
        return false;
    }
    print("Error: ${text.toString()}");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: formStateKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 5.0,
                      height: 50.0,
                    ),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: size.height * 0.35,
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "E-mail",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                        controller: _email,
                        validator: (val) =>
                            val.isEmpty ? "E-mail can\'t be empty" : null,
                        onSaved: (val) => _email.text = val,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                      height: 25.0,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                      child: TextFormField(
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
                    ),
                    SizedBox(height: size.height * 0.03),
                    RoundedButton(
                      text: "LOGIN",
                      press: () {
                        if (loginCheck() == true)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Lessons();
                              },
                            ),
                          );
                      },
                    ),
                    SizedBox(height: size.height * 0.030),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
