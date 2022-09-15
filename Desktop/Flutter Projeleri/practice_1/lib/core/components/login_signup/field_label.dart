import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel(this.title,{super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(192, 0, 0, 0),
          ))
    ]);
  }
}
