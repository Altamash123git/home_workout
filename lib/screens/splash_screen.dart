import 'package:flutter/material.dart';
import 'package:home_workout/UTILS/appcolors.dart';
import 'package:home_workout/UTILS/textdecoration.dart';
import 'package:home_workout/screens/DashBoardPage.dart';
import 'package:home_workout/screens/signin_code/google_login.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getlogininfo();
  }
  void getlogininfo()async{
    var prefs= await  SharedPreferences.getInstance();
    isLoggedIn  =   prefs.getBool("isLoggedIn")!;
  }
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    double _dragPosition = 0.0;
    double _dragThreshold = 500;
    bool isLandsacape= MediaQuery.of(context).orientation==Orientation.landscape;

    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: height * 0.1,
            left: width * 0.03,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Push Yourself",
                    style:
                        TextStyle(fontSize:isLandsacape? width * 0.04:width * 0.08, color: Colors.white)),
                Text("Harder To ",
                    style:
                        TextStyle(fontSize: isLandsacape? width * 0.04:width * 0.08, color: Colors.white)),
                Row(
                  children: [
                    Text("Become a",
                        style: TextStyle(
                            fontSize: isLandsacape? width * 0.04:width * 0.08, color: Colors.white)),
                    SizedBox(
                      width: 15,
                    ),
                    Transform(
                      transform: Matrix4.rotationZ(0.3),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primarycolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Better",
                            style: TextStyle(
                                fontSize: isLandsacape? width * 0.04:width * 0.08, color: Colors.black)),
                      ),
                    )
                  ],
                )
              ],
            )),
        Positioned(
          left: width*0.1,
            bottom: height * 0.05,
            child: GestureDetector(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width*0.8, height*0.02),
                    backgroundColor: AppColors.primarycolor
                  ),
                    onPressed: ()async {


                 isLoggedIn==true?  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Dashboardpage())): Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NewLoginPage()));
                    setState(() {

                    });
                    },

                    child: Text("Continue",
                        style: TextStyle(
                            fontSize: isLandsacape? width * 0.04:width * 0.09, color: Colors.black)))))
      ],
    ));
  }
}
