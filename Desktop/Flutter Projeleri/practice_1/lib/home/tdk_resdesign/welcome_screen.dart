// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
// bottom bar corners
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      bottomNavigationBar: SizedBox(height: 129,child: bottomNavigationBar()),
      body: DefaultTabController(
        length: 2,
        child: Container(
          color: Color(0xFFc91d42),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: Colors.white),
                  child: searchRow(),
                ),
              ),
              const TabBar(indicatorColor: Colors.transparent, tabs: [
                Tab(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Günün Kelimesi', style: TextStyle(fontSize: 16)),
                )),
                Tab(
                    child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('Tümü', style: TextStyle(fontSize: 16)),
                ))
              ]),
              Expanded(
                child: TabBarView(
                  children: [SingleChildScrollView(child: firstTabView()), const Center(child: Text('second tab view'))],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column firstTabView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buttonsContainer(),
        SizedBox(
          // height: 40,
          child: Stack(
            children: [
              Container(color: Colors.white, height: 30),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Color(0xFFf8f1e9)),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                      color: Color(0xFFf8f1e9)),
                  height: 30),
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0, color: Colors.white),
            ),
            child: commonRow('Son Aramalar')),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Padding(padding: const EdgeInsets.all(8.0), child: wordContainer()),
                const SizedBox(width: 20),
                Padding(padding: const EdgeInsets.all(8.0), child: wordContainer()),
              ],
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(color: Colors.white, border: Border.all(width: 0, color: Colors.white)),
            child: commonRow('Bir Deyim / Atasözü')),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFc91d42),
      leading: Column(
        children: const [
          Icon(Icons.menu),
        ],
      ),
      title: const Text('Hoşgeldiniz', style: TextStyle(fontSize: 35, color: Colors.white)),
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Column(
            children: const [
              // SizedBox(height: 10),
              Text("11.027 kelime içinden arama yapın.", style: TextStyle(fontSize: 16, color: Colors.white70)),
            ],
          )),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
        backgroundColor: Colors.white,
        iconSize: 35,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFc91d42),
        // selectedLabelStyle: TextStyle(fontSize: 0),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_outlined),
                    Divider(
                      thickness: 5,
                      color: pageIndex == 0 ? Colors.red : Colors.transparent,
                    )
                  ],
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  Divider(
                    thickness: 5,
                    color: pageIndex == 1 ? Colors.red : Colors.transparent,
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border),
                  Divider(
                    thickness: 5,
                    color: pageIndex == 2 ? Colors.red : Colors.transparent,
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history),
                  Divider(
                    thickness: 5,
                    color: pageIndex == 3 ? Colors.red : Colors.transparent,
                  )
                ],
              ),
              label: ''),
        ]);
  }

  Row searchRow() {
    return Row(
      children: [
        const SizedBox(width: 8),
        const Icon(Icons.search, color: Colors.grey),
        const SizedBox(width: 8),
        const Expanded(
            child: TextField(
          decoration: InputDecoration(hintText: 'Bir kelime yazın..', hintStyle: TextStyle(color: Colors.grey), border: InputBorder.none),
        )),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic_none, color: Color(0xFFc91d42)),
            padding: EdgeInsets.zero,
            alignment: AlignmentDirectional.center),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.content_copy_rounded, color: Color(0xFFc91d42)),
            padding: EdgeInsets.zero,
            alignment: AlignmentDirectional.centerStart),
      ],
    );
  }

  Container wordContainer() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: const Color(0xFFf3f3f2)),
      child: Row(
        children: [
          Column(
            children: const [
              Text('muazzam', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
              SizedBox(height: 4),
              Text('[s] çok büyük, kocaman', style: TextStyle(fontSize: 14, color: Color(0xFF8a8686))),
            ],
          ),
          const SizedBox(width: 100),
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border))
        ],
      ),
    );
  }

  Padding commonRow(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextButton(onPressed: () {}, child: const Text('Tümü', style: TextStyle(color: Colors.grey)))
        ],
      ),
    );
  }

  Container buttonsContainer() {
    return Container(
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: Color(0xFFf8f1e9)),
      child: Column(
        children: [
          const SizedBox(height: 35),
          const Text(
            '16.02.2020',
            style: TextStyle(color: Color(0xFFd8c4b8)),
          ),
          const Text('bayrak', style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconButtons(Icons.copy_rounded, const Color(0xFFd8c4b8), 'kopyala'),
              iconButtons(Icons.volume_up, const Color(0xFFd8c4b8), 'dinle'),
              iconButtons(Icons.bookmark_border, const Color(0xFFd8c4b8), 'kaydet'),
              iconButtons(Icons.share, const Color(0xFFd8c4b8), 'paylaş'),
            ],
          )
        ],
      ),
    );
  }

  InkWell iconButtons(IconData? iconData, Color? color, String text) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/desc');
      },
      child: Container(
        height: 64,
        width: 64,
        margin: const EdgeInsets.all(8.0),
        child: Material(
          // elevation: 5.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            // padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(iconData, color: color), const SizedBox(height: 7), Text(text, style: TextStyle(color: color))],
            ),
          ),
        ),
      ),
    );
  }
}
