import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTimetable(List<Map<String, dynamic>> rawdata,String day,Color colorname) {
  final List<String> weekdays = [    'Monday',    'Tuesday',    'Wednesday',    'Thursday',    'Friday',    'Saturday',    'Sunday',  ];




  return SizedBox(
    height: 100,
    width: 300,
    child: Row(
      children: [
        Expanded(
            child: Table(
              border: TableBorder(
                top: BorderSide(
                  color: Colors.white
                ),
                bottom: BorderSide(
                    color: Colors.white
                ),
                left: BorderSide(
                    color: Colors.white
                ),
                right: BorderSide(
                    color: Colors.white
                ),
              ),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.blueAccent.withOpacity(0.8)
                        ),
                        child: Center(
                          child: Text(
                            day,
                            style: GoogleFonts.nunito(
                                fontSize: 7,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                for (var entry in rawdata) ...[

                  if(entry['day'] == day)  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.2,
                                color: Colors.grey.withOpacity(0.2)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Container(
                                    decoration: BoxDecoration(
                                      color: colorname,
                                      borderRadius: BorderRadius.circular(2)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        entry['subject'],
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 5),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${entry['time_from']} - ${entry['time_to']}',
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w400,
                                        fontSize: 5),
                                  ),

                                  Text(
                                    entry['teach_name'],
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red,
                                          fontSize: 5),),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),],


              ],
            )

        ),
      ],
    ),
  );
}