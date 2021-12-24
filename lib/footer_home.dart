import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './homepage.dart' as halamanutama;

void main(){
  runApp(new MaterialApp(
    title: "Footer Home",
    home: new Footer(),
  ));
}

class Footer extends StatefulWidget{
  @override
  _FooterState createState() => new _FooterState();
}

class _FooterState extends State<Footer> with SingleTickerProviderStateMixin{
  
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 1);
    super.initState();
  }

    @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new halamanutama.Home(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue[900],
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Text(
            "Selamat Datang di Aplikasi Pengarsipan Ijazah Universitas Terbuka",
            textAlign: TextAlign.center,
            style: GoogleFonts.vollkorn(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white
            ),
            // style: new TextStyle(
            //   fontSize: 18.0,
            //   fontStyle: FontStyle.italic,
            //   color: Colors.white
            // ),
          ),
          // child: new Text(
          //   "Selamat Datang di Aplikasi Pengarsipan Ijazah",
          //   textAlign: TextAlign.center,
          //   style: GoogleFonts.vollkorn(
          //     fontSize: 16.0,
          //     fontWeight: FontWeight.bold,
          //     fontStyle: FontStyle.italic,
          //     color: Colors.white
          //   ),
          //   // style: new TextStyle(
          //   //   fontSize: 18.0,
          //   //   fontStyle: FontStyle.italic,
          //   //   color: Colors.white
          //   // ),
          // ),
        ),
      ),
    );
  }
}