
import 'dart:developer';


import 'package:earsip2/admin/cobakoneksi2.dart';
import 'package:earsip2/admin/cobakoneksiupbjj.dart';
// import 'package:earsip2/admin/tabelcobakoneksi2.dart.bak';
import 'package:http/http.dart' show Client;

class ApiService {

  
// final String baseUrl = "https://arsipapi.000webhostapp.com/";
  final String baseUrl = "http://192.168.100.59/"; //pake localhost
  Client client = Client();

  static getbaseurl(){
    // return "https://arsipapi.000webhostapp.com/";
    return "http://192.168.100.59/"; //Pake localhost
  }

  Future<List<Arsip>> getArsip() async {
    final response = await client.get("$baseUrl/api/arsip");
    log(response.body.toString());
    if (response.statusCode == 200) {
      return arsipFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<bool> createArsip(Arsip data) async {
  final response = await client.post(
    "$baseUrl/api/arsip",
    headers: {"content-type": "application/json"},
    body: arsipToJson(data),
  );

  log(response.body.toString());
  if (response.body.toString() == "Data Berhasil Masuk") {
    return true;
  } else {
    return false;
  }
}

Future<bool> updateArsip(Arsip data) async {
  final response = await client.put(
    "$baseUrl/api/arsip/edit/${data.id}",
    headers: {"content-type": "application/json"},
    body: arsipToJson(data),
  );
  log(response.body.toString());
  if (response.body.toString() == "Data Berhasil di Update") {
    return true;
  } else {
    return false;
  }
}

Future<bool> deleteArsip(int id) async {
  final response = await client.delete(
    "$baseUrl/api/arsip/delete/$id",
    headers: {"content-type": "application/json"},
  );
  log(response.body.toString());
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

//List Upbjj
Future<List<Upbjj>> getUpbjj() async {
    final response = await client.get("$baseUrl/api/upbjj");
    if (response.statusCode == 200) {
      return upbjjFromJson(response.body);
    } else {
      return null;
    }
  }

   Future<List<Arsip>> cariArsip(String cari) async {
    
    final response = await client.post("$baseUrl/api/cari",  body: {'nim': cari},);
    log(response.body.toString());
    if (response.statusCode == 200) {
      //print(response.body);
      return arsipFromJson(response.body);
    } else {
      return null;
    }
  }

}