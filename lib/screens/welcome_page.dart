import 'package:flutter/material.dart';
import 'package:home_workout/UTILS/appcolors.dart';
import 'package:home_workout/screens/signin_code/google_login.dart';
import 'package:home_workout/userInfo/gender_page.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:ui';
import '../UTILS/textdecoration.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.skip_next_outlined,
                  color: AppColors.secondaryolor,
                  size: 29,
                  weight: 30,
                ),
                Text(
                  "SKIP",
                  style: TextStyle(
                      color: AppColors.secondaryolor,
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: Container(
                alignment: Alignment.center,
                width: width * 0.5,
                height: height * .16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.grey),
                  image: DecorationImage(
                      image: AssetImage("assets/images/Ellipse 1.png"),
                      fit: BoxFit.contain),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.4,
              child: Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/male 1.png",
                                ),
                                fit: BoxFit.fill)),
                      )),
                  Expanded(
                    flex: 26,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //alignment:Alignment.center,
                          child: Text(
                            '"Forge Your Strength, fuel your fire,\nand become your legacy!"',
                            style: TextStyle(
                                shadows: [
                                  Shadow(offset: Offset(0, 0), blurRadius: 1)
                                ],
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                //height: 35.88,
                                decoration: TextDecoration.none),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Full-Body",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xefAF001A),
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 15),
                          child: Text(
                            "Home workout A convenient home workout app designed to help you stay fit anytime, anywhere.Access personalized workout plans, guided videos, and progress tracking, all tailored to your fitness level. No equipment? No problem—train with bodyweight exercises or minimal gear. Stay motivated and achieve your goals from the comfort of home!",
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                      offset: Offset(0, 1),
                                      blurRadius: 0.1,
                                      color: Color(0x7f000000))
                                ],
                                wordSpacing: 2,
                                height: 1.5,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff4a4545)),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: 150,
                child: Text(
                  "Let us know about yourself",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            offset: Offset(0, 0.2),
                            blurRadius: 0.1,
                            color: Color(0x7f000000))
                      ],
                      wordSpacing: 1,
                      fontSize: 13,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1e1e1e)),
                )),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: NewLoginPage()));
              },
              child: Container(
                alignment: Alignment.center,
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                    color: AppColors.secondaryolor,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  "Ready  >>",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
