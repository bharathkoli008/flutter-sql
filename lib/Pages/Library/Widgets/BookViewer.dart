import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Widget book_viewer(Map<String,dynamic> data){
  return


    Column(
      children: List.generate(data['author'].length, (index) {
        return Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    spreadRadius: 0.02),

              ]),
          child: Column(
            children: [
              Text(data['book_title'][index]),
              Text(data['author'][index]),
              Text(data['date_borrowed'][index]),
              Text(data['due_date'][index]),
              Text(data['date_returned'][index]),
            ],
          ),
        );
      }),
    );
}