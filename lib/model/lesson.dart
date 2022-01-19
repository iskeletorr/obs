import 'dart:convert';

List<Lesson> lessonFromJson(String str) =>
    List<Lesson>.from(json.decode(str).map((x) => Lesson.fromJson(x)));

String lessonToJson(List<Lesson> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lesson {
  Lesson({
    this.code,
    this.lecturer,
    this.name,
  });

  String code;
  String lecturer;
  String name;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        code: json["code"],
        lecturer: json["lecturer"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "lecturer": lecturer,
        "name": name,
      };
}
