import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: TextFormField(
        decoration: const InputDecoration(hintText: 'Password'),
        obscureText: obscure,
      )),
      IconButton(
          onPressed: () {
            obscure = !obscure;
            setState(() {
              
            });
          },
          icon: const Icon(Icons.remove_red_eye, color: Color(0xFF69787f)))
    ]);
  }
}
