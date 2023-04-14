import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Prepage extends StatefulWidget {
  const Prepage({Key? key}) : super(key: key);

  @override
  State<Prepage> createState() => PrepageState();
}

class PrepageState extends State<Prepage> {


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
          backgroundColor: Colors.transparent,

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Stack(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "School",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          " Name",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const Text(
                      " Here ",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
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
                                    childAspectRatio: 1.27
                                ),
                                padding: const EdgeInsets.only(),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30,left: 15,right: 10),
                                    child: GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow:const [ BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 10.0
                                            )]
                                        ),
                                        child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Image.asset("lib/assets/attendance.png",
                                                  height: 45,
                                                  width: 60,),
                                                Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          " Attendance",
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 15,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold
                                                          ),
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
                                    padding: const EdgeInsets.only(top: 30,left: 10,right: 15),
                                    child: GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow:const [ BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 10.0
                                            )]
                                        ),
                                        child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Image.asset("lib/assets/timetable.png",
                                                  height: 45,
                                                  width: 60,),
                                                Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          " Today's Classes",
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 15,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold
                                                          ),
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
                                    padding: const EdgeInsets.only(top: 25,left: 10,right: 15),
                                    child: GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow:const [ BoxShadow(
                                                color: Colors.grey,
                                                blurRadius:10.0
                                            )]
                                        ),
                                        child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Image.asset("lib/assets/homework.png",
                                                  height: 45,
                                                  width: 60,),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Homework",
                                                    style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(top: 25,left: 10,right: 15),
                                    child: GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow:const [ BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 10.0
                                            )]
                                        ),
                                        child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Image.asset("lib/assets/uploadmarks.png",
                                                  height: 45,
                                                  width: 60,),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Exam Performance",
                                                    style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 25,left: 10,right: 15),
                                    child: GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow:const [ BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 10.0
                                            )]
                                        ),
                                        child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Image.asset("lib/assets/fee_payment.png",
                                                  height: 45,
                                                  width: 60,),
                                                Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Fee Payment",
                                                          style: GoogleFonts.nunito(
                                                              fontSize: 15,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold
                                                          ),
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
                                    padding: const EdgeInsets.only(top: 25,left: 10,right: 15),
                                    child: GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow:const [ BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 10.0
                                            )]
                                        ),
                                        child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [

                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25),
                                                  child: Image.asset("lib/assets/feedback.png",
                                                    height: 45,
                                                    width: 60,),
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
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),

                                                      Text(
                                                        "Messages",
                                                        style: GoogleFonts.nunito(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold
                                                        ),
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
                  margin: const EdgeInsets.symmetric(vertical: 100,horizontal: 40),
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
                      children:  [
                        Text(
                          'Name',
                          style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text("ID: 123456 | Student",
                            style: GoogleFonts.nunito(
                                fontSize: 11.5,
                                letterSpacing: 0.1,
                                fontWeight: FontWeight.w600
                            ))
                      ],
                    ),
                  ),
                )
              ]),
            ),
          )
      ),
    );
  }
}
