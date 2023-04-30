import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sql_sample/Pages/Notices.dart';
import 'package:sql_sample/Pages/Profile/Profile.dart';
import 'package:sql_sample/Pages/prepage.dart';
import 'package:http/http.dart' as http;


class Frame extends StatefulWidget {
  final Map<String,dynamic> data;
   Frame({Key? key, required this.data});

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  late SharedPreferences sharedPreferences;
  int _selectedIndex = 0;
  PageController _pageController = PageController(

  );



  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;

      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOutQuart);
    });
  }

  final List<Widget> _pages = [

  ];
  Color originalColor = Color(0xFF1d2754);
  Color? brighterColor = Color.lerp( Color(0xFF1d2754), Colors.white, 0.3);
  Color? brighterColor2 = Color.lerp( Color(0xFF1d2754), Colors.white, 0.4);

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [

               Color (0xFF1d2754),
                Color(0xFF293D6E),
                Color(0xFF284176),
                Color(0xFF293D6E),
                Colors.white


                // Colors.lightBlueAccent,
                // Colors.blueAccent,
                // Colors.blueAccent,
                // Colors.white
              ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children:  <Widget>[
             Prepage(
               data: widget.data,
             ),
            const Notices(),
            ProfilePage(
              data: widget.data,
            ),
          ],
        ),



        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25)
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.7,
            color:  Color(0xFF1d2754),
            child:  Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)
                ),
                child: GNav(
                  backgroundColor:  Color(0xFF1d2754),
                  gap: 8,
                  padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 10
                  ),
                  rippleColor: Colors.white,
                  tabBackgroundColor: Colors.white,
                  onTabChange: (index){
                    _navigateBottomBar(index);
                  },
                  tabs: [
                    GButton(icon: CupertinoIcons.house_alt,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      iconSize: 30,
                      text: 'Home',
                      iconActiveColor:  Color(0xFF1d2754),
                      style: GnavStyle.oldSchool,
                      textStyle: GoogleFonts.nunito(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w700
                      ),),
                    GButton(icon: Icons.notifications_none,
                      iconSize: 32,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      style: GnavStyle.oldSchool,
                      iconActiveColor: Color(0xFF1d2754),
                      textStyle: GoogleFonts.nunito(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w700
                      ),
                      text: 'Notices',),
                    GButton(icon: CupertinoIcons.person,
                      iconSize: 30,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      iconActiveColor:  Color(0xFF1d2754),
                      textStyle: GoogleFonts.nunito(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w700
                      ),
                      text: 'Profile',),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
