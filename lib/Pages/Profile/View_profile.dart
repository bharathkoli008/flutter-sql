import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sql_sample/Pages/Profile/Widgets/Info_viewer.dart';


class ViewProfile extends StatefulWidget {
  final Map<String,dynamic> data;
  ViewProfile({Key? key, required this.data}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {

  late SharedPreferences sharedPreferences;
  String name = 'Loading..';
  String id = 'Loading..';
  List <String> subjects = [];
  late int RollNo;
  late String classId;
  late final Future myFuture;



  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
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
                        "Profile",
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
                                      "View Profile",
                                      style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      child: const Divider(
                                        thickness: 1,
                                        indent: 2,
                                        endIndent: 4,
                                      ),
                                    ),
                                  ),

                                  ProfileViewer('Class Info :', {
                                    'Class :':widget.data['class'],
                                    'Section':widget.data['section'],
                                    'Roll No:':widget.data['roll_no']
                                  }),

                                  Center(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      child: const Divider(
                                        thickness: 1,
                                        indent: 2,
                                        endIndent: 4,
                                      ),
                                    ),
                                  ),


                                  ProfileViewer('Personal:', {
                                    'Email :':widget.data['email'],
                                    'FirstName':widget.data['firstname'],
                                    'LastName :':widget.data['lastname'],
                                    'Mobile No :':widget.data['mobileno'],
                                    'DOB :':widget.data['dob'],
                                    'Gender :':widget.data['gender'],
                                  }),




                                  Center(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      child: const Divider(
                                        thickness: 1,
                                        indent: 2,
                                        endIndent: 4,
                                      ),
                                    ),
                                  ),


                                  ProfileViewer('Gaurdian Info:', {
                                    'Name :':widget.data['guardian_name'],
                                    'FirstName':widget.data['guardian_relation'],
                                    'Mobile No:':widget.data['guardian_phone'],
                                  }),







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
                            '${widget.data['firstname']} ${widget.data['lastname']}',
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
