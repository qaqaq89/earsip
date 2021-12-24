import 'dart:convert';
// import 'dart:developer';

import 'package:earsip2/admin/cobakoneksi2.dart';
// import 'package:earsip2/admin/cobakoneksiupbjj.dart';
import 'package:flutter/material.dart';
import './cobakoneksi2service.dart';
// import './cobakoneksi.dart' as aaa;
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import './adm_dai.dart' as hasilinputadmin;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormAddScreenIjazah extends StatefulWidget {
  //Edit
  ApiService apiService;
  
  Arsip arsip;
  FormAddScreenIjazah({this.arsip});

  @override
  _FormAddScreenIjazahState createState() => _FormAddScreenIjazahState();
}

class _FormAddScreenIjazahState extends State<FormAddScreenIjazah> {
  ApiService apiService;
  //dropdown
  //final String urlupbjj = 'http://192.168.43.149/api/upbjj';
  List dataupbjj;
  void getDataupbjj(String urlupbjj) async {
    final respose = await http.get(urlupbjj+'/api/upbjj'); 
    var listData = jsonDecode(respose.body); 
    print("data : $listData"); 
    setState(() {
      dataupbjj = listData;
    });
  }
  // Future<String> getUpbjj() async{
  //   var res = await http.get(Uri.encodeFull(urlupbjj), headers: {"Accept": "application/json"});

  //   var resbody = jsonDecode(res.body);
  //   setState(() {
  //     dataupbjj = resbody;
  //   });
  //   return "Sucess";
  // }
  String valdatafoto;
  String valdataijazah;
  String valdataupbjj;
  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isFieldNamaValid;

  //coba
  bool _isFieldBatchValid;
  bool _isFieldNimValid;
  bool _isFieldProdiValid;
  // bool _isFieldUpbjjValid;
  bool _isFieldYudisiumValid;
  // bool _isFieldNoijazahValid;
  // bool _isFieldNoijazahaktaValid;
  // bool _isFieldKirimValid;
  TextEditingController _controllerBatch = TextEditingController();
  TextEditingController _controllerNim = TextEditingController();
  TextEditingController _controllerProdi = TextEditingController();
  TextEditingController _controllerUpbjj = TextEditingController();
  TextEditingController _controllerYudisium = TextEditingController();
  // TextEditingController _controllerNoijazah = TextEditingController();
  // TextEditingController _controllerNoijazahakta = TextEditingController();
  // TextEditingController _controllerKirim = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();

  final items = {
    '1' : 'Belum Ada Foto',
    '2' : 'Sudah Ada Foto'
  };

  List<DropdownMenuItem<String>> menuItems = List();

  final itemsijazah = {
    '1' : 'Masih di UT Pusat',
    '2' : 'Sudah Dikirim'
  };

  List<DropdownMenuItem<String>> menuItemsijazah = List();

  @override
  void initState() {
    super.initState();

    apiService = ApiService();
    final String urlupbjj = apiService.baseUrl;

    getDataupbjj(urlupbjj);

    //untuk memanggil key dari array ke dalam menudropdownitem
    for(String key in items.keys){
    menuItems.add(DropdownMenuItem<String>(
      child: Text(items[key]),
      value: key,
      ));
  }

  for(String key in itemsijazah.keys){
    menuItemsijazah.add(DropdownMenuItem<String>(
      child: Text(itemsijazah[key]),
      value: key,
      ));
  }

    if (widget.arsip != null) {
      _isFieldBatchValid = true;
      _controllerBatch.text = widget.arsip.batch;

      _isFieldNamaValid = true;
      _controllerNama.text = widget.arsip.nama;

      _isFieldNimValid = true;
      _controllerNim.text = widget.arsip.nim.toString();

      _isFieldProdiValid = true;
      _controllerProdi.text = widget.arsip.prodi;

      // _isFieldUpbjjValid = true;
      valdataupbjj = widget.arsip.upbjj;
      // _controllerUpbjj.text = widget.arsip.upbjj;

      valdatafoto = widget.arsip.foto;

      valdataijazah = widget.arsip.kelengkapan;

      _isFieldYudisiumValid = true;
      _controllerYudisium.text = widget.arsip.yudisium.toString();

      // _isFieldKirimValid = true;
      // _controllerKirim.text = widget.arsip.kirim;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.arsip == null ? "Input Ijazah" : "Edit Ijazah",
          style: GoogleFonts.vollkorn(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.white
          ),
          // style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                  "Input Data Arsip",
                  style: GoogleFonts.vollkorn(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontSize: 20.0
                  ),
                  // style: GoogleFonts.pacifico(
                  //   fontSize: 20.0,
                  //   fontStyle: FontStyle.italic,
                  //   fontWeight: FontWeight.bold
                    
                  // ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(
                    top: 20.0
                  )
                ),

                _buildTextFieldBatch(),

                new Padding(
                  padding: new EdgeInsets.only(
                    top: 20.0
                  )
                ),

                _buildTextFieldNim(),

                new Padding(
                  padding: new EdgeInsets.only(
                    top: 20.0
                  )
                ),

                _buildTextFieldNama(),
                
                new Padding(
                  padding: new EdgeInsets.only(
                    top: 20.0
                  )
                ),

                _buildTextFieldProdi(),

                new Padding(
                  padding: new EdgeInsets.only(
                    top: 20.0
                  )
                ),

                new Row(
                  children: <Widget>[
                    new Text(
                      "UPBJJ*:                      ",
                      style: GoogleFonts.vollkorn(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.black,
                        fontSize: 20.0
                      ),
                      // style: GoogleFonts.pacifico(
                      //   fontSize: 20.0,
                      //   color: Colors.black
                      // )
                    ),
                    _buildTextFieldUpbjj(),
                  ]
                ),

                new Padding(
                  padding: new EdgeInsets.only(
                    top: 20.0
                  )
                ),

                new Row(
                  children: <Widget>[
                    new Text(
                      "Status Foto*:               ",
                      style: GoogleFonts.vollkorn(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.black,
                        fontSize: 20.0
                      ),
                      // style: GoogleFonts.pacifico(
                      //   fontSize: 20.0,
                      //   color: Colors.black
                      // )
                    ),
                    _buildStatusFoto(),
                  ]
                ),

                new Padding(
                  padding: new EdgeInsets.only(
                    top: 20.0
                  )
                ),

                new Row(
                  children: <Widget>[
                    new Text(
                      "Status Ijazah*:           ",
                      style: GoogleFonts.vollkorn(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.black,
                        fontSize: 20.0
                      ),
                      // style: GoogleFonts.pacifico(
                      //   fontSize: 20.0,
                      //   color: Colors.black
                      // )
                    ),
                    _buildStatusIjazah(),
                  ]
                ),

                // _buildTextFieldUpbjj(),

                new Padding(
                  padding: new EdgeInsets.only(
                    top: 20.0
                  )
                ),

                _buildTextFieldYudisium(),

                // new Padding(
                //   padding: new EdgeInsets.only(
                //     top: 20.0
                //   )
                // ),
                // _buildTextFieldNoijazah(),
                // _buildTextFieldNoijazahakta(),
                // _buildTextFieldKirim(),

                
               
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (
                        _isFieldBatchValid == null ||
                        _isFieldNimValid == null ||
                        _isFieldNamaValid == null ||
                        _isFieldProdiValid == null ||
                        // _isFieldUpbjjValid == null ||
                        _isFieldYudisiumValid == null ||
                        // _isFieldNoijazahValid == null ||
                        // _isFieldNoijazahaktaValid == null ||
                        // _isFieldKirimValid == null ||
                         
                        !_isFieldBatchValid ||
                        !_isFieldNimValid ||
                        !_isFieldNamaValid ||
                        !_isFieldProdiValid ||
                        // !_isFieldUpbjjValid ||
                        !_isFieldYudisiumValid 
                        // !_isFieldNoijazahValid ||
                        // !_isFieldNoijazahaktaValid ||
                        // !_isFieldKirimValid
                      ) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Please fill all field"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);

                      String batch = _controllerBatch.text.toString();
                      int nim = int.parse(_controllerNim.text.toString());
                      String nama = _controllerNama.text.toString();
                      String prodi = _controllerProdi.text.toString();
                      // String upbjj = _controllerUpbjj.text.toString();
                      String upbjj = valdataupbjj;
                      int yudisium = int.parse(_controllerYudisium.text.toString());
                      // String kirim = _controllerKirim.text.toString();
                      String foto = valdatafoto;
                      String kelengkapan = valdataijazah;
                      
                      Arsip arsip =
                          Arsip(
                            batch: batch,
                            nim: nim,
                            nama: nama,
                            prodi: prodi,
                            upbjj: upbjj,
                            yudisium: yudisium,
                            // kirim: kirim,
                            foto: foto,
                            kelengkapan: kelengkapan,
                          );
                          if (widget.arsip == null) {
                            _apiService.createArsip(arsip).then((isSuccess) {
                              setState(() => _isLoading = false);
                              if (isSuccess) {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return hasilinputadmin.Dai();
                                }));
                                // Navigator.pop(_scaffoldState.currentState.context);
                              } else {
                                _scaffoldState.currentState.showSnackBar(SnackBar(
                                  content: Text(isSuccess.toString()),
                                ));
                              }
                            });

                          }else { //Jika Widget == 0//
                            arsip.id = widget.arsip.id;
                            _apiService.updateArsip(arsip).then((isSuccess) {
                              setState(() => _isLoading = false);
                              if (isSuccess) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                  return hasilinputadmin.Dai();
                                }));
                              } else {
                                _scaffoldState.currentState.showSnackBar(SnackBar(
                                  content: Text("Update data failed"),
                                ));
                              }
                            });
                          }
                      
                    },
                    child: Text(
                      widget.arsip == null
                      ? "Simpan".toUpperCase()
                      : "Update Data".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.orange[600],
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldNama() {
    return TextField(
      controller: _controllerNama,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Input Nama Mahasiswa",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0)
        ),
        labelText: "Nama Lengkap",
        errorText: _isFieldNamaValid == null || _isFieldNamaValid
            ? null
            : "Full name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNamaValid) {
          setState(() => _isFieldNamaValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldBatch() {
    return TextField(
      controller: _controllerBatch,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Input Batch",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0)
        ),
        labelText: "Batch",
        errorText: _isFieldBatchValid == null || _isFieldBatchValid
            ? null
            : "Batch",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldBatchValid) {
          setState(() => _isFieldBatchValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldNim() {
    return TextField(
      controller: _controllerNim,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Input NIM",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0)
        ),
        labelText: "Nomor Induk Mahasiswa",
        errorText: _isFieldNimValid == null || _isFieldNimValid
            ? null
            : "Nomor Induk Mahasiswa",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNimValid) {
          setState(() => _isFieldNimValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldProdi() {
    return TextField(
      controller: _controllerProdi,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Input Program Studi",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0)
        ),
        labelText: "Program Studi",
        errorText: _isFieldProdiValid == null || _isFieldProdiValid
            ? null
            : "Program Studi",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldProdiValid) {
          setState(() => _isFieldProdiValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldUpbjj() {
    return DropdownButton(
      hint: Text("Pilih UPBJJ"),
      
      value: valdataupbjj,
      items: dataupbjj?.map((item) {
        return DropdownMenuItem(
          child: Text(item['namaupbjj']),
          value: item['namaupbjj'],
        );
      })?.toList() ?? [],
      onChanged: (value) {
        setState(() {
          valdataupbjj = value;
        });
      },
    );
  }

  Widget _buildStatusFoto() {
    return DropdownButton(
      hint: Text("Kelengkapan Foto"),
      
      value: valdatafoto,
      items: menuItems,
      onChanged: (value) {
        setState(() {
          valdatafoto = value;
        });
      },
    );
  }

  Widget _buildStatusIjazah() {
    return DropdownButton(
      hint: Text("Status Ijazah"),
      
      value: valdataijazah,
      items: menuItemsijazah,
      onChanged: (value) {
        setState(() {
          valdataijazah = value;
        });
      },
    );
  }

  Widget _buildTextFieldYudisium() {
    return TextField(
      controller: _controllerYudisium,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Input Yudisium",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0)
        ),
        labelText: "Masa Yudisium (Tahun+Masa ex.20201)",
        errorText: _isFieldYudisiumValid == null || _isFieldYudisiumValid
            ? null
            : "Masa Yudisium",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldYudisiumValid) {
          setState(() => _isFieldYudisiumValid = isFieldValid);
        }
      },
    );
  }

  // Widget _buildTextFieldKirim() {
  //   return TextField(
  //     controller: _controllerKirim,
  //     keyboardType: TextInputType.text,
  //     decoration: InputDecoration(
  //       hintText: "Tanggal Kirim",
  //       border: new OutlineInputBorder(
  //         borderRadius: new BorderRadius.circular(20.0)
  //       ),
  //       labelText: "Tanggal Kirim",
  //       errorText: _isFieldKirimValid == null || _isFieldKirimValid
  //           ? null
  //           : "Tanggal Kirim",
  //     ),
  //     onChanged: (value) {
  //       bool isFieldValid = value.trim().isNotEmpty;
  //       if (isFieldValid != _isFieldKirimValid) {
  //         setState(() => _isFieldKirimValid = isFieldValid);
  //       }
  //     },
  //   );
  // }
}