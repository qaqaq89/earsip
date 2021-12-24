import 'dart:convert';
// import 'package:earsip2/admin/adm_grafik_dikirim.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'package:earsip2/admin/cobakoneksi2service.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Coba Grafik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePageeee(),
    );
  }
}


class MyHomePageeee extends StatefulWidget{

  //deklarasi variabel yg ingin di gunakan pada halaman grafik
  var upbjj33 = [];
  var belumdikirim3 = [];
  var sudahdikirim3 = [];
  ApiService apiService;
  //untuk memanggil variabel yang harus ada dari setState
  MyHomePageeee({this.upbjj33,this.belumdikirim3, this.sudahdikirim3});
  //

  @override
  _MyHomePageeeeState createState() => _MyHomePageeeeState();
}

class _MyHomePageeeeState extends State <MyHomePageeee>{

  ApiService apiService;
   
  //final String urlgrafik = 'http://192.168.43.149/api/grafik';
  
  var belumdikirim3 = [];
  var sudahdikirim3 = [];
  var upbjj33 = [];
  var jumlahsudahfotobelumkirim2 = [];
  var jumlahsudahfotosudahkirim2 = [];
  var listData;  
  List datagrafik;
  
  ///fungsi ambil data dari json
  void getDatagrafik(String urlgrafik) async {

    //manggil json
    final response = await http.get(urlgrafik+'/api/grafikadafoto'); 
    
//print(response.body);
      //kalo sukses memanggil di Decode pada bagian listdata
     if (response.statusCode == 200) {
       var listData = jsonDecode(response.body); 
      
      //mengubah listdata dari json kedalam bntuk array
       var res = listData as List;
        //looping array
        for(var i = 0; i < res.length; i++){

          //nampung variabel
          var namaupbjj = res[i]['namaupbjj'];
          var jumlahsudahfotobelumkirim = res[i]['jumlahsudahfotobelumkirim'];
          var jumlahsudahfotosudahkirim = res[i]['jumlahsudahfotosudahkirim'];

          //var buatijazahsudah =  Ijazah(namaupbjj, jumlahbelumfotosudahkirim, Colors.red);
          //var buatijazahbelum =  Ijazah(namaupbjj, jumlahbelumfotobelumkirim, Colors.red[50]);

          //push array/mengisi array kosong
          upbjj33.add(namaupbjj);
          belumdikirim3.add(jumlahsudahfotobelumkirim);
          sudahdikirim3.add(jumlahsudahfotosudahkirim);
        }
        
      //untuk transfer variabel ke myhomepage
      setState(() {   
        upbjj33 = upbjj33;  
        belumdikirim3 = belumdikirim3;
        sudahdikirim3 = sudahdikirim3;
      
      });

    }
    
    //print(belumdikirim2);
    // print("data : $listData"); 
    
  }

  
  //bagian paling penting, harus ada initState
  @override
  void initState() {
     super.initState();
     apiService = ApiService();
     final String urlgrafik = apiService.baseUrl;
    
    //untuk menjalankan fungsi
    getDatagrafik(urlgrafik);
   
    
  }
  @override
  Widget build(BuildContext context){
    
   
    List<Ijazah> dikirim = []; //dijadiin list ijazah untuk chart
    List<Ijazah> belumdikirim = [];
    for(var i = 0; i < upbjj33.length; i++){ //looping dari setState

        //push variabel
         dikirim.add( Ijazah(upbjj33[i],sudahdikirim3[i], Colors.blue));
         belumdikirim.add(Ijazah(upbjj33[i].toString(),belumdikirim3[i], Colors.red[50]));
    }

    
  
    
    //print(sudahdikirim3);
    //var dikirim = sudahdikirim3;

  //  var dikirim = [
  //    Ijazah("Ambon", 6, Colors.red),
  //    Ijazah("Aceh", 133, Colors.yellow),
  //    Ijazah("Lampung", 121, Colors.green),
  //    Ijazah("Bandung", 311, Colors.blue),
  //    Ijazah("Banjarmasin", 128, Colors.purple),
  //     // Ijazah("Batam", 30),
  //     // Ijazah("Bengkulu", 18),
  //     // Ijazah("Bogor", 113),
  //     // Ijazah("Denpasar", 35),
  //     // Ijazah("Dilli", 23),
  //     // Ijazah("Gorontalo", 3),
  //     // Ijazah("Jakarta", 109),
  //     // Ijazah("Jambi", 64),
  //     // Ijazah("Jayapura", 83),
  //     // Ijazah("Jember", 1),
  //     // Ijazah("Kendari", 105),
  //     // Ijazah("Kupang", 92),
  //     // Ijazah("Majene", 8),
  //     // Ijazah("Makassar", 24),
  //     // Ijazah("Malang", 226),
  //     // Ijazah("Manado", 63),
  //     // Ijazah("Mataram", 2),
  //     // Ijazah("Medan", 236),
  //     // Ijazah("Padang", 86),
  //     // Ijazah("Palangkaraya", 60),
  //     // Ijazah("Palembang", 158),
  //     // Ijazah("Palu", 94),
  //     // Ijazah("Pangkal Pinang", 19),
  //     // Ijazah("Pekanbaru", 90),
  //     // Ijazah("Pontianak", 107),
  //     // Ijazah("Purwokerto", 62),
  //     // Ijazah("Samarinda", 98),
  //     // Ijazah("Semarang", 161),
  //     // Ijazah("Serang", 96),
  //     // Ijazah("Sorong", 1),
  //     // Ijazah("Surabaya", 229),
  //     // Ijazah("Surakarta", 54),
  //     // Ijazah("Yogyakarta", 60),
  //  ];

  //   var belumdikirim =
  //   [
  //     Ijazah("Ambon", 3, Colors.red[200]),
  //     Ijazah("Aceh", 33, Colors.yellow[200]),
  //     Ijazah("Lampung", 21, Colors.green[200]),
  //     Ijazah("Bandung", 31, Colors.blue[200]),
  //     Ijazah("Banjarmasin", 28, Colors.purple[200]),
  //   //   // Ijazah("Batam", 30),
  //   //   // Ijazah("Bengkulu", 18),
  //   //   // Ijazah("Bogor", 113),
  //   //   // Ijazah("Denpasar", 35),
  //   //   // Ijazah("Dilli", 23),
  //   //   // Ijazah("Gorontalo", 3),
  //   //   // Ijazah("Jakarta", 109),
  //   //   // Ijazah("Jambi", 64),
  //   //   // Ijazah("Jayapura", 83),
  //   //   // Ijazah("Jember", 1),
  //   //   // Ijazah("Kendari", 105),
  //   //   // Ijazah("Kupang", 92),
  //   //   // Ijazah("Majene", 8),
  //   //   // Ijazah("Makassar", 24),
  //   //   // Ijazah("Malang", 226),
  //   //   // Ijazah("Manado", 63),
  //   //   // Ijazah("Mataram", 2),
  //   //   // Ijazah("Medan", 236),
  //   //   // Ijazah("Padang", 86),
  //   //   // Ijazah("Palangkaraya", 60),
  //   //   // Ijazah("Palembang", 158),
  //   //   // Ijazah("Palu", 94),
  //   //   // Ijazah("Pangkal Pinang", 19),
  //   //   // Ijazah("Pekanbaru", 90),
  //   //   // Ijazah("Pontianak", 107),
  //   //   // Ijazah("Purwokerto", 62),
  //   //   // Ijazah("Samarinda", 98),
  //   //   // Ijazah("Semarang", 161),
  //   //   // Ijazah("Serang", 96),
  //   //   // Ijazah("Sorong", 1),
  //   //   // Ijazah("Surabaya", 229),
  //   //   // Ijazah("Surakarta", 54),
  //   //   // Ijazah("Yogyakarta", 60),
  //    ];



    var series = [
      charts.Series(
        domainFn: (Ijazah ijazah,_) => ijazah.foto,
        measureFn: (Ijazah ijazah,_) => ijazah.jumlah,
        colorFn: (Ijazah ijazah,_) => ijazah.warna,
        id: 'Ijazah',
        data: dikirim,
        labelAccessorFn: (Ijazah ijazah,_) =>
        '${ijazah.foto} : ${ijazah.jumlah.toString()}'
      ),

      charts.Series(
        domainFn: (Ijazah ijazah,_) => ijazah.foto,
        measureFn: (Ijazah ijazah,_) => ijazah.jumlah,
        colorFn: (Ijazah ijazah,_) => ijazah.warna,
        id: 'Ijazah',
        data: belumdikirim,
        labelAccessorFn: (Ijazah ijazah,_) =>
        'Belum Dikirim : ${ijazah.jumlah.toString()}'
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
        backgroundColor: Colors.grey,
        title: new Container(
          child: Row(
            children: <Widget>[
              new Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset("img/UTpng.png",
                  width: 60.0,
                  height: 60.0,
                  ),
                ),
              ),
              new Text("Grafik Pengiriman Ijazah",
              style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                color: Colors.blue[900],
                ),
              ),
            ],
          ),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  "Ijazah Sudah Ada Foto",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue[900],
                  ),
                ),
                new SizedBox(
                  height: 800,
                  child: chart
                )
              ]
            ),
          ),
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