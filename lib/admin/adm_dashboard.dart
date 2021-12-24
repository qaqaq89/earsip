import 'package:flutter/material.dart';
import '../constants.dart';
// import './adm_inpt.dart' as input;
// import 'adm_tabel_akses.dart.bak' as dataakses;
// import '../page_login.dart' as login;
// import 'package:earsip2/homepage.dart' as backhome;
import 'package:earsip2/footer_home.dart' as backhome;
import 'adm_grafik_dashboard.dart' as grafikdash;
import './adm_dai.dart' as dataarsipijazah;
// import 'adm_dashboard_grafik.dart.bak' as grafikdash;
import './adm_inputijazah_api.dart' as inputapi;
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPagee(),
    );
  }
}

class LoginPagee extends StatefulWidget {
  @override
  _LoginPageeState createState() => _LoginPageeState();
}

class _LoginPageeState extends State<LoginPagee> {
  String email, password;
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'Hallo Admin !',
            style: GoogleFonts.vollkorn(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
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

  Widget _buildinputijazahRow() {
    return Column(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.all(8.0),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new MaterialButton(
                color: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return inputapi.FormAddScreenIjazah();
                  }));
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 90),
                      alignment: Alignment.center,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Input Ijazah",
                            style: GoogleFonts.vollkorn(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.white
                            ),
                            // style: TextStyle(
                            //   color: Colors.white,
                            //   letterSpacing: 1.5,
                            //   fontSize: MediaQuery.of(context).size.height / 50,
                            // ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDataarsipRow() {
    return Column(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.all(8.0),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new MaterialButton(
                color: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return dataarsipijazah.Dai();
                  }));
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 70),
                      alignment: Alignment.center,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Data Arsip Ijazah",
                            style: GoogleFonts.vollkorn(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.white
                            ),
                            // style: TextStyle(
                            //   color: Colors.white,
                            //   letterSpacing: 1.5,
                            //   fontSize: MediaQuery.of(context).size.height / 50,
                            // ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildGrafikRow() {
    return Column(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.all(8.0),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new MaterialButton(
                color: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return grafikdash.GrafikDash();
                  }));
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 60),
                      alignment: Alignment.center,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Grafik Status Ijazah",
                            style: GoogleFonts.vollkorn(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.white
                            ),
                            // style: TextStyle(
                            //   color: Colors.white,
                            //   letterSpacing: 1.5,
                            //   fontSize: MediaQuery.of(context).size.height / 50,
                            // ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // Widget _buildAksesRow() {
  //   return Column(
  //     children: <Widget>[
  //       new Padding(
  //         padding: new EdgeInsets.all(8.0),
  //         child: new ListView(
  //           shrinkWrap: true,
  //           children: <Widget>[
  //             new MaterialButton(
  //               color: mainColor,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10.0)
  //               ),
  //               onPressed: (){
  //                 Navigator.push(context, MaterialPageRoute(builder: (context){
  //                   return dataakses.Ata();
  //                 }));
  //               },
  //               child: new Row(
  //                 children: <Widget>[
  //                   new Container(
  //                     padding: const EdgeInsets.only(top: 5, bottom: 5, left: 55),
  //                     alignment: Alignment.center,
  //                     child: new Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: <Widget>[
  //                         Text(
  //                           "Tambah Hak Akses",
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             letterSpacing: 1.5,
  //                             fontSize: MediaQuery.of(context).size.height / 50,
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.2 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 50),
          child: RaisedButton(
            elevation: 5.0,
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            onPressed: () {
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              //   return backhome.Footer();
              // }));
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext) => backhome.Footer()
                  ),
                  (Route route) => false,
              );

              
            },
            child: Text(
              "Logout",
              style: GoogleFonts.vollkorn(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.white,
                fontSize: 20.0
              ),
              // style: TextStyle(
              //   color: Colors.white,
              //   letterSpacing: 1.5,
              //   fontSize: MediaQuery.of(context).size.height / 40,
              // ),
            ),
          ),
        )
      ],
    );
  }

  // Widget _buildOrRow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Container(
  //         margin: EdgeInsets.only(bottom: 20),
  //         child: Text(
  //           '- OR -',
  //           style: TextStyle(
  //             fontWeight: FontWeight.w400,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // Widget _buildSocialBtnRow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       GestureDetector(
  //         onTap: () {},
  //         child: Container(
  //           height: 60,
  //           width: 60,
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: mainColor,
  //             boxShadow: [
  //               BoxShadow(
  //                   color: Colors.black26,
  //                   offset: Offset(0, 2),
  //                   blurRadius: 6.0)
  //             ],
  //           ),
  //           // child: Icon(
  //           //   FontAwesomeIcons.google,
  //           //   color: Colors.white,
  //           // ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            // child: ListView(
            //   children: <Widget>[
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("img/UTpng.png", width: 200.0, height: 200.0)
                        // Image.asset("img/arsip3.png", width: 200.0, height: 200.0)
                        // Text(
                        //   "Login",
                        //   style: TextStyle(
                        //     fontSize: MediaQuery.of(context).size.height / 30,
                        //   ),
                        // ),
                      ],
                    ),
                    _buildinputijazahRow(),
                    _buildDataarsipRow(),
                    _buildGrafikRow(),
                    // _buildAksesRow(),
                    // _buildForgetPasswordButton(),
                    _buildLoginButton(),
                    // _buildOrRow(),
                    // _buildSocialBtnRow(),
                  ],
                ),
            //   ],
            // ),
          ),
        ),
      ],
    );
  }

  // Widget _buildSignUpBtn() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Padding(
  //         padding: EdgeInsets.only(top: 40),
  //         child: FlatButton(
  //           onPressed: () {},
  //           child: RichText(
  //             text: TextSpan(children: [
  //               TextSpan(
  //                 text: 'Dont have an account? ',
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: MediaQuery.of(context).size.height / 40,
  //                   fontWeight: FontWeight.w400,
  //                 ),
  //               ),
  //               TextSpan(
  //                 text: 'Sign Up',
  //                 style: TextStyle(
  //                   color: mainColor,
  //                   fontSize: MediaQuery.of(context).size.height / 40,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               )
  //             ]),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return 
        SafeArea(
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Color(0xfff2f3f7),
            // body: ListView(
            //   children: <Widget>[
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildLogo(),
                        _buildContainer(),
                        // _buildSignUpBtn(),
                      ],
                    )
                  ],
                ),
            //   ],
            // ),
          ),
        
    );
  }
}