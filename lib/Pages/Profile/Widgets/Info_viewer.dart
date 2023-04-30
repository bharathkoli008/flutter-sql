import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ProfileViewer(String header, Map<String, dynamic> data) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                header,
                style: GoogleFonts.nunito(
                    fontSize: 19, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Image.asset(
                'lib/assets/edit.png',
                color: Colors.blueAccent,
                height: 28,
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 8, top: 8, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var entry in data.entries) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: GoogleFonts.nunito(
                            fontSize: 17,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        entry.value,
                        style: GoogleFonts.nunito(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
