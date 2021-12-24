import 'dart:convert';

// import 'package:earsip2/admin/tabelcobakoneksi2.dart.bak';

// import 'package:earsip2/admin/tabelcobakoneksi2.dart';

//Coba
// Arsip arsipsFromJson(String str) => Arsip.fromJson(json.decode(str));
// String arsipsToJson(Arsip data) => json.encode(data.toJson());
//coba

class Upbjj {
  int id;
  String namaupbjj;

  Upbjj({
    this.id = 0, 
    this.namaupbjj,
  });

  factory Upbjj.fromJson(Map<String, dynamic> map) {
    return Upbjj(
        id: map["id"],
        namaupbjj: map["namaupbjj"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "namaupbjj": namaupbjj
    };
  }

  @override
  String toString() {
    return 'Profile{id: $id, namaupbjj: $namaupbjj';
  }

}

List<Upbjj> upbjjFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Upbjj>.from(data.map((item) => Upbjj.fromJson(item)));
}

String upbjjToJson(Upbjj data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}