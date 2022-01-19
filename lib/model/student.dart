import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    this.key, //  uid
    this.email,
    this.name,
    this.number,
    this.password,
    this.status,
  });

  String key;
  String email;
  String name;
  String number;
  String password;
  bool status;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        key: json["key"],
        email: json["email"],
        name: json["name"],
        number: json["number"],
        password: json["password"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "email": email,
        "name": name,
        "number": number,
        "password": password,
        "status": status,
      };
}
