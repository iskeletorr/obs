import 'package:flutter/material.dart';
import 'package:flutter_auth/services/upload.dart';

class Weeks extends StatefulWidget {
  final String code;
  Weeks({this.code});

  @override
  _WeeksState createState() => _WeeksState();
}

class _WeeksState extends State<Weeks> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: size.height * 0.12),
          SizedBox(height: size.height * 0.03),
          Upload()
        ],
      ),
    ));
  }
}
