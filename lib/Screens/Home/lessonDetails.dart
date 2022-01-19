import 'dart:convert';
import 'package:flutter_auth/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/Screens/Home/weeks.dart';

class LessonDetails extends StatefulWidget {
  final String code;
  final int weekCode;
  LessonDetails({this.code, this.weekCode});

  @override
  _LessonDetailsState createState() => _LessonDetailsState();
}

class _LessonDetailsState extends State<LessonDetails> {
  List<Lesson> ld = List<Lesson>();
  bool loading = false;
  var url = "https://student-bf5bc-default-rtdb.firebaseio.com/lessons.json";

  Future<List> getDetails() async {
    var response = await http.get(url);

    print(response.body);
    var jsonData = jsonDecode(response.body);
    setState(() {
      loading = true;
      for (int i = 0; i < jsonData.length; i++) {
        Lesson l = new Lesson();
        l.code = jsonData[i]['code'];
        l.name = jsonData[i]['name'];
        if (l.code == widget.code) {
          ld.add(l);
        }
      }
    });

    return jsonData;
  }

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return loading == false
        ? Scaffold(
            body: Center(
              child: SpinKitCircle(
                color: Colors.red,
                size: 100.0,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("${ld.first.code} -" " ${ld.first.name}"),
            ),
            body: Center(
              child: Container(
                child: ListView.builder(
                  itemCount: 14,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Weeks(code: ld.first.code),
                          )),
                      child: ListTile(
                        title: Text("Week ${index + 1}"),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
  }
}
