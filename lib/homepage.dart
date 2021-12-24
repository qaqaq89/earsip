import 'package:flutter/material.dart';
import './page_about.dart' as about;
import './page_login.dart' as login;
// import 'page_dam.dart.bak' as dam;
// import './page_gpi.dart' as grafik;
// import './cobagrafik.dart' as coba;
// import 'navigasi/page_nav_gpi.dart' as nav;
// import './user/page_nav_gpi.dart' as nav;
// import 'user/cobadataarsipijazah.dart.bak' as damm;
import 'package:google_fonts/google_fonts.dart';
// import 'navigasi/navbar_gpi.dart' as navigasi;
// import 'package:earsip2/admin/cobakoneksi.dart.bak' as cobaa;
import 'package:earsip2/upbjj/upbjj_dai.dart' as datamhs;
import 'package:earsip2/admin/adm_grafik_dashboard.dart' as grafik;


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build (BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  
                  // child: new Row(
                    
                    
                  //   children: <Widget>[
                  //     new IconButton(
                  //       padding: const EdgeInsets.symmetric(horizontal: 350.0),
                  //       icon: Icon(Icons.info_outline), onPressed: (){
                  //         Navigator.push(context, MaterialPageRoute(builder: (context){
                  //           return about.About();
                  //         }));})
                  //   ],
                  // ),
                  
                  

                  // padding: const EdgeInsets.symmetric(horizontal: 340.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.info_outline
                      ),
                      iconSize: 30,
                      color: Colors.black,
                      // hoverColor: Colors.red,
                      // focusColor: Colors.green,
                      splashColor: Colors.yellow,
                      tooltip: 'About',
                      // disabledColor: Colors.orange,
                      // icon: MenuIcon(
                      //   icon: Icons.info_outline,
                      //   iconColor: Colors.black,
                      //   // label: '',
                      // ),
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context){
                        //   return cobaa.HomeScreen();
                        // }));
                        _settingModalBottomSheet(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context){
                        //   return about.About();
                        // }));
                      },
                    ),
                  ),
                  // child: new IconButton(
                  //   padding: const EdgeInsets.symmetric(horizontal: 350.0),
                  //   // icon: MenuIcon(
                  //   //   icon: Icons.info_outline,
                  //   //   iconColor: Colors.black,
                  //   // ),
                  //   icon: Icon(
                  //     Icons.info_outline
                  //   ), 
                  //   onPressed: (){
                  //     Navigator.push(context, MaterialPageRoute(builder: (context){
                  //       return about.About();
                  //     }));
                  //   },
                  //   iconSize: 30.0,
                  // ),
                ),
                new Container(
                  child: new Image.asset(
                    "img/UTpng.png",
                    width: 400.0,
                    height: 300.0,
                  ),
                ),
                new Container(
                  child: new ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(30.0),
                    children: <Widget>[
                      const SizedBox(height: 10),
                      new MaterialButton(
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                          return datamhs.Daiupbjj();
                        }));
                        },
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(top: 3, bottom: 3),
                              alignment: Alignment.bottomCenter,
                              child: Icon(
                                Icons.date_range, size: 50.0
                              ),
                            ),
                            new Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 65, right: 10),
                              alignment: Alignment.bottomCenter,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(' Cari Ijazah Saya', 
                                  style: GoogleFonts.vollkorn(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ), 
                                  textAlign: TextAlign.center
                                  )
                                ],
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ),
                      const SizedBox(height: 10),
                      new MaterialButton(
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return grafik.GrafikDash();
                          }));

                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return navigasi.MyBottomNavigationBar();
                          // }));

                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return coba.MyHomePage();
                          // }));

                        //   Navigator.push(context, MaterialPageRoute(builder: (context){
                        //   return grafik.Gpi();
                        // }));
                        },
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              padding: const EdgeInsets.only(top: 3, bottom: 3),
                              alignment: Alignment.bottomCenter,
                              child: Icon(Icons.assessment, size: 50.0),
                            ),
                            new Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 65, right: 10),
                              alignment: Alignment.bottomCenter,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Ijazah UPBJJ - UT', 
                                  style: GoogleFonts.vollkorn(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ), 
                                  textAlign: TextAlign.center
                                  ),
                                ],
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
                // new Padding(
                //   padding: EdgeInsets.all(50.0),
                //   child: new ListView(
                //     shrinkWrap: true,
                //     children: <Widget>[
                //       new MaterialButton(
                //         color: Colors.grey[300],
                //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                //         onPressed: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context){
                //             return login.LoginPage();
                //           })
                //           );
                //         },
                //         child: new Row(
                //           children: <Widget>[
                //             new Container(
                //               padding: const EdgeInsets.only(top: 5, bottom: 5, left: 115, right: 75),
                //               alignment: Alignment.bottomCenter,
                //               child: new Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: <Widget>[
                //                   Text('Login', 
                //                   style: GoogleFonts.vollkorn(
                //                     fontSize: 15.0,
                //                     fontWeight: FontWeight.bold,
                //                   ), 
                //                   textAlign: TextAlign.center
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),  
                // ),
                  
                // // new Column(
                // //   children: <Widget>[
                // //     new Container(
                // //       child: new ListView(
                // //         shrinkWrap: true,
                // //         padding: const EdgeInsets.all(50.0),
                // //         children: <Widget>[
                // //           new MaterialButton(
                // //             color: Colors.grey[300],
                // //             onPressed: (){},)
                // //         ],
                // //       ),
                // //     ),
                // //   ],
                // // ),
              ],
            ),
          ],
        ),
        
        // body: new Column(
          
        //   children: <Widget>[
            
            // Image.asset(
            //   "img/UTpng.png",
            //   width: 40.0,
            //   height: 30.0,
              
            // ),
            
        //     new Container(
        //       child: new ListView(
        //         shrinkWrap: true,
        //         padding: const EdgeInsets.all(30.0),
        //         children: <Widget>[
        //           const SizedBox(height: 10),
        //           MaterialButton(
        //             color: Colors.grey[300],
        //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        //             onPressed: (){

        //             },
        //             child: new Row(
        //               children: <Widget>[
        //                 new Container(
        //                   padding: const EdgeInsets.only(top: 3, bottom: 3),
        //                   alignment: Alignment.bottomCenter,
        //                   child: Icon(Icons.date_range, size: 50.0)
        //                 ),
        //                 new Container(
        //                   padding: const EdgeInsets.only(top: 5, bottom: 5, left: 75, right: 10),
        //                   alignment: Alignment.bottomCenter,
        //                   child: new Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: <Widget>[
        //                       Text('Data Arsip Ijazah', style: null, textAlign: TextAlign.center)
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //             ),
        //           ),
        //           const SizedBox(height: 10),
        //           MaterialButton(
        //             color: Colors.grey[300],
        //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        //             onPressed: (){

        //             },
        //             child: new Row(
        //               children: <Widget>[
        //                 new Container(
        //                   padding: const EdgeInsets.only(top: 3, bottom: 3),
        //                   alignment: Alignment.bottomCenter,
        //                   child: Icon(Icons.assessment, size: 50.0)
        //                 ),
        //                 new Container(
        //                   padding: const EdgeInsets.only(top: 5, bottom: 5, left: 50, right: 10),
        //                   alignment: Alignment.bottomCenter,
        //                   child: new Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: <Widget>[
        //                       Text('Grafik Pengiriman Ijazah', style: null, textAlign: TextAlign.center)
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //             ),
        //           )
        //         ]
        //       ),
        //     ),
        //     new Container(
        //       child: new ListView(
        //         shrinkWrap: true,
        //         padding: const EdgeInsets.all(50.0),
        //         children: <Widget>[
        //           const SizedBox(height: 0),
        //           MaterialButton(
        //             color: Colors.grey[300],
        //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        //             onPressed: (){

        //             },
        //           child: new Row(
        //             children: <Widget>[
        //                 new Container(
        //                   padding: const EdgeInsets.only(top: 5, bottom: 5, left: 115, right: 75),
        //                   alignment: Alignment.bottomCenter,
        //                   child: new Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: <Widget>[
        //                       Text('Login', style: null, textAlign: TextAlign.center)
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           )
        //         ]
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

// Class Untuk Menu Icon
class MenuIcon extends StatelessWidget{
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
        children: <Widget>[
          new Container(
            child: Icon(
              icon,
              color: iconColor
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


//Untuk melihat semua menu icon
void _settingModalBottomSheet(context){
  showModalBottomSheet<int>(
    context: context,
    isScrollControlled: true,
    // backgroundColor: Colors.pink,
    builder: (BuildContext bc){
      return new Container(
        height: 70.0,
        child: new ListView(
          children: <Widget>[
            new GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: <Widget>[
                new IconButton(
                  icon: MenuIcon(
                      icon: Icons.info,
                      iconColor: Colors.black,
                      label: 'About',
                    ),
                    tooltip: 'Tentang Aplikasi',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                          return about.About();
                        }));
                    },
                  ),
                  new IconButton(
                    icon: MenuIcon(
                      icon: Icons.account_circle,
                      iconColor: Colors.black,
                      label: 'Login Admin',
                    ),
                    tooltip: 'login Untuk Kelola Sebagai Admin',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                            return login.LoginPage();
                          })
                          );
                    },
                  ),
                  
              ],
            ),
          ],
        ),
      );
    }
  );
}