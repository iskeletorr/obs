import 'package:flutter/material.dart';

class StandardField extends StatelessWidget {
  const StandardField({super.key, required this.controller, required this.hintText, required this.field});
  final TextEditingController controller;
  final String hintText;
  final String field;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      controller: controller,
      validator: (val) => val!.isEmpty ? "${field} can't be empty" : null,
      onSaved: (val) {
        controller.text = val.toString();
      },
    );
  }
}
