import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sql_sample/Pages/Attendance/AttendancePage.dart';
import 'package:sql_sample/Pages/Exam%20Stats/Exam_stats.dart';
import 'package:sql_sample/Pages/Library/Library.dart';
import 'package:sql_sample/Pages/TimeTable/TimeTable.dart';

import 'Attendance/Day_wise_attendance.dart';

class Prepage extends StatefulWidget {
  final Map<String, dynamic> data;

  const Prepage({Key? key, required this.data}) : super(key: key);

  @override
  State<Prepage> createState() => PrepageState();
}

class PrepageState extends State<Prepage> {
  
  viewAttendance() async {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        alignment:
            Alignment.lerp(Alignment.centerLeft, Alignment.centerLeft, 0.5),
        child: Attendance(
          data: widget.data,
        ),
      ),
    );
  }


  viewExamStats() async {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        alignment:
        Alignment.lerp(Alignment.centerLeft, Alignment.centerLeft, 0.5),
        child: ExamStats(
          data: widget.data,
        ),
      ),
    );
  }


  viewLibrary() async {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        alignment:
        Alignment.lerp(Alignment.centerLeft, Alignment.centerLeft, 0.5),
        child: Library(
          data: widget.data,
        ),
      ),
    );
  }

  viewDayWiseAtt() async {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        alignment:
        Alignment.lerp(Alignment.centerLeft, Alignment.centerLeft, 0.5),
        child: Day_Attendance(
          data: widget.data,
        ),
      ),
    );
  }

  viewTimetable() async {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        alignment:
        Alignment.lerp(Alignment.centerLeft, Alignment.centerLeft, 0.5),
        child: Timetable(
          data: widget.data,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Stack(children: [
                Column(
                  children: [


                    Text('SGV Ayurvedic Medical College Bailhongal',
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),),

                    SizedBox(
                      height: 22,
                      child: Text(
                        'powered by',
                        style: GoogleFonts.amita(
                          fontWeight: FontWeight.w800,
                          fontSize: 10,
                          color: Colors.orange
                        ),
                      ),
                    ),


                    Container(
                      height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [

                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset('lib/assets/Nexenstial.png'),
                        )),







                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     Text(
                    //       "School",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 24,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //     ),
                    //     Text(
                    //       " Name",
                    //       style: TextStyle(
                    //           fontSize: 24,
                    //           fontWeight: FontWeight.w600,
                    //           color: Color(0xfff07128)),
                    //     ),
                    //   ],
                    // ),
                    // const Text(
                    //   " Here ",
                    //   style: TextStyle(
                    //       fontSize: 24,
                    //       fontWeight: FontWeight.w600,
                    //       color: Colors.white),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35)),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 2.0,
                                        crossAxisSpacing: 2.0,
                                        childAspectRatio: 1.27),
                                padding: const EdgeInsets.only(),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 15, right: 10),
                                    child: GestureDetector(
                                      onTap: viewAttendance,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 5.0)
                                            ]),
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "lib/assets/attendance_percet.png",
                                              height: 45,
                                              width: 60,
                                            ),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      " Attendance",
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 10, right: 15),
                                    child: GestureDetector(
                                      onTap: viewTimetable,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 5.0)
                                            ]),
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "lib/assets/todays_classes.png",
                                              height: 45,
                                              width: 60,
                                            ),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      " Today's Classes",
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 10, right: 15),
                                    child: GestureDetector(
                                      onTap: viewDayWiseAtt,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 10.0)
                                            ]),
                                        child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "lib/assets/monthly_atttendance.png",
                                                  height: 45,
                                                  width: 60,
                                                ),
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(2.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Daily Attendance",
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 15,
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 10, right: 15),
                                    child: GestureDetector(
                                      onTap: viewExamStats,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 10.0)
                                            ]),
                                        child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "lib/assets/exam.png",
                                                  height: 45,
                                                  width: 60,
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Exam Stats",
                                                    style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 10, right: 15),
                                    child: GestureDetector(
                                      onTap: viewLibrary,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 10.0)
                                            ]),
                                        child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "lib/assets/library.png",
                                                  height: 45,
                                                  width: 60,
                                                ),
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(2.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          " Library",
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 15,
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 10, right: 15),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 10.0)
                                            ]),
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "lib/assets/homework.png",
                                              height: 45,
                                              width: 60,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Homework",
                                                style: GoogleFonts.nunito(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 10, right: 15),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 10.0)
                                            ]),
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "lib/assets/payment.png",
                                              height: 45,
                                              width: 60,
                                            ),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Fee Payment",
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 10, right: 15),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 10.0)
                                            ]),
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25),
                                              child: Image.asset(
                                                "lib/assets/message.png",
                                                height: 45,
                                                width: 60,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Personal",
                                                    style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "Messages",
                                                    style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
                  height: 56,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            spreadRadius: 0.02),
                      ]),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.nunito(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text("ID: 123456 | Student",
                            style: GoogleFonts.nunito(
                                fontSize: 11.5,
                                letterSpacing: 0.1,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                )
              ]),
            ),
          )),
    );
  }
}
