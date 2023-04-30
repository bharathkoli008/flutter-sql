import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

Widget month_heatMap( Map<DateTime, int> outputMap,DateTime start, DateTime end){
  return HeatMap(
      datasets: outputMap,
      showColorTip: false,
      fontSize: 14,
      defaultColor: Colors.grey.shade300,
      textColor: Colors.black,
      scrollable: true,
      onClick: (value){
        print("===================$value");
      },
      showText: true,
      size: 46,
      colorMode: ColorMode.color,
      startDate: start,
      endDate: end,
      colorsets: {
        1: Colors.red.withOpacity(0.9),
        2:Colors.greenAccent.withOpacity(0.8),
      }

  );
}