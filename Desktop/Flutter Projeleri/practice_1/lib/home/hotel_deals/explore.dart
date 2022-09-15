import 'package:flutter/material.dart';
import 'package:practice_1/core/components/hotel_deals/app_bar.dart';
import 'package:practice_1/core/components/hotel_deals/dot_tab_indicator.dart';
import 'package:practice_1/core/components/hotel_deals/rating_bar.dart';
import 'package:practice_1/home/hotel_deals/settings.dart';

import 'favorites.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int _pageIndex = 0;
  List<String> routes = ['/explore', '/explore', '/favorites', '/settings'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Explore', const Icon(Icons.noise_control_off_rounded)),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: botNavBar(context),
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              columnTabBar(),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(children: const [Text('27 sights', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black))]),
                          const SizedBox(height: 20),
                          columnSingleChildScrollView(),
                          const SizedBox(height: 10),
                          columnRowText(),
                          const SizedBox(height: 10),
                          columnListTile(),
                        ],
                      ),
                    ),
                    const Center(child: Text("Tours view")),
                    const Center(child: Text("Adventures view")),
                  ],
                ),
              ),
              // Row(children: const [Text('27 sights', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black))]),
              // const SizedBox(height: 20),
              // columnSingleChildScrollView(),
              // const SizedBox(height: 10),
              // columnRowText(),
              // const SizedBox(height: 10),
              // columnListTile(),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar botNavBar(BuildContext context) {
    return BottomNavigationBar(
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
        // selected tab icon ??
        BottomNavigationBarItem(icon: Icon(Icons.do_not_disturb_on_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.turned_in_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
      ],
      iconSize: 30,
      selectedItemColor: const Color(0xFFff466c),
      unselectedItemColor: Colors.grey,
    );
  }

  TabBar columnTabBar() {
    return const TabBar(
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
    );
  }

  SingleChildScrollView columnSingleChildScrollView() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            columnSizedBoxImage(),
            const SizedBox(width: 20, height: 20),
            columnSizedBoxImage(),
          ],
        ));
  }

  SizedBox columnSizedBoxImage() {
    return SizedBox(
        width: 280,
        height: 280,
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
          const Positioned(child: RatingBar(rating: 3.6)),
          const Positioned(
              bottom: 30,
              left: 20,
              child: Text('The Weekend\nAddress', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white)))
        ]));
  }

  Row columnRowText() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text(
        'Popular',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: TextButton(
            onPressed: () {}, child: const Text('View All', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Colors.black))),
      )
    ]);
  }

  ListTile columnListTile() {
    return ListTile(
      leading:
          SizedBox(width: 60, height: 60, child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black))),
      title: const Text('European Tour', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21, color: Colors.black)),
      subtitle: const Text('15 August - 23 August 2022', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.play_arrow_rounded,
            color: Colors.black,
          )),
    );
  }
}
