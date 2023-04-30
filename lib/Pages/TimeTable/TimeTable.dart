import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sql_sample/Pages/Attendance/Widgets/AttendanceViewer.dart';
import 'package:http/http.dart' as http;
import 'package:sql_sample/Pages/TimeTable/WIdgets/TImeTableView.dart';
import 'package:sql_sample/Pages/TimeTable/WIdgets/TableVIew.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Timetable extends StatefulWidget {
  final Map<String,dynamic> data;
  Timetable({Key? key, required this.data}) : super(key: key);

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable>  with TickerProviderStateMixin {

  late SharedPreferences sharedPreferences;
  String name = 'Loading..';
  String id = 'Loading..';
  List <String> subjects = [];
  late int RollNo;
  late String classId;
  late final Future myFuture;
  bool isLoading = true;

  var weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  var colors = [Colors.blue,Colors.green,Colors.yellow.shade800,Colors.redAccent,Colors.purpleAccent,Colors.pink,Colors.cyanAccent];
  late var selectedValue = weekdays[0];

  late http.Response response;
  Map<String,dynamic> decoded_data = {};
  List<Map<String, dynamic>> dataList = [];
  String day = '';
  late String day_2;
  String time = '';




  void getDate()  {
    var date = DateTime.now();

    print(date.toString()); // prints something like 2019-12-10 10:02:22.287949
    print(DateFormat('EEEE').format(date)); // prints Tuesday
    print(DateFormat('EEEE, dmmyyyy').format(date)); // prints Tuesday, 10 Dec, 2019
    print(DateFormat('h:mm a').format(date)); //
    day = DateFormat('EEEE, d MMM, yyyy').format(date);
    day_2 = DateFormat('EEEE').format(date);
    setState(() {
      day_2 = day_2;
    });
    time = DateFormat('h:mm a').format(date);




  }

  void fetch_data() async{

    Uri url = Uri.parse('https://sgvamcbailhongal.org/cms/api/student/timetable.php');

// Create a Map to hold the query parameters
    final Map<String, String> body2 = {
      "class_id": widget.data['class'],
      "section_id":widget.data['section']
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

      setState(() {
        isLoading = false;
      });

    }
    var data = '[' + response.body.toString() + ']';
    decoded_data = jsonDecode(data)[0];
    print('=======================att====${jsonDecode(data)[0]}');


    decoded_data.remove('message');


    // Parse JSON data


// Map JSON data to List<Map<String, dynamic>>
    dataList = decoded_data.values.toList().cast<Map<String, dynamic>>();

// Accessing data from the List<Map<String, dynamic>>
    // Sort dataList on the basis of time_from in ascending order
    dataList.sort((a, b) => a['time_from'].compareTo(b['time_from']));


    setState(() {
      isLoading = false;
    });


  }







  @override
  void initState() {
    getDate();
    fetch_data();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var controller = TabController(
        length: 6,
        vsync:this,
        initialIndex: weekdays.indexOf(day_2)
    );

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


                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: TabBar(
                                      controller: controller,
                                      indicatorColor: Colors.blueAccent,
                                      labelColor: Colors.blueAccent,
                                      labelStyle: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blueAccent,
                                        fontSize: 15
                                      ),
                                      isScrollable: true,
                                      tabs: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(weekdays[0]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(weekdays[1]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(weekdays[2]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(weekdays[3]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(weekdays[4]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(weekdays[5]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  !isLoading ?  SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.8,
                                  width: MediaQuery.of(context).size.width,
                                  child: TabBarView(
                                    controller: controller,
                                     children: [
                                       TimeTableView(dataList,weekdays[0]),
                                       TimeTableView(dataList,weekdays[1]),
                                       TimeTableView(dataList,weekdays[2]),
                                       TimeTableView(dataList,weekdays[3]),
                                       TimeTableView(dataList,weekdays[4]),
                                       TimeTableView(dataList,weekdays[5])
                                     ],
                                   ),
                                ) : Center(
                                    heightFactor: 20,
                                  child: CupertinoActivityIndicator(
                                    radius: 15,

                                  ),
                                )


                                 // !isLoading ?
                                 // TimeTableView(dataList,day_2)
                                 //  : Center(child: CupertinoActivityIndicator(
                                 //   radius: 15,
                                 // )),


                                  // !isLoading ?
                                  //
                                  //   SizedBox(
                                  //     width: MediaQuery.of(context).size.width * 6,
                                  //     height:  MediaQuery.of(context).size.height * 1 ,
                                  //     child: Zoom(
                                  //       backgroundColor: Colors.white,
                                  //       doubleTapScaleChange: 1.5,
                                  //       maxScale: 2.5,
                                  //       initTotalZoomOut: true,
                                  //       child: Center(
                                  //         child: Row(
                                  //           children: [
                                  //
                                  //             buildTimetable(dataList,weekdays[0],colors[0]),
                                  //             buildTimetable(dataList,weekdays[1],colors[1]),
                                  //             buildTimetable(dataList,weekdays[2],colors[2]),
                                  //             buildTimetable(dataList,weekdays[3],colors[3]),
                                  //             buildTimetable(dataList,weekdays[4],colors[4]),
                                  //             buildTimetable(dataList,weekdays[5],colors[5]),
                                  //             buildTimetable(dataList,weekdays[6],colors[6]),
                                  //
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   )
                                  //  : Center(child: CupertinoActivityIndicator(
                                  //   radius: 15,
                                  // )),




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
