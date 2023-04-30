import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sql_sample/Pages/Frame.dart';
import 'package:sql_sample/Pages/LoginPage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId('bdfb2f73-d845-48e0-b1fa-1070d2796dfe');
  OneSignal.shared.promptUserForPushNotificationPermission().then((value) {
    print('%%%%%%%%%%%%%%%%$value');
  });


  await GetStorage.init();
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
        child: Authcheck(),
      ),
    );
  }
}


class Authcheck extends StatefulWidget {
  const Authcheck({Key? key}) : super(key: key);

  @override
  State<Authcheck> createState() => _AuthcheckState();
}

class _AuthcheckState extends State<Authcheck> {
  bool userAvailabe = false;
  var data;
  final box = GetStorage();

  @override
  void initState() {

    _getuser();
    super.initState();
  }

  void _getuser() async {

    bool logged_in = box.read('logged_in') ?? false;
    if(logged_in){
      data = box.read('data');
    }
    setState(() {
      userAvailabe = logged_in;
    });
  }

  @override
  Widget build(BuildContext context) {
    return userAvailabe ? Frame(data: data) : LoginPage();
  }
}




