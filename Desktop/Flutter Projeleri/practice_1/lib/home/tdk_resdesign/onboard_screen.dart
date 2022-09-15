import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  //img background
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            color: Color(0xFFc91d42),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/welcome');
                },
                child: Row(
                  children: const [
                    Text('ATLA', style: TextStyle(color: Colors.white, fontSize: 13)),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 15)
                  ],
                ),
              ),
            ]),
          ),
          Expanded(child: Image.asset('assets/messaging.png')),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                  child: pageViewBuilder())),
        ]));
  }

  PageView pageViewBuilder() {
    return PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
              // margin: EdgeInsets.only(left:8, right:8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: Color(0xFFe72c52)),
              child: Column(
                children: [
                  const SizedBox(height: 75),
                  const Text('Detaylı Kelime İnceleme', style: TextStyle(fontSize: 28, color: Colors.white)),
                  const SizedBox(height: 15),
                  const Text('Sonuç ekranında kelimenin anlamlarını', style: TextStyle(fontSize: 20, color: Colors.white70)),
                  const Text('inceleyin, telaffuzunu dinleyin, dilerseniz ', style: TextStyle(fontSize: 20, color: Colors.white70)),
                  const Text('kütüphanenize kaydedin.', style: TextStyle(fontSize: 20, color: Colors.white70)),
                  const SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircleAvatar(radius: 5, backgroundColor: Colors.white),
                      // SizedBox(width: 8),
                      // CircleAvatar(radius: 5, backgroundColor: Colors.white),
                      // SizedBox(width: 8),
                      // CircleAvatar(
                      //   radius: 5,
                      //   backgroundColor: Colors.white,
                      //   child: CircleAvatar(radius: 4, backgroundColor: Color(0xFFe72c52)),
                      // ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: index == 0 ? Colors.transparent : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: index == 1 ? Colors.transparent : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: index == 2 ? Colors.transparent : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ));
        });
  }
}
