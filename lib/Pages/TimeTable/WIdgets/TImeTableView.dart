import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget TimeTableView(List<Map<String, dynamic>> data,String day) {
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
       for (var entry in data) ...[

        if(entry['day'] == day) Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 2.8, spreadRadius: 0.5)
                ]),
            child: ListTile(

              subtitle: Text(entry['teach_name'],
              style: GoogleFonts.nunito(
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),),
              trailing: Column(
                children: [
                  Text(entry['day'],

                    style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),),
                  Text('${entry['time_from']} - ${entry['time_to']}',

                    style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                    ),),

                ],
              ),
              title: Text(entry['subject'],

                style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                ),),
            ),
          ),
        )
      ]
    ],
  ));
}
