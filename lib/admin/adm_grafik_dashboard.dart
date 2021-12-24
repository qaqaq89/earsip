import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import './adm_grafik_ut.dart' as utpusat;
import './adm_grafik_dikirim.dart' as upbjj;
import './adm_grafik_foto.dart' as sudah;
import './adm_grafik_foto_belum.dart' as belum;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GrafikDash(),
    );
  }
}

class GrafikDash extends StatefulWidget {
  @override
  _GrafikDashState createState() => _GrafikDashState();
}

class _GrafikDashState extends State<GrafikDash> {
  String email, password;
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            // 'Grafik Arsip Ijazah di Sentra',
            'Grafik Arsip Ijazah di UPBJJ-UT',
            style: GoogleFonts.vollkorn(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            // style: TextStyle(
            //   fontSize: MediaQuery.of(context).size.height / 35,
            //   fontWeight: FontWeight.bold,
            //   color: Colors.white,
            // ),
          ),
        )
      ],
    );
  }


  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Image.asset("img/arsip3.png", width: 150.0, height: 150.0),
                        Image.asset("img/UTpng.png", width: 150.0, height: 150.0),
                        new GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          children: <Widget>[
                            new IconButton(
                              icon: MenuIcon(
                                icon: Icons.cloud_download,
                                iconColor: Colors.blue,
                                label: 'Ijazah di Pusat',
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return utpusat.IjazahUTPusat();
                                }));
                              },
                            ),
                            new IconButton(
                              icon: MenuIcon(
                                icon: Icons.cloud_done,
                                iconColor: Colors.blue,
                                label: 'Ijazah Sudah Dikirim',
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return upbjj.IjazahUPBJJ();
                                }));
                              },
                            ),
                            new IconButton(
                              icon: MenuIcon(
                                icon: Icons.check,
                                iconColor: Colors.blue,
                                label: 'Ijazah Ada Foto',
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return sudah.Ijazahfoto();
                                }));
                              },
                            ),
                            new IconButton(
                              icon: MenuIcon(
                                icon: Icons.clear,
                                iconColor: Colors.blue,
                                label: 'Belum Ada Foto',
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return belum.Ijazahfotobelum();
                                }));
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildLogo(),
                    _buildContainer(),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Class Untuk Menu Icon
class MenuIcon extends StatelessWidget {

  final IconData icon;
  final Color iconColor;
  final String label;

  MenuIcon({
    this.icon,
    this.iconColor,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              color: iconColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                icon,
                color: iconColor,
                size: 70.0,
              ),
            ),
          ),
          new SizedBox(height: 5.0),
          new Text(label,
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold
          ),),
        ],
      ),
    );
  }
}