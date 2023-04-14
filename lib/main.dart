import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sql_sample/Pages/LoginPage.dart';


void main() async {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatGPT',
      theme: ThemeData(useMaterial3: true),
      home: Center(
        child: LoginPage(),
      ),
    );
  }
}

class Data {
  final String id;
  final String name;
  final String SSN;
  final int salary;
  final String date_of_joining;
  final int experince;


  Data(this.id, this.name, this.SSN, this.salary, this.date_of_joining, this.experince,);
}


class FetchSql extends StatefulWidget {
  const FetchSql({Key? key}) : super(key: key);

  @override
  State<FetchSql> createState() => _FetchSqlState();
}

class _FetchSqlState extends State<FetchSql> {


void fetch_data() async{
  Uri url = Uri.parse('http://192.168.137.1/php_program/login.php');


  final String username = 'std1';
  final String password = 'c0ucw';

// Create a Map to hold the query parameters
  final Map<String, String> body2 = {
    'username': username,
    'password': password,
  };


  final response = await http.post(url,body: body2
  );

  print(response.body);

  setState(() {
    body = response.body;
    isloading = false;
  });
}

var body ;
bool isloading = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: fetch_data,
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Fetch',
                  style: TextStyle(
                      color: Colors.black
                  ),),
                ),
              ),
            ),
          ),

          (!isloading) ?  Container(
            height: 800,
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context,int index){

                return Text(body.toString());
              },
            ),
          ) : Column()
        ],
      ),
    );
  }
}

