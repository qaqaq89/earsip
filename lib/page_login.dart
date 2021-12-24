import 'package:flutter/material.dart';
import './constants.dart';
// import 'package:earsip2/upbjj/upbjj_dashboard.dart' as upbjjdash;
// import 'package:earsip2/admin/login_admin.dart.bak' as loginadmin;
import 'package:earsip2/admin/cobakoneksi2service.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:earsip2/admin/adm_dashboard.dart' as adminhalaman;
import 'package:google_fonts/google_fonts.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override

 
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password, urlgrafik;
  ApiService apiService;
  bool _isLoading = false;
    static var uri = "";
    static BaseOptions options = BaseOptions(
        baseUrl: uri,
        responseType: ResponseType.plain,
        connectTimeout: 30000, //30000 = 30 sec
        receiveTimeout: 30000,
        validateStatus: (code) {
          if (code >= 200) {
            return true;
          }
        });
    static Dio dio = Dio(options);

      Future<dynamic> _login(String email, String password) async {
        try {
          Options options = Options(
           
          );
          Response response = await dio.post('/api/login',
              data: {"username": email, "password": password}, options: options);
          
          if (response.statusCode == 200 || response.statusCode == 201) {
            var responseJson = response.data;
            print(response.data);
            return responseJson;
          } else if (response.statusCode == 401) {
            throw Exception("Incorrect Email/Password");
          } else
            throw Exception('Authentication Error');

        } on DioError catch (exception) {
          if (exception == null ||
              exception.toString().contains('SocketException')) {
            throw Exception("Network Error");
          } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
              exception.type == DioErrorType.CONNECT_TIMEOUT) {
            throw Exception(
                "Could'nt connect, please ensure you have a stable network.");
          } else {
            return null;
          }
        }
      }

   @override
  void initState(){
    super.initState();
    apiService = ApiService();
     String urlgrafik = apiService.baseUrl;
    setState(() {
      uri = urlgrafik;
    });
  }


  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'Masuk Untuk Kelola Arsip',
            style: GoogleFonts.vollkorn(
              fontSize: 25.0,
              fontStyle: FontStyle.italic,
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

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: mainColor,
            ),
            labelText: 'Username'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  // Widget _buildForgetPasswordButton() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
  //       FlatButton(
  //         onPressed: () {
  //           Navigator.push(context, MaterialPageRoute(builder: (context){
  //               return loginadmin.LoginPageAdmin();
  //             }));
  //         },
  //         child: Text("Login Admin"),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () async {
                       setState(() => _isLoading = true);
                      var res = await _login(
                          email, password);
                           setState(() => _isLoading = false);
                      if(res == 'Login Sukses'){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return adminhalaman.LoginPagee();
                        }));
                      }else{
                        showDialog(context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Login Error !"),
                              content: Text(res),
                            );
                          },
                        );
                      }
                      
              // Navigator.push(context, MaterialPageRoute(builder: (context){
              //   return upbjjdash.LoginPageee();
              // }));
            },
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
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
            height: MediaQuery.of(context).size.height * 0.6,
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
                        // Text(
                        //   "Login",
                        //   style: TextStyle(
                        //     fontSize: MediaQuery.of(context).size.height / 30,
                        //   ),
                        // ),
                      ],
                    ),
                    _buildEmailRow(),
                    _buildPasswordRow(),
                    // _buildForgetPasswordButton(),
                    _buildLoginButton(),
                    // _buildForgetPasswordButton(),
                    // _buildOrRow(),
                    // _buildSocialBtnRow(),
                  ],
              //   ),
              // ],
            ),
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff2f3f7),
        body: 
        // Column(
        //   children: <Widget>[
            _isLoading
                ? Center(child: CircularProgressIndicator())
                :Stack(
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
                // ListView(
                //   children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildLogo(),
                        _buildContainer(),
                        // _buildSignUpBtn(),
                      ],
                    ),
                  ],
              //   )
              // ],
            ),
        //   ],
        // ),
      ),
    );
  }
}