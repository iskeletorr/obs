import 'package:flutter/material.dart';
class CommonImage extends StatelessWidget {
  const CommonImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [SizedBox(height: 200, child: Image.asset('assets/avatar.jpeg'))]);
  }
}