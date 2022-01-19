import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/lessonDetails.dart';
import 'package:flutter_auth/model/lesson.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

var url = "https://student-bf5bc-default-rtdb.firebaseio.com/lessons.json";

class Lessons extends StatefulWidget {
  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  List<Lesson> lessonList = new List<Lesson>();
  bool loading = false;

  Future<List> getLessons() async {
    var response = await http.get(url);

    print(response.body);
    var jsonData = jsonDecode(response.body);

    setState(() {
      loading = true;
      for (int i = 0; i < jsonData.length; i++) {
        Lesson l = new Lesson();
        l.code = jsonData[i]['code'];
        l.name = jsonData[i]['name'];
        l.lecturer = jsonData[i]['lecturer'];
        lessonList.add(l);
      }
    });

    return jsonData;
  }

  @override
  void initState() {
    super.initState();
    getLessons();
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
            body: Container(
              child: ListView.builder(
                itemCount: lessonList.length == null ? 0 : lessonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LessonDetails(code: lessonList[index].code),
                        )),
                    child: ListTile(
                      title: Text(lessonList[index].name),
                      subtitle: Text(lessonList[index].lecturer),
                      leading: Text(lessonList[index].code),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
