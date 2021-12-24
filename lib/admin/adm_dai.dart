import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cobakoneksi2.dart';
import 'cobakoneksi2service.dart';
import 'package:google_fonts/google_fonts.dart';
import './adm_inputijazah_api.dart' as editijazah;
// import 'package:dio/dio.dart';
import 'package:earsip2/admin/cobakoneksi2.dart';

// import 'package:earsip2/admin/adm_dashboard.dart' as coba2;

class Dai extends StatefulWidget {

  Dai() : super();
  @override
  _DaiState createState() => _DaiState();
}

class _DaiState extends State<Dai> {

  String nim = '0';
  bool visibility = true; //user jadi false
  bool hilangnav = false;
  bool dataketemu = true;
  // GlobalKey<ScaffoldState> _scaffoldKey;
  // Arsip _selectedArsip;
  BuildContext context;
  ApiService apiService;
  // Dio dio = new Dio();
  List<Arsip> arsips;
  String posisi = '0';
  String batas = '10';
  String hal = '1';
  String urlcari = '';
  

    Future getArsips() async{
       apiService = ApiService();
    String urlcari = apiService.baseUrl;
      setState(() {
        visibility = true;
      });
      http.post(urlcari+"/api/cari", body: {"nim": nim, "posisi": posisi, "batas": batas}).then(
        (response) {
      
      var myresponse = response.body;
      print(myresponse);
      if(myresponse == '[]'){
        
        setState(() {
          visibility = false;
          dataketemu = false;
        });
      }else{
         print(myresponse);
      setState(() {
        arsips = arsipFromJson(myresponse);
        visibility = false;
        dataketemu = true;
      });
      }
     
      
     
    });
    
  }

  @override
  void initState(){
    super.initState();
    ApiService();
    
    
    // _scaffoldKey = GlobalKey();
    apiService = ApiService();
    String urlcari = apiService.baseUrl;
    setState(() {
      urlcari = urlcari;
    });
    
    
    getArsips(); //user diilangin
    
  }

