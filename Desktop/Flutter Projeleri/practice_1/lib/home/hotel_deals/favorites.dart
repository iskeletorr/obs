import 'package:flutter/material.dart';
import 'package:practice_1/core/components/hotel_deals/app_bar.dart';

import '../../core/components/hotel_deals/dot_tab_indicator.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  int _pageIndex = 2;
  List<String> routes = ['/explore', '/explore', '/favorites', '/settings'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Favorites', Icon(Icons.do_not_disturb_on_rounded)),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: BottomNavigationBar(
          // backgroundColor: Colors.transparent,
          currentIndex: _pageIndex,
          onTap: (int index) {
            setState(() {
              _pageIndex = index;
              Navigator.popAndPushNamed(context, routes.elementAt(index));
            });
          },
          elevation: 0,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.do_not_disturb_on_rounded), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.turned_in_rounded), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
          ],
          iconSize: 30,
          selectedItemColor: const Color(0xFFff466c),
          unselectedItemColor: Colors.grey,
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TabBar(
                  isScrollable: true,
                  // padding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: "Sights"),
                    Tab(text: "Tours"),
                    Tab(text: "Adventures"),
                  ],
                  indicator: DotIndicator(color: Color(0xFFff466c)),
                  // indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black,width: 5.0),insets: EdgeInsets.symmetric(horizontal:25.0)),
                  labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
                  labelColor: Color(0xFFff466c),
                  unselectedLabelColor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 330,
                    height: 230,
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black),
                      ),
                      const Positioned(
                          top: 15,
                          right: 15,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFff466c),
                            child: Icon(Icons.turned_in),
                          )),
                    ])),
                ListTile(
                  title: const Text('European Tour', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21, color: Colors.black)),
                  subtitle:
                      const Text('15 August - 23 August 2022', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 330,
                    height: 230,
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black),
                      ),
                      const Positioned(
                          top: 15,
                          right: 15,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFff466c),
                            child: Icon(Icons.turned_in),
                          )),
                    ])),
                ListTile(
                  title: const Text('European Tour', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21, color: Colors.black)),
                  subtitle:
                      const Text('15 August - 23 August 2022', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
