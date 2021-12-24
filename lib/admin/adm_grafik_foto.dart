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
      home: Ijazahfoto(),
    );
  }
}

class Ijazahfoto extends StatefulWidget{
  var upbjj6 = [];
  var sudahfoto = [];
  ApiService apiService;

  Ijazahfoto({this.upbjj6, this.sudahfoto});

  @override
  _IjazahfotoState createState() => _IjazahfotoState();
}

class _IjazahfotoState extends State <Ijazahfoto>{

  ApiService apiService;

  var sudahfoto = [];
  var upbjj6 = [];
  var jumlahsudahfoto = [];
  var listData;
  List datagrafik;

  void getDatagrafik(String urlgrafik)async {
    final response = await http.get(urlgrafik+'/api/grafikijazahsudahadafoto');
    if (response.statusCode == 200) {
      var listData = jsonDecode(response.body);
      var res = listData as List;
      for (var i = 0; i < res.length; i++) {
        var namaupbjj = res[i]['namaupbjj'];
        var jumlahijazahsudahadafoto = res[i]['jumlahijazahsudahadafoto'];
        upbjj6.add(namaupbjj);
        sudahfoto.add(jumlahijazahsudahadafoto);
        
      }
      setState(() {
        upbjj6 = upbjj6;
        sudahfoto = sudahfoto;
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

    List<Ijazah> ijazahadafoto = [];
    for (var i = 0; i < upbjj6.length; i++) {
      ijazahadafoto.add(Ijazah(upbjj6[i], sudahfoto[i], Colors.lightBlue));
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
        data: ijazahadafoto,
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
          "Ijazah di Lengkapi Foto",
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
        //       new Text("Ijazah Sudah Ada Foto",
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
                  "Grafik Ijazah Sudah Ada Foto",
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
                  "Keseluruhan Ijazah Yang Sudah di Lengkapi Foto",
                  style: GoogleFonts.vollkorn(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),
                ),
                new SizedBox(
                  height: 2000,
                  child: chart
                )
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