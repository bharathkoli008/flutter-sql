import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sql_sample/Pages/Attendance/Widgets/AttendanceViewer.dart';
import 'package:http/http.dart' as http;
import 'package:sql_sample/Pages/Attendance/Widgets/Day_wise_widget.dart';

class Day_Attendance extends StatefulWidget {
  final Map<String,dynamic> data;
  Day_Attendance({Key? key, required this.data}) : super(key: key);

  @override
  State<Day_Attendance> createState() => _Day_AttendanceState();
}

class _Day_AttendanceState extends State<Day_Attendance>  with TickerProviderStateMixin {

  late SharedPreferences sharedPreferences;
  String name = 'Loading..';
  String id = 'Loading..';
  List <String> subjects = [];
  var dateList = <Map<String, dynamic>>[];

  late int RollNo;
  late String classId;
  late final Future myFuture;

  late http.Response response;
  Map<String,dynamic> decoded_data = {};
  Map<String, int> presentCounts = {}; // Map to store present counts per subject name
  Map<String, int> subjectCounts = {};
  Map<String, double> presentPercentages = {};
  late List<String> dataArray = [];
  late List<String> subids = [];
  bool isLoading = true;
  bool isLoading2 = true;
  late var selectedValue1 = dataArray[0];
  Map<DateTime, int> outputMap = {};

  void fetch_data() async{

    Uri url = Uri.parse('https://sgvamcbailhongal.org/cms/api/student/subject.php');
    bool login = false;

// Create a Map to hold the query parameters
    final Map<String, String> body2 = {
      "class_id": widget.data['class'],
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
    decoded_data = jsonDecode(data)[0]['subject_name'];
  // print('=======================subname====${jsonDecode(data)[0]['subject_name']}');

    Map<String, dynamic> dataMap = decoded_data;
    dataArray = dataMap.values.toList().cast<String>();
    subids = dataMap.keys.toList().cast<String>();


    print(subids);


    setState(() {
      isLoading = false;
    });



  }



  void fetch_data_2() async{

    setState(() {
      isLoading2 = true;
    });

    dateList = <Map<String, dynamic>>[];

    Uri url = Uri.parse('https://sgvamcbailhongal.org/cms/api/student/subjectAttendance.php');
    bool login = false;

// Create a Map to hold the query parameters
    final Map<String, String> body2 = {
      "stud_session_id": widget.data['session_id'],
      "subject_id":  subids[dataArray.indexOf(selectedValue1)]
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
    decoded_data = jsonDecode(data)[0]['data'];
    print('===attendance====${decoded_data}');

    decoded_data.remove('subject_name');


    decoded_data.forEach((key, value) {
      outputMap[DateTime.parse(key)] = (value == "present") ? 1 : 2;
    });

    outputMap.keys.toList().sort();

    print(outputMap);

    setState(() {
      outputMap = outputMap;
    });


    final startDate = outputMap.keys.toList()[0];
    final endDate = outputMap.keys.toList()[outputMap.length -1];



    // Get the start and end date of the first month
    var startOfMonth = DateTime(startDate.year, startDate.month);
    var endOfMonth = DateTime(startDate.year, startDate.month + 1, 0);





    // Loop through each month and add the start, end dates and month name to the dateList
    while (endOfMonth.isBefore(endDate)) {
      dateList.add({
        'start': startOfMonth,
        'end': endOfMonth,
        'monthName': DateFormat('MMMM yyyy').format(startOfMonth),
      });

      // Increment to the start and end date of the next month
      startOfMonth = DateTime(endOfMonth.year, endOfMonth.month + 1);
      endOfMonth = DateTime(endOfMonth.year, endOfMonth.month + 2, 0);
    }

    // Add the start, end date and month name of the last month
    dateList.add({
      'start': startOfMonth,
      'end': endDate,
      'monthName': DateFormat('MMMM yyyy').format(startOfMonth),
    });

    // Print the dateList
    dateList.forEach((date) => print(date));



    setState(() {
      isLoading = false;
      isLoading2  = false;
    });



  }








  @override
  void initState() {
    fetch_data();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var controller = TabController(
        length: dateList.length,
        vsync:this,
        initialIndex: !isLoading2 ?  dateList.length - 1 : 1
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Day Attendance",
                                      style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),

                                 !isLoading ?  Padding(
                                   padding: const EdgeInsets.all(12.0),
                                   child: Center(
                                     child: DropdownButton2(
                                        buttonDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        dropdownDecoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15)
                                            )
                                        ),
                                        hint: Text(
                                            'Select Type',
                                            style: GoogleFonts.nunito(
                                                fontSize: 15,
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.w600
                                            )
                                        ),
                                        items: dataArray
                                            .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Text(
                                                item,
                                                style: GoogleFonts.nunito(
                                                    fontSize: 12,
                                                    color: Colors.grey.shade700,
                                                    fontWeight: FontWeight.w600
                                                )
                                            ),
                                          ),
                                        ))
                                            .toList(),
                                        value: selectedValue1,
                                        onChanged: (String? newValue) {
                                          fetch_data_2();
                                          setState(() {
                                            selectedValue1 = newValue!;
                                          });
                                        },
                                        dropdownMaxHeight: 500,
                                        buttonHeight: 40,
                                        buttonWidth: 340,
                                        itemHeight: 40,
                                      ),
                                   ),
                                 ) : Center(
                                    child: CupertinoActivityIndicator(
                                     radius: 15,
                                 ),
                                  ),




                                 !isLoading2 ?  SizedBox(
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
                                      tabs:  List.generate(dateList.length , (index) {
                                        return Text(dateList[index]['monthName']);
                                      }),
                                    ),
                                  ) : Container(),
                                  !isLoading2 ?  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.5,
                                    width: MediaQuery.of(context).size.width,
                                    child: TabBarView(
                                      controller: controller,
                                      children: List.generate(dateList.length, (index) {
                                        final monthHeatmap = month_heatMap(outputMap, dateList[index]['start'], dateList[index]['end']);
                                        return monthHeatmap; // use spread operator to add all the widgets to the list
                                      },
                                    ),
                                  ) ) : Center(
                                    heightFactor: 20,
                                    child: Container(),
                                  ),

                                  !isLoading2 ? Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [

                                            Container(
                                              color: Colors.greenAccent.withOpacity(0.8),
                                              child: Padding(
                                                padding: const EdgeInsets.all(9.0),
                                                child: Container(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text('Present'),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              color: Colors.red,
                                              child: Padding(
                                                padding: const EdgeInsets.all(9.0),
                                                child: Container(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text('Absent'),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Row(

                                          children: [
                                            Container(
                                              color: Colors.grey.shade300,
                                              child: Padding(
                                                padding: const EdgeInsets.all(9.0),
                                                child: Container(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text('N/A'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ) : Center(
                                      child: Container()),





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
