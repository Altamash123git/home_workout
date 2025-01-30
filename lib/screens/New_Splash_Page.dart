import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_workout/UTILS/textdecoration.dart';
import 'package:home_workout/screens/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import 'DashBoardPage.dart';
class NewSplashPage extends StatefulWidget {

  @override
  State<NewSplashPage> createState() => _NewSplashPageState();
}

class _NewSplashPageState extends State<NewSplashPage> {
  bool isLoggedIn=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlogininfo();
    Timer(Duration(seconds: 3),()async{
      isLoggedIn==true?  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Dashboardpage())): Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>WelcomePage()));
      setState(() {

      });
     });
  }

  void getlogininfo()async{
    var prefs= await  SharedPreferences.getInstance();
    isLoggedIn  =   prefs.getBool("isLoggedIn")!;
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: width * 0.53,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Ellipse 1.png"),
                  fit: BoxFit.contain),
            ),
          ),
        ),
        Positioned(
            top: height * 0.632,
            left: width * 0.22,
            child: Text(
              "Home Workout - No Equipment",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff000000),
              ),
            )),
        Positioned(
            bottom: height * 0.05,
            right: width * 0.31,
            child: Text(
              "Powered By FreeFit Soft",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff1e1e1e),
                  decoration: TextDecoration.underline),
            ))
      ],
    ));
  }
}
