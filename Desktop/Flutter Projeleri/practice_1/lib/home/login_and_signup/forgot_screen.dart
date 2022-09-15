import 'package:flutter/material.dart';
import 'package:practice_1/core/components/login_signup/common_image.dart';
import 'package:practice_1/core/components/login_signup/field_label.dart';
import 'package:practice_1/core/components/login_signup/page_title.dart';
import 'package:practice_1/core/components/login_signup/rounded_button.dart';
import 'package:practice_1/core/components/login_signup/standard_field.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CommonImage(),
              const PageTitle('Forgot password'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const FieldLabel('Email'),
                    StandardField(controller: controller, hintText: 'Your email id', field: 'Email'),
                    const SizedBox(height: 20),
                     RoundedButton(title: 'Submit',press: () {
                      
                    },),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).popUntil(ModalRoute.withName("/"));
                  },
                  child: const Text('Back to login', style: TextStyle(color: Color.fromARGB(200, 107, 103, 103))))
            ],
          ),
        ),
      ),
    );
  }
}
