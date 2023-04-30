import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sql_sample/Pages/Profile/View_profile.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sql_sample/main.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  final Map<String, dynamic> data;

  ProfilePage({Key? key, required this.data}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences sharedPreferences;
  String name = 'Loading..';
  String id = 'Loading..';
  List<String> subjects = [];
  late int RollNo;
  late String classId;
  late final Future myFuture;

  late http.Response response;
  Map<String,dynamic> decoded_data = {};

  viewProfile() async {


    Uri url = Uri.parse('https://sgvamcbailhongal.org/cms/api/student/profile.php');
    bool login = false;

// Create a Map to hold the query parameters
    final Map<String, String> body2 = {
      "student_id": widget.data['id'],
      "session_id": widget.data['session_id'],
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


    decoded_data = jsonDecode(data)[0]['data'];


    Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.fade,
          alignment:
              Alignment.lerp(Alignment.centerLeft, Alignment.centerLeft, 0.5),
          child: ViewProfile(data: decoded_data)),
    );
  }

  getData() {}


  final box = GetStorage();

  void Logout(){
    box.erase();

    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        alignment:
        Alignment.lerp(Alignment.centerLeft, Alignment.centerLeft, 0.5),
        child: Authcheck(
        ),
      ),
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Stack(children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.093,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)),
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Account",
                                    style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: const Divider(
                                    thickness: 1,
                                    indent: 2,
                                    endIndent: 4,
                                  ),
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: viewProfile,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Colors.black45)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'View Profile',
                                              style: GoogleFonts.nunito(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            Image.asset(
                                              'lib/assets/viewprofile.png',
                                              fit: BoxFit.contain,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: const Divider(
                                    thickness: 1,
                                    indent: 2,
                                    endIndent: 4,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            Border.all(color: Colors.black45)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Dark Mode',
                                            style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Image.asset(
                                            'lib/assets/timetable_mask.png',
                                            fit: BoxFit.fitHeight,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: const Divider(
                                    thickness: 1,
                                    indent: 2,
                                    endIndent: 4,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            Border.all(color: Colors.black45)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Contact Admin',
                                            style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Image.asset(
                                            'lib/assets/contact_admin.png',
                                            fit: BoxFit.fitHeight,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: const Divider(
                                    thickness: 1,
                                    indent: 2,
                                    endIndent: 4,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: Logout,
                                  child: Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Colors.black45)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Logout',
                                              style: GoogleFonts.nunito(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            Image.asset(
                                              'lib/assets/logout.png',
                                              fit: BoxFit.fitHeight,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 65, horizontal: 65),
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 2.0)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.data['username']}',
                            style: GoogleFonts.nunito(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Text("ID ${widget.data['id']} | Student",
                              style: GoogleFonts.nunito(
                                  fontSize: 10, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    Image.asset(
                      'lib/assets/avatar.png',
                      width: 100,
                      height: 70,
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
