import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _pageIndex = 3;
  List<String> routes = ['/explore', '/explore', '/favorites', '/settings'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('Settings', style: TextStyle(fontSize: 39, fontWeight: FontWeight.w600, color: Colors.black))),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15, top: 10),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFff466c),
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          )
        ],
        // const Stack() ???
        // bottom: const TabBar(
        //   tabs: [Tab(text: 'Sights'), Tab(text: 'Tours'), Tab(text: 'Adventures')],
        //   indicator: BoxDecoration(shape: BoxShape.circle),
        //   labelColor: Color(0xFFff466c),
        // ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: BottomNavigationBar(
          // backgroundColor: Colors.transparent,
          elevation: 0,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: _pageIndex,
          onTap: (int index) {
            setState(() {
              _pageIndex = index;
              Navigator.popAndPushNamed(context, routes.elementAt(index));
            });
          },
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Jassy M. Smith',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'NY, U.S.A.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),
          const ListTile(
              title: Text(
                'My Tickets',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500, color: Colors.black),
              ),
              leading: Icon(Icons.widgets, color: Colors.black)),
          const SizedBox(
            height: 15,
          ),
          const ListTile(
              title: Text(
                'Profile Settings',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500, color: Colors.black),
              ),
              leading: Icon(Icons.person_pin_rounded, color: Colors.black)),
          const SizedBox(
            height: 15,
          ),
          const ListTile(
              title: Text('Payment', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500, color: Colors.black)),
              leading: Icon(Icons.payment_rounded, color: Colors.black)),
          const SizedBox(
            height: 15,
          ),
          const ListTile(
              title: Text('Notification', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500, color: Colors.black)),
              leading: Icon(
                Icons.topic_rounded,
                color: Colors.black,
              ))
        ]),
      ),
    );
  }
}
