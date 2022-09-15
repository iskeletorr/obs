import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle(this.title,{super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
        Text(title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ))
      ]);
  }
}
