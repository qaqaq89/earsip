// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:earsip2/footer_home.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SplashScreenPage extends StatefulWidget{
//   @override
//   _SplashScreenPageState createState() => _SplashScreenPageState();
// }

// class _SplashScreenPageState extends State<SplashScreenPage>{
//   @override
//   void initState(){
//     super.initState();
//     startSplashScreen();
//   }
//   startSplashScreen() async{
//     var duration = const Duration(seconds: 3);
//     return Timer(duration, (){
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_){
//           return Footer();
//         }),
//       );
//     });
//   }
//   @override
//   Widget build (BuildContext context){
//     return Scaffold(
//       body: new Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           new Center(
//             child: new Container(
//               child: new Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   new Text(
//                     "Pengarsipan Ijazah",
//                     style: GoogleFonts.pacifico(fontSize: 30.0,),
//                     // new TextStyle(
//                     //   fontSize: 30.0,
//                     //   fontFamily: 'Bold',
//                     //   color: Colors.black,
//                     // ),
//                   ),
//                   new Text(
//                     " "
//                   ),
//                   new Text(
//                     "Universitas Terbuka",
//                     style: GoogleFonts.pacifico(fontSize: 30.0,),
//                     // new TextStyle(
//                     //   fontSize: 30.0,
//                     //   fontFamily: 'Bold',
//                     //   color: Colors.black
//                     // ),
//                   ),
//                   new Text(
//                     " "
//                   ),
//                   new Text(
//                     " "
//                   ),
//                   new Text(
//                     " "
//                   ),
//                   new Text(
//                     " "
//                   ),
//                   new Text(
//                     " "
//                   ),
//                   new Text(
//                     " "
//                   ),
//                   new Text(
//                     " "
//                   ),
                  
//                   new Image.asset(
//                     "img/UTpng.png",
//                     width: 300.0,
//                     height: 200.0,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//         // child: Image.asset(
//         //   "img/UTpng.png",
//         //   width: 300.0,
//         //   height: 150.0
//         // ),
//       ),
//     );
//   }
// }


//---Coba---//

import 'package:earsip2/admin/adm_grafik_dashboard.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:earsip2/footer_home.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenPage extends StatefulWidget{
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>{
  @override
  void initState(){
    super.initState();
    startSplashScreen();
  }
  startSplashScreen() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_){
          return Footer();
        }),
      );
    });
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFb0b31e),
      body: new Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(
                  "img/cobabck4.png"
                ),
                fit: BoxFit.cover
              ),
            ),
            // child: new Center(
            //   child: new Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //                new Text(
            //         "Pengarsipan Ijazah",
            //         style: GoogleFonts.pacifico(
            //           fontSize: 30.0,
            //           color: Colors.black
            //         ),
            //         // new TextStyle(
            //         //   fontSize: 30.0,
            //         //   fontFamily: 'Bold',
            //         //   color: Colors.black,
            //         // ),
            //       ),
            //       new Text(
            //         " "
            //       ),
            //       new Text(
            //         "Universitas",
            //         style: GoogleFonts.pacifico(
            //           fontSize: 30.0,
            //           color: Colors.black
            //         ),
            //         // new TextStyle(
            //         //   fontSize: 30.0,
            //         //   fontFamily: 'Bold',
            //         //   color: Colors.black
            //         // ),
            //       ),
            //       new Text(
            //         " "
            //       ),
            //       new Text(
            //         " "
            //       ),
            //       new Text(
            //         " "
            //       ),
            //       new Text(
            //         " "
            //       ),
            //       new Text(
            //         " "
            //       ),
            //       new Text(
            //         " "
            //       ),
            //       new Text(
            //         " "
            //       ),
                  
                  
            //       // new Image.asset(
            //       //   "img/arsip3.png",
            //       //   width: 300.0,
            //       //   height: 200.0,
            //       // ),
            //       // new Image.asset(
            //       //   "img/UTpng.png",
            //       //   width: 300.0,
            //       //   height: 200.0,
            //       // ),
            //     ],
            //   ),
            // ),
          ),
          new Center(
            child: new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Pengarsipan Ijazah",
                    style: GoogleFonts.pacifico(fontSize: 30.0,),
                    // new TextStyle(
                    //   fontSize: 30.0,
                    //   fontFamily: 'Bold',
                    //   color: Colors.black,
                    // ),
                  ),
                  new Text(
                    " "
                  ),
                  new Text(
                    "Universitas Terbuka",
                    style: GoogleFonts.pacifico(fontSize: 30.0,),
                    // new TextStyle(
                    //   fontSize: 30.0,
                    //   fontFamily: 'Bold',
                    //   color: Colors.black
                    // ),
                  ),
                  new Text(
                    " "
                  ),
                  new Text(
                    " "
                  ),
                  new Text(
                    " "
                  ),
                  new Text(
                    " "
                  ),
                  new Text(
                    " "
                  ),
                  new Text(
                    " "
                  ),
                  new Text(
                    " "
                  ),
                  
                  new Image.asset(
                    "img/UTpng.png",
                    width: 300.0,
                    height: 200.0,
                  ),
                ],
              ),
            ),
          ),
        ],
        // child: Image.asset(
        //   "img/UTpng.png",
        //   width: 300.0,
        //   height: 150.0
        // ),
      ),
    );
  }
}