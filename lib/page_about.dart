import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: new Text(
          "About",
          style: GoogleFonts.vollkorn(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Pengarsipan Ijazah Universitas Terbuka",
                  style: GoogleFonts.vollkorn(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
                new Text(" "),
                new Text(
                  "Versi",
                  style: GoogleFonts.vollkorn(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.justify,
                ),
                new Text(" "),
                new Text(
                  "0.0.1",
                  style: GoogleFonts.openSans(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.justify,
                ),
                new Text(" "),
                new Text(
                  "Credit :",
                  style: GoogleFonts.openSans(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.justify,
                ),
                new Text(" "),
                new Text(
                  "Muhammad Yossy Kusuma",
                  style: GoogleFonts.openSans(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.justify,
                ),
                new Text(" "),
                new Text(
                  "Diajukan Untuk Tugas Akhir Skripsi",
                  style: GoogleFonts.openSans(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.justify,
                ),
                new Text(" "),
                new Text(
                  "Universitas Islam Negeri Syarif Hidayatullah Jakarta",
                  style: GoogleFonts.openSans(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.justify,
                ),
                new Text(" "),
                new Text(
                  "Fakultas Sains Dan Teknologi",
                  style: GoogleFonts.openSans(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.justify,
                ),
                new Text(" "),
                new Text(
                  "Program Studi Teknik Informatika",
                  style: GoogleFonts.openSans(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.justify,
                ),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(
                  "    ©Muhammad Yossy Kusuma",
                  style: GoogleFonts.vollkorn(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            )
          )
        ]
      ),
    );
  }
}