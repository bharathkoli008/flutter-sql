import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_textfield/gradient_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Frame.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  late SharedPreferences sharedPreferences;
   late http.Response response;
   Map<String,dynamic> decoded_data = {};
   final box  = GetStorage();


  Future  fetch_data(String username,String password) async{
    Uri url = Uri.parse('https://sgvamcbailhongal.org/cms/api/student/login.php');
    bool login = false;

// Create a Map to hold the query parameters
    final Map<String, String> body2 = {
      "username": username,
      "password": password,
    };

    String jsonBody = jsonEncode(body2);


// Specify the headers
    Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Content-Type': 'application/json', // Add Content-Type header with 'application/json' value
    };


response = await http.post(url,
  body: jsonBody,
  headers: headers,
);
     // response = await http.post(url,body: body2);

    if(response.body == '"User not found"'){
      const SnackBar(content: Text("User name Password is wrong"));
      Fluttertoast.showToast(
          msg: "Username and Password not matching. Please try again",
          fontSize: 18,
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.white70,
          backgroundColor: Colors.grey
      );

    } else if(response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Success",
          fontSize: 18,
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.white70,
          backgroundColor: Colors.grey
      );

      setState(() {
        login = true;
      });

    }
    var data = '[' +  response.body.toString() + ']';


    decoded_data = jsonDecode(data)[0];

   box.write('data', decoded_data);

    print('=================================${decoded_data}');



    return login;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35,bottom: 20),
                  child: Row(

                    children: [
                      Image.asset("lib/assets/teacher.png",
                        height: 50,
                        width: 50,),
                      Text(" For Parents",
                        style: GoogleFonts.nunito(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),)],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text("Login",
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text("Please sign in to continue",
                    style: GoogleFonts.nunito(
                        color: Colors.grey.shade600,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10,top: 50,right: 15,left: 15),
                    child: Gradienttextfield(
                      controller: idController,
                      text: "👤 UserID",
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.9,
                      colors: [
                        Colors.white,
                        Colors.blue.shade300
                      ],
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10,top: 5,right: 15,left: 15),
                    child:  Gradienttextfield(
                      controller: passwordController,
                      text: "🔓 Password",
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.9,
                      colors: [
                        Colors.white,
                        Colors.blue.shade300
                      ],
                    )
                ),
                GestureDetector(
                    onTap: () async {
                      String id = idController.text.trim();
                      String password = passwordController.text.trim();

                      var login = await fetch_data(id, password);



                      if(login){
                        box.write('logged_in', true);

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Frame(
                              data: decoded_data,
                            ),),);
                      }
                    },

                    child: Padding(
                      padding: const EdgeInsets.only(left: 180,top: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.blue.shade100,
                                  Colors.blue.shade200,
                                  Colors.blue.shade500
                                ]
                            )
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "LOGIN ➔",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    )
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("For any queries.",
                        style: GoogleFonts.nunito(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                      Text(" Contact Admin",
                        style: GoogleFonts.nunito(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),)
                    ],
                  ),
                )
              ],
            ),
          ),

          Positioned(
            top: 110,
            left: 245,
            child: SizedBox(
              //margin: const EdgeInsets.only(top: 85, left: 290),
              height: MediaQuery.of(context).size.height * 0.17,
              child: Image.asset("lib/assets/Polygon2.png",
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 300,
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.17,

                child: Image.asset("lib/assets/Polygon.png")
            ),
          )

        ],
      ),
    );
  }
}
