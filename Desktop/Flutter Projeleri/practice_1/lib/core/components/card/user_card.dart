import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice_1/model/comment_model.dart';
import 'package:practice_1/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserCard extends StatelessWidget {
  ///// stateless??????????
  UserCard({super.key, required this.model});
  final UserModel model;

  String url = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<CommentModel>> getComments() async {
    List<CommentModel> commentList = [];
    // List<CommentModel> commentList2 = [];
    final response = await http.get(Uri.parse('$url?postId=${model.id}'));
    List jsonData = jsonDecode(response.body);
    commentList = jsonData.map((e) => CommentModel.fromJson(e)).toList();

    // // one-line?????????????????????????????
    // for (int i = 0; i < commentList.length; i++) {
    //   if (commentList[i].postId == model.id) {
    //     commentList2.add(commentList[i]);
    //   }
    // }
    return commentList;
    // ?????????????????????????????
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // except SafeArea??????????????
        child: FutureBuilder<List<CommentModel>>(
            future: getComments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                        title: Text(model.title!),
                        subtitle: Text(model.body!),
                        trailing: Text(model.id.toString()),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length??0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].email!),
                          subtitle: Text(snapshot.data![index].name!),
                          leading: CircleAvatar(
                            child: Text(snapshot.data![index].postId.toString()),
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