  SingleChildScrollView _dataBody(List<Arsip> arsips){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
          label: new Text("No"),
          numeric: false,
          tooltip: "No.",
        ),
            DataColumn(
          label: new Text("Batch"),
          numeric: false,
          tooltip: "Batch",
        ),
        DataColumn(
          label: new Text("NIM"),
          numeric: false,
          tooltip: "NIM",
        ),
        DataColumn(
          label: new Text("Nama"),
          numeric: false,
          tooltip: "Nama",
        ),
        DataColumn(
          label: new Text("Program Studi"),
          numeric: false,
          tooltip: "Program Studi",
        ),
        // DataColumn(
        //   label: new Text("Sentra"),
        //   numeric: false,
        //   tooltip: "Sentra",
        // ),
        DataColumn(
          label: new Text("UPBJJ-UT"),
          numeric: false,
          tooltip: "UPBJJ-UT",
        ),
        DataColumn(
          label: new Text("Yudisium"),
          numeric: false,
          tooltip: "Yudisium",
        ),
        DataColumn(
          label: new Text("Status Foto"),
          numeric: false,
          tooltip: "Status Foto",
        ),
        DataColumn(
          label: new Text("Status Ijazah"),
          numeric: false,
          tooltip: "Status Ijazah",
        ),
        // DataColumn(
        //   label: new Text("Tanggal Kirim"),
        //   numeric: false,
        //   tooltip: "Tanggal Kirim",
        // ),
        DataColumn(
          label: new Text("Edit"),
          numeric: false,
          tooltip: "Edit",
        ),
        DataColumn(
          label: new Text("Hapus"),
          numeric: false,
          tooltip: "Hapus",
        ),
          ],
          rows: arsips?.map((arsip) => DataRow(
            cells: [
              DataCell(
                Text(arsip.id.toString()??'-')
              ),
              DataCell(
                Text(arsip.batch??'-')
              ),
              DataCell(
                Text(arsip.nim.toString()??'-')
              ),
              DataCell(
                Text(arsip.nama??'-')
              ),
              DataCell(
                Text(arsip.prodi??'-')
              ),
              DataCell(
                Text(arsip.upbjj??'-')
              ),
              DataCell(
                Text(arsip.yudisium.toString()??'-')
              ),
              DataCell(
                Text(arsip.statusfoto??'-')
              ),
              DataCell(
                Text(arsip.statuskelengkapan??'-')
              ),
              // DataCell(
              //   Text(arsip.kirim??'-')
              // ),
              DataCell(
                IconButton(
                  icon: Icon(Icons.edit), 
                  onPressed: ()async{
                    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return editijazah.FormAddScreenIjazah(arsip: arsip);
                    }));
                    if (result != null) {
                      setState(() {});
                    }
                  },
                )
              ),
              DataCell(
                IconButton(
                  icon: Icon(Icons.delete), 
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Warning"),
                          content: Text(
                            "Apakah anda yakin ingin menghapus data arsip ${arsip.nama}?"
                            // "Are you sure want to delete data profile ${arsip.nama}?"
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Yes"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  apiService
                                  .deleteArsip(arsip.id)
                                  .then((isSuccess) {
                                    if (isSuccess) {
                                      setState(() {});
                                      Scaffold.of(this.context)
                                      .showSnackBar(SnackBar(
                                        content: Text(
                                          "Delete data success"
                                          )
                                        )
                                      );
                                    } else {
                                      Scaffold.of(this.context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                            "Delete data failed"
                                          ),
                                        ),
                                      );
                                    }
                                  });
                                },
                              ),
                              FlatButton(
                                child: Text("No"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                      }
                    )
                  ),
                ]
              ))?.toList() ?? [],
            ),
          ),
        );
      }


  @override
  Widget build(BuildContext context) {

    // tampilalert(){
    //   showDialog(context: context,
    //   builder: (context){
    //     return AlertDialog(
    //       title: Text("Warning"),
    //       content: Text("Nim salah"),
    //     );
    //   });
    // }
    this.context = context;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: new Text(
          "Daftar Arsip Mahasiswa",
          style: GoogleFonts.vollkorn(
            // fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold
          ),
        )
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
        //       new Text("Daftar Arsip Ijazah",
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
      body: ListView(
        children: <Widget>[
          new SafeArea(
            child: new Column(
              children: <Widget>[
                new Container(
                  height: 250.0,
                  padding: new EdgeInsets.all(10.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        "Daftar Arsip Ijazah Mahasiswa",
                        style: GoogleFonts.vollkorn(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      new Text(
                        " ",
                        style: GoogleFonts.vollkorn(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(
                          top: 3.0
                        ),
                      ),
                      new TextField(
                        keyboardType: TextInputType.number,
                         onChanged: (value) {
                         if(value != null){
                           setState(() {
                            nim = value;
                          });
                         }else{
                           setState(() {
                            nim = '0';
                          });
                         }
                          
                        },
                        decoration: InputDecoration(
                          hintText: "Masukkan Nomor Induk Mahasiswa",
                          labelText: "Masukkan Nomor Induk Mahasiswa",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          )
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(
                          top: 5.0
                        ),
                      ),
                      new Column(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: new ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                new MaterialButton(
                                  color: Colors.grey[300],
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                  onPressed: () async {
                                   getArsips();
                                    setState(() {
                                      visibility = true;
                                      hilangnav = true;
                                    });

                                    // FutureBuilder(
                                    //   future: apiService.getArsip(),
                                    //   builder: (BuildContext context, AsyncSnapshot<List<Arsip>> snapshot){
                                    //     print('coba'+snapshot.data);
                                    //     if (snapshot.hasError){
                                    //       return Center(
                                    //         child: Text(
                                    //           "Ada yang Error: ${snapshot.error.toString()}"
                                    //         ),
                                    //       );
                                    //     }else if (snapshot.connectionState == ConnectionState.done) {
                                    //       List<Arsip> arsips = snapshot.data;
                                    //       return SingleChildScrollView(
                                    //         scrollDirection: Axis.horizontal,
                                    //         child: _dataBody(arsips),
                                    //       );
                                    //     }else{
                                    //       return Center(
                                    //         child: CircularProgressIndicator(),
                                    //       );
                                    //     }
                                    //   }
                                    // );
                                  },
                                  child: new Row(
                                    children: <Widget>[
                                      new Container(
                                        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 145, right: 75),
                                        alignment: Alignment.bottomCenter,
                                        child: new Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Search', style: null, textAlign: TextAlign.center),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                            ),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(
                          top: 10.0
                        ),
                      ),
                      Container(
                        child: hilangnav? Row():
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: posisi=="0" ?<Widget>[
                            new IconButton(
                              icon: Icon(Icons.arrow_right), 
                              onPressed: (){
                               int halaman = int.parse(hal)+1;
                                    int pos = (halaman-1)*10;
                                String newpos = pos.toString();
                                
                                String newhal = halaman.toString();
                                setState(() {
                                  hal = newhal;
                                  posisi = newpos;
                                 
                                });
                                getArsips();
                              }
                            ),] : <Widget>[
                                new IconButton(
                                  icon: Icon(Icons.arrow_left), 
                                  onPressed: (){
                                    int halaman = int.parse(hal)-1;
                                    int pos = (halaman-1)*10;
                                    String newpos = pos.toString();
                                   
                                    String newhal = halaman.toString();
                                    setState(() {
                                      hal = newhal;
                                      posisi = newpos;
                                      
                                    });
                                    getArsips();
                                  }
                                ),
                                new IconButton(
                                  icon: Icon(Icons.arrow_right), 
                                  onPressed: (){
                                    int halaman = int.parse(hal)+1;
                                    int pos = (halaman-1)*10;
                                    String newpos = pos.toString();
                                   
                                    String newhal = halaman.toString();
                                    setState(() {
                                      hal = newhal;
                                      posisi = newpos;
                                     
                                    });
                                    getArsips();
                                  }
                                ),
                              
                            
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: dataketemu? Container(
                    child: visibility? AlertDialog(
                      title: Text("Mohon Tunggu"),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      )):
                      _dataBody(arsips),
                            ):Container(child: Text("Data tidak ditemukan"),),
                          )
                // FutureBuilder(
                //     future: apiService.cariArsip(nim),
                //     builder: (BuildContext context, AsyncSnapshot<List<Arsip>> snapshot){
                //       if (snapshot.hasError){
                //         return Center(
                //           child: Text(
                //             "Ada yang Error: ${snapshot.error.toString()}"
                //           ),
                //         );
                //       }else if (snapshot.connectionState == ConnectionState.done) {
                //         if(visibility){
                //           List<Arsip> arsips = snapshot.data;
                //           return SingleChildScrollView(
                //             scrollDirection: Axis.horizontal,
                //             child: _dataBody(arsips),
                //           );

                //         }else{
                //           return Center(
                //           child: Text(
                //             ""
                //           ),
                //         );
                //         }
                        
                //       }else{
                //         return Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       }
                //     }
                //   )
              ],
            ),
          )
        ],
      ),
    );
  }
}







//---Masih Pake Array---//

// import 'package:flutter/material.dart';
// import 'adm_dai_data.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Dai extends StatefulWidget {

//   Dai() : super();

//   @override
//   _DaiState createState() => _DaiState();
// }

// class _DaiState extends State<Dai> {
//   List<UserDai> users;
//   @override
//   void initState(){
//     users = UserDai.getUser();
//     super.initState();
//   }
//   DataTable dataBody(){
//     return DataTable(
//       columns: [
//         DataColumn(
//           label: new Text("No."),
//           numeric: false,
//           tooltip: "No.",
//         ),
//         // DataColumn(
//         //   label: new Text("NIM"),
//         //   numeric: false,
//         //   tooltip: "NIM",
//         // ),
//         // DataColumn(
//         //   label: new Text("Nama"),
//         //   numeric: false,
//         //   tooltip: "Nama",
//         // ),
//         // DataColumn(
//         //   label: new Text("Batch"),
//         //   numeric: false,
//         //   tooltip: "Batch",
//         // ),
//         // DataColumn(
//         //   label: new Text("Prodi"),
//         //   numeric: false,
//         //   tooltip: "Prodi",
//         // ),
//         // DataColumn(
//         //   label: new Text("UPBJJ-UT"),
//         //   numeric: false,
//         //   tooltip: "UPBJJ-UT",
//         // ),
//         // DataColumn(
//         //   label: new Text("Yudisium"),
//         //   numeric: false,
//         //   tooltip: "Yudisium",
//         // ),
//         // DataColumn(
//         //   label: new Text("Kelengkapan"),
//         //   numeric: false,
//         //   tooltip: "Kelengkapan",
//         // ),
//         // DataColumn(
//         //   label: new Text("Foto"),
//         //   numeric: false,
//         //   tooltip: "Foto",
//         // ),
//         // DataColumn(
//         //   label: new Text("Tanggal Kirim"),
//         //   numeric: false,
//         //   tooltip: "Tanggal Kirim",
//         // ),
//       ], 
//       rows: users.map((userdai) => DataRow(
//         cells: [
//           DataCell(
//             new Text(userdai.no),
//           ),
//           // DataCell(
//           //   new Text(userdai.nim)
//           // ),
//           // DataCell(
//           //   new Text(userdai.nama)
//           // ),
//           // DataCell(
//           //   new Text(userdai.batch)
//           // ),
//           // DataCell(
//           //   new Text(userdai.prodi)
//           // ),
//           // DataCell(
//           //   new Text(userdai.upbjj)
//           // ),
//           // DataCell(
//           //   new Text(userdai.yudisium)
//           // ),
//           // DataCell(
//           //   new Text(userdai.kelengkapan)
//           // ),
//           // DataCell(
//           //   new Text(userdai.foto)
//           // ),
//           // DataCell(
//           //   new Text(userdai.tglkirim)
//           // ),
//         ]
//         )
//       ).toList()
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.grey,
//         title: new Container(
//           child: Row(
//             children: <Widget>[
//               new Container(
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Image.asset("img/UTpng.png",
//                   width: 60.0,
//                   height: 60.0,
//                   ),
//                 ),
//               ),
//               new Text("Daftar Arsip Ijazah",
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontStyle: FontStyle.italic,
//                 color: Colors.blue[900],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           new SafeArea(
//             child: new Column(
//               children: <Widget>[
//                 new Container(
//                   padding: new EdgeInsets.all(10.0),
//                   child: new Column(
//                     children: <Widget>[
//                       new Text(
//                         "Daftar Arsip Ijazah Mahasiswa",
//                         style: GoogleFonts.pacifico(
//                           fontSize: 20.0,
//                           fontStyle: FontStyle.italic,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       new Padding(
//                         padding: new EdgeInsets.only(
//                           top: 20.0
//                         ),
//                       ),
//                       new TextField(
//                         decoration: InputDecoration(
//                           hintText: "Search",
//                           labelText: "Search",
//                           border: new OutlineInputBorder(
//                             borderRadius: new BorderRadius.circular(20.0),
//                           )
//                         ),
//                       ),
//                       new Padding(
//                         padding: new EdgeInsets.only(
//                           top: 5.0
//                         ),
//                       ),
//                       new Column(
//                         children: <Widget>[
//                           new Padding(
//                             padding: new EdgeInsets.all(0.0),
//                             child: new ListView(
//                               shrinkWrap: true,
//                               children: <Widget>[
//                                 new MaterialButton(
//                                   color: Colors.grey[300],
//                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                                   onPressed: (){
//                                     // Navigator.push(context, MaterialPageRoute(builder: (context){
//                                     //   return tabaks.Ata();
//                                     // }));
//                                   },
//                                   child: new Row(
//                                     children: <Widget>[
//                                       new Container(
//                                         padding: const EdgeInsets.only(top: 5, bottom: 5, left: 145, right: 75),
//                                         alignment: Alignment.bottomCenter,
//                                         child: new Column(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: <Widget>[
//                                             Text('Search', style: null, textAlign: TextAlign.center),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ]
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: dataBody(),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }