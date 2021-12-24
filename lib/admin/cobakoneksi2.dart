import 'dart:convert';

// import 'package:earsip2/admin/tabelcobakoneksi2.dart.bak';

// import 'package:earsip2/admin/tabelcobakoneksi2.dart';

//Coba
// Arsip arsipsFromJson(String str) => Arsip.fromJson(json.decode(str));
// String arsipsToJson(Arsip data) => json.encode(data.toJson());
//coba

class Arsip {
  int id;
  // int no;
  int nim;
  String nama;
  String batch;
  String prodi;
  String upbjj;
  int yudisium;
  String kelengkapan;
  String foto;
  // String kirim;
  String statusfoto;
  String statuskelengkapan;


  Arsip({
    this.id = 0, 
    // this.no = 0,
    this.nim = 0,
    this.nama,
    this.batch,
    this.prodi,
    this.upbjj,
    this.yudisium,
    this.kelengkapan,
    this.foto, 
    // this.kirim,
    this.statusfoto,
    this.statuskelengkapan,
  });

  factory Arsip.fromJson(Map<String, dynamic> map) {
    return Arsip(
        id: map["id"],
        // no: map["no"],
        nim: map["nim"], 
        nama: map["nama"],
        batch: map["batch"],
        prodi: map["prodi"],
        upbjj: map["upbjj"],
        yudisium: map["yudisium"],
        kelengkapan: map["kelengkapan"], 
        foto: map["foto"],
        // kirim: map["kirim"],
        statusfoto: map["statusfoto"],
        statuskelengkapan: map["statuskelengkapan"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      // "no": no,
      "nim": nim, 
      "nama": nama,
      "batch": batch,
      "prodi": prodi,
      "upbjj": upbjj,
      "yudisium": yudisium,
      "kelengkapan": kelengkapan,
      "foto": foto,
      // "kirim": kirim,
      "statusfoto": statusfoto,
      "statuskelengkapan": statuskelengkapan
    };
  }

  @override
  String toString() {
    return 'Profile{id: $id, nim: $nim, nama: $nama, batch: $batch, prodi: $prodi, upbjj: $upbjj, yudisium: $yudisium, kelengkapan: $kelengkapan, foto: $foto, statusfoto: $statusfoto, statuskelengkapan: $statuskelengkapan}';
  }
  // String toString() {
  //   return 'Profile{id: $id, no: $no, nim: $nim, nama: $nama, batch: $batch, prodi: $prodi, upbjj: $upbjj, yudisium: $yudisium, kelengkapan: $kelengkapan, foto: $foto, kirim: $kirim, statusfoto: $statusfoto, statuskelengkapan: $statuskelengkapan}';
  // }
}

List<Arsip> arsipFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Arsip>.from(data.map((item) => Arsip.fromJson(item)));
}

String arsipToJson(Arsip data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}