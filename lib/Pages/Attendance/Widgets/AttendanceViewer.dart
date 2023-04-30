import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


Widget AttendanceIndicator( Map<String, double> data, BuildContext context){
  return SingleChildScrollView(

    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: GridView(
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              ),
          padding: const EdgeInsets.only(),
          children: [

          for (var entry in data.entries) ...[
          Column(
            children: [

              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 10.0,
                startAngle: 220,
                linearGradient: LinearGradient(
                  colors: [
                    Colors.greenAccent,
                    Colors.blue
                  ]
                ),
                percent: entry.value/100,
                center:  Container(

                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Percent',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        fontSize: 12
                      ),),
                      Text( (entry.value.toString().length  <=  4) ? entry.value.toString().substring(0, 3) : entry.value.toString().substring(0, 5),
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w700,
                            fontSize: 17
                        ),),
                    ],
                  ),
                ),
                //progressColor: Colors.green,
              ),




              Text(entry.key,
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w500,
                      fontSize: 15
                  ),)
            ],
          ),
        ],]
      ),
    ),
  );

}