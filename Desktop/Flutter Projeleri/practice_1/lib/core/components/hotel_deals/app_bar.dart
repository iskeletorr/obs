import 'package:flutter/material.dart';

AppBar commonAppBar(String title, Icon icon) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(title, style: TextStyle(fontSize: 39, fontWeight: FontWeight.w600, color: Colors.black))),
    actions: [
      Padding(
          padding: EdgeInsets.only(right: 15, top: 10),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xFFff466c),
            child: icon,
          ))
    ],
    // const Stack() ???
    // bottom: const TabBar(
    //   tabs: [Tab(text: 'Sights'), Tab(text: 'Tours'), Tab(text: 'Adventures')],
    //   indicator: BoxDecoration(shape: BoxShape.circle),
    //   labelColor: Color(0xFFff466c),
    // ),
  );
}
