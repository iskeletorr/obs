import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.title, required this.press}) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(21), color: const Color(0xFF243b44)),
        child:
            TextButton(onPressed: press, child: Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white))));
  }
}
