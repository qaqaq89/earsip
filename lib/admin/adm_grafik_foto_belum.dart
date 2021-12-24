import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cobakoneksi2service.dart';
import 'package:google_fonts/google_fonts.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Coba Grafik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Ijazahfotobelum(),
    );
  }
}

class Ijazahfotobelum extends StatefulWidget{
  var upbjj7 = [];
  var belumfoto = [];
  ApiService apiService;

  Ijazahfotobelum({this.upbjj7, this.belumfoto});

  @override
  _IjazahfotobelumState createState() => _IjazahfotobelumState();
}

class _IjazahfotobelumState extends State <Ijazahfotobelum>{

  ApiService apiService;

  var belumfoto = [];
  var upbjj7 = [];
  var jumlahbelumfoto = [];
  var listData;
  List datagrafik;

  void getDatagrafik(String urlgrafik)async {
    final response = await http.get(urlgrafik+'/api/grafikijazahbelumadafoto');
    if (response.statusCode == 200) {
      var listData = jsonDecode(response.body);
      var res = listData as List;
      for (var i = 0; i < res.length; i++) {
        var namaupbjj = res[i]['namaupbjj'];
        var jumlahijazahbelumadafoto = res[i]['jumlahijazahbelumadafoto'];
        upbjj7.add(namaupbjj);
        belumfoto.add(jumlahijazahbelumadafoto);
        
      }
      setState(() {
        upbjj7 = upbjj7;
        belumfoto = belumfoto;
      });
      
    }
  }
  @override
  void initState(){
    super.initState();
    apiService = ApiService();
    final String urlgrafik = apiService.baseUrl;
    getDatagrafik(urlgrafik);
  }

  @override
  Widget build(BuildContext context){

    List<Ijazah> ijazahbelumfoto = [];
    for (var i = 0; i < upbjj7.length; i++) {
      ijazahbelumfoto.add(Ijazah(upbjj7[i], belumfoto[i], Colors.red));
    }

    // var diutpusat = [
    //   Ijazah("Ambon", 6, Colors.red),
    //   Ijazah("Aceh", 133, Colors.yellow),
    //   Ijazah("Lampung", 121, Colors.green),
    //   Ijazah("Bandung", 311, Colors.blue),
    //   Ijazah("Banjarmasin", 128, Colors.purple),
    //   // Ijazah("Batam", 30),
    //   // Ijazah("Bengkulu", 18),
    //   // Ijazah("Bogor", 113),
    //   // Ijazah("Denpasar", 35),
    //   // Ijazah("Dilli", 23),
    //   // Ijazah("Gorontalo", 3),
    //   // Ijazah("Jakarta", 109),
    //   // Ijazah("Jambi", 64),
    //   // Ijazah("Jayapura", 83),
    //   // Ijazah("Jember", 1),
    //   // Ijazah("Kendari", 105),
    //   // Ijazah("Kupang", 92),
    //   // Ijazah("Majene", 8),
    //   // Ijazah("Makassar", 24),
    //   // Ijazah("Malang", 226),
    //   // Ijazah("Manado", 63),
    //   // Ijazah("Mataram", 2),
    //   // Ijazah("Medan", 236),
    //   // Ijazah("Padang", 86),
    //   // Ijazah("Palangkaraya", 60),
    //   // Ijazah("Palembang", 158),
    //   // Ijazah("Palu", 94),
    //   // Ijazah("Pangkal Pinang", 19),
    //   // Ijazah("Pekanbaru", 90),
    //   // Ijazah("Pontianak", 107),
    //   // Ijazah("Purwokerto", 62),
    //   // Ijazah("Samarinda", 98),
    //   // Ijazah("Semarang", 161),
    //   // Ijazah("Serang", 96),
    //   // Ijazah("Sorong", 1),
    //   // Ijazah("Surabaya", 229),
    //   // Ijazah("Surakarta", 54),
    //   // Ijazah("Yogyakarta", 60),
    // ];


    var series = [
      charts.Series(
        domainFn: (Ijazah ijazah,_) => ijazah.foto,
        measureFn: (Ijazah ijazah,_) => ijazah.jumlah,
        colorFn: (Ijazah ijazah,_) => ijazah.warna,
        id: 'Ijazah',
        data: ijazahbelumfoto,
        labelAccessorFn: (Ijazah ijazah,_) =>
        '${ijazah.foto} : ${ijazah.jumlah.toString()}'
      ),

    ];

    var chart = charts.BarChart(
      series,
      //..Grup Bar..//
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
      

      //..Untuk Bar Chart..//
      // vertical: false,
      // barRendererDecorator: charts.BarLabelDecorator<String>(),
      // domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),

      //..Untuk Pie Chart..//
      // defaultRenderer: charts.ArcRendererConfig(
      //   arcRendererDecorators: [charts.ArcLabelDecorator()],
      //   arcWidth: 120
      // ),
      // animate: true,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: new Text(
          "Ijazah Belum di Lengkapi Foto",
          style: GoogleFonts.vollkorn(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        // title: new Container(
        //   child: Row(
        //     children: <Widget>[
        //       new Container(
        //         child: Align(
        //           alignment: Alignment.centerLeft,
        //           child: Image.asset("img/UTpng.png",
        //           width: 60.0,
        //           height: 60.0,
        //           ),
        //         ),
        //       ),
        //       new Text("Ijazah Belum Ada Foto",
        //       style: TextStyle(
        //         fontSize: 20.0,
        //         fontStyle: FontStyle.italic,
        //         color: Colors.blue[900],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  "Grafik Ijazah Belum Ada Foto",
                  style: GoogleFonts.vollkorn(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),
                  // style: TextStyle(
                  //   fontSize: 20.0,
                  //   fontStyle: FontStyle.italic,
                  //   color: Colors.blue[900],
                  // ),
                ),
                new Text(
                  "Keseluruhan Ijazah Yang Belum di Lengkapi Foto",
                  style: GoogleFonts.vollkorn(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),
                ),
                new SizedBox(
                  height: 2000,
                  child: chart
                ),
                new Text(
                  " ",
                  style: GoogleFonts.vollkorn(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),
                ),
                new Text(
                  "Note : Foto ijazah harus dilengkapi agar ijazah bisa dikirim ke masing - masing UPBJJ Universitas Terbuka",
                  style: GoogleFonts.vollkorn(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ]
            ),
          )
        ]
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(12.0),
      //   child: Column(
      //     children: <Widget>[
      //       Text(
      //         "Ijazah belum ada foto",
      //         style: TextStyle(fontSize: 20),
      //       ),
      //       SizedBox(
      //         height: 600,
      //         child: chart
      //       )
      //     ]
      //   ),
      // ),
    );
  }
}

class Ijazah {
  final String foto;
  final int jumlah;
  final charts.Color warna;

  Ijazah(this.foto, this.jumlah, Color warna) : this.warna = charts.Color(r: warna.red, g: warna.green, b: warna.blue, a: warna.alpha);
}