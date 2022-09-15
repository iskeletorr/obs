import 'package:flutter/material.dart';

class DescScreen extends StatefulWidget {
  const DescScreen({super.key});

  @override
  State<DescScreen> createState() => _DescScreenState();
}

class _DescScreenState extends State<DescScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFc91d42),
          elevation: 0,
          leading: Column(
            children: const [
              Icon(Icons.menu),
            ],
          ),
          centerTitle: true,
          title: Row(children: [
            const SizedBox(
              width: 30,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_up_outlined,
                  size: 40,
                )),
            const SizedBox(
              width: 10,
            ),
            const Text('tesadüf', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500))
          ]),
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: bottomNavigationBar()),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                color: Color(0xFFc91d42),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconButtons(Icons.font_download_outlined, const Color(0xFFd8c4b8), 'font'),
                        iconButtons(Icons.copy_rounded, const Color(0xFFd8c4b8), 'kopyala'),
                        iconButtons(Icons.bookmark_border, const Color(0xFFd8c4b8), 'kaydet'),
                        iconButtons(Icons.sign_language_outlined, const Color(0xFFd8c4b8), 'işaret dili'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: Colors.white),
                      child: const TabBar(
                          indicatorWeight: 4,
                          indicatorColor: Colors.red,
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.red,
                          tabs: [
                            Tab(child: Text('Anlam', style: TextStyle(fontSize: 15))),
                            Tab(child: Text('Deyim', style: TextStyle(fontSize: 15))),
                            Tab(child: Text('Birleşik Kelime', style: TextStyle(fontSize: 15)))
                          ]),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      color: Colors.white,
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 15),
                                    bodyColumn(),
                                    const SizedBox(height: 50),
                                    bodyColumn(),
                                    const SizedBox(height: 50),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Center(child: Text('2. view')),
                        const Center(child: Text('3. view'))
                      ])))
            ],
          ),
        ));
  }

  Column bodyColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(width: 7),
            RichText(
                text: const TextSpan(children: [
              TextSpan(text: 'İsim', style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold)),
              TextSpan(text: "   "),
              // oto alt satıra geçme
              TextSpan(
                text: 'Yalnız ihtimallere bağlı olduğu \ndüşünülen olayların kesin olmayan, \ndeğişebilen sebebi:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
              )
            ])),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          '"Öyle bir tesadüf olsa ki bir saatçik şu doktorla oturup konuşabilse!"',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        const Text(
          'Memduh Şevket Esendal',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
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
        selectedLabelStyle: TextStyle(fontSize: 20),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home_outlined),
                  Divider(
                    thickness: 5,
                    color: pageIndex == 0 ? Colors.red : Colors.transparent,
                  )
                ],
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

  InkWell iconButtons(IconData? iconData, Color? color, String text) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 64,
        width: 64,
        margin: const EdgeInsets.all(8.0),
        child: Material(
          // elevation: 5.0,
          color: Colors.pinkAccent,
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
