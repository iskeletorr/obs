import 'package:flutter/material.dart';
import 'package:practice_1/home/login_and_signup/forgot_screen.dart';
import 'package:practice_1/home/login_and_signup/signup_screen.dart';

import '../../core/components/login_signup/common_image.dart';
import '../../core/components/login_signup/field_label.dart';
import '../../core/components/login_signup/page_title.dart';
import '../../core/components/login_signup/password_field.dart';
import '../../core/components/login_signup/rounded_button.dart';
import '../../core/components/login_signup/standard_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(children: [
              const CommonImage(),
              const PageTitle('Log-in'),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Column(
                  children: [
                    const FieldLabel('Email'),
                    StandardField(
                      hintText: 'Your email id',
                      controller: controller,
                      field: 'Email',
                    ),
                    const SizedBox(height: 20),
                    const FieldLabel('Password'),
                    const PasswordField(), // suffix
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ForgotScreen(),
                              ),
                            );
                          },
                          child: const Text('Forget password?', style: TextStyle(color: Color.fromARGB(200, 107, 103, 103))))
                    ]),
                  ],
                ),
              ),
              RoundedButton(
                title: 'Login',
                press: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
              signupButton(),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.black45,
                  )),
                  const Text('Or login with'),
                  const Expanded(child: Divider()),
                ],
              ),
              bottomButtons()
            ]),
          ),
        ),
      ),
    );
  }

  Row signupButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account ? '),
        TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: AlignmentDirectional.centerStart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignupScreen(),
                ),
              );
            },
            child: const Text('Sign-up', style: TextStyle(color: Color(0xFF69787f), fontWeight: FontWeight.w700)))
      ],
    );
  }

  Row bottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/gmail.png'),
          style: ButtonStyle(elevation: MaterialStateProperty.all(15)),
        ),
        const SizedBox(
          width: 15,
        ),
        // IconButton(onPressed: () {}, icon: Image.asset('assets/facebook-new.png')),
        // Inkwell() or GestureDetector()
        InkWell(
          onTap: () {},
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/facebook-new.png',
                width: 32,
                height: 32,
              ),
            ),
          ),
        )
      ],
    );
  }
}
