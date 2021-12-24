import 'package:flutter/material.dart';
import '../user/cobagrafik.dart';
// import '../user/cobagrafik_adafoto.dart.bak';
// import '../user/cobadataarsipijazah.dart.bak';
import '../user/cobagrafikadafoto.dart';
import 'package:earsip2/upbjj/upbjj_dai.dart';

class Navbargpi extends StatefulWidget {
  @override
  _NavbargpiState createState() => _NavbargpiState();
}

class _NavbargpiState extends State<Navbargpi> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyBottomNavigationBar(),
    );
  }
}




class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    MyHomePage(),
    MyHomePageeee(),
    Daiupbjj(),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.clear
            ),
            title: new Text(
              "Belum Ada Foto"
            )
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.check
            ),
            title: new Text(
              "Ada Foto"
            )
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.date_range
            ),
            title: new Text(
              "Data Arsip"
            )
          ),
        ],
      ),
    );
  }
}