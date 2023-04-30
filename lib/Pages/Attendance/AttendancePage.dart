import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sql_sample/Pages/Attendance/Widgets/AttendanceViewer.dart';
import 'package:http/http.dart' as http;

class Attendance extends StatefulWidget {
  final Map<String,dynamic> data;
  Attendance({Key? key, required this.data}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {

  late SharedPreferences sharedPreferences;
  String name = 'Loading..';
  String id = 'Loading..';
  List <String> subjects = [];
  late int RollNo;
  late String classId;
  late final Future myFuture;

  late http.Response response;
  Map<String,dynamic> decoded_data = {};
  Map<String, int> presentCounts = {}; // Map to store present counts per subject name
  Map<String, int> subjectCounts = {};
  Map<String, double> presentPercentages = {};
  bool isLoading = true;

  void fetch_data() async{


    Uri url = Uri.parse('https://sgvamcbailhongal.org/cms/api/student/attendance.php');
    bool login = false;

// Create a Map to hold the query parameters
    final Map<String, String> body2 = {
      "student_id": widget.data['id'],
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


    if(response.body == '"Error in preparing statement: "'){
      const SnackBar(content: Text("Error fetching data Please contact admin"));

    } else if(response.statusCode == 200) {


    }
    var data = '[' + response.body.toString() + ']';
    decoded_data = jsonDecode(data)[0];
    print('=======================att====${jsonDecode(data)[0]}');


    decoded_data.remove('message');


    decoded_data.forEach((key, value) {
      String name = value['name'];
      int absent = int.parse(value['absent']);
      int present = int.parse(value['present']);
      double attendancePercentage = (present / (absent + present)) * 100;
      print('$name: Attendance Percentage = $attendancePercentage%');
      presentPercentages[name] = attendancePercentage;
    });

    setState(() {
      isLoading = false;
    });

    

  }



  @override
  void initState() {
    fetch_data();
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
                        "",
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
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Attendance",
                                      style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),


                                  !isLoading ?
                                  AttendanceIndicator(presentPercentages,context) :
                                  Center(child: CupertinoActivityIndicator(radius: 15,

                                  )),

                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ),







                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 65,horizontal: 65),
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
                        children:  [
                          Text(
                            '${widget.data['username']}',
                            style: GoogleFonts.nunito(
                                fontSize: 17,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Text("ID ${widget.data['id']} | Student",
                              style: GoogleFonts.nunito(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600
                              ))
                        ],
                      ),
                    ),

                    Image.asset('lib/assets/avatar.png',
                      width: 100,
                      height: 70,)
                  ],
                ),
              )
            ]),
          ),
        )
    );
  }
}
