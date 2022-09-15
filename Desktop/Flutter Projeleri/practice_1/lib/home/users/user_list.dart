import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice_1/core/components/card/user_card.dart';
import 'package:practice_1/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<UserModel> userList = [];
  String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<void> getUsers() async {
    final response = await http.get(Uri.parse(url));
    List jsonData = jsonDecode(response.body);
    userList = jsonData.map((e) => UserModel.fromJson(e)).toList();
    // for (int i = 0; i < jsonData.length; i++) {

    //   // UserModel u = UserModel();
    //   // u.id = jsonData[i]['id'];
    //   // u.title = jsonData[i]['title'];
    //   // u.userId = jsonData[i]['userId'];
    //   // u.body = jsonData[i]['body'];
    //   userList.add(  UserModel.fromJson(jsonData[i]));
    // }
    // userList.addAll();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: bodyListView(),
    );
  }

  ListView bodyListView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserCard(
                    model: userList[index],
                  ),
                )),
            child: Card(child: ListTile(title: Text(userList[index].title!))));
      },
      itemCount: userList.length,
      // itemCount: userList.length,
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text("User List"),
      leading: Icon(Icons.person),
    );
  }
}
