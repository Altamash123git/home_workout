import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_workout/screens/welcome_page.dart';
import 'package:page_transition/page_transition.dart';

import '../UTILS/appcolors.dart';

class AbsWelcomePage extends StatelessWidget {
  const AbsWelcomePage({super.key});

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
                  color: Color(0xff2c67f2),
                  size: 29,
                  weight: 30,
                ),
                Text(
                  "SKIP",
                  style: TextStyle(
                      color: Color(0xff2c67f2),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height*0.05,),

            Padding(
              padding: const EdgeInsets.only(left: 0.0),
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
            Center(
              child: Container(
                alignment: Alignment.center,
                width: width * 0.67,
                //height: height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      //alignment:Alignment.center,
                      child: Text(
                        '"Your Personal abs Trainer!" Daily workouts designed to carve your six-pack from home-no gym required',
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                  offset: Offset(-1, 1),
                                  blurRadius: 2.5,
                                  color: Colors.grey)
                            ],
                            fontSize: 17,
                            color: Color(0xff1e1e1e),
                            fontWeight: FontWeight.w200,
                            //height: 35.88,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '"Six-Pack Unlocked!',
                          style: TextStyle(
                              color: Color(
                                0xff2c67F2,
                              ),
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    Text('Wokrouts+Diet=Ultimate Abs!"', style: TextStyle(
                        color: Color(
                          0xff2c67F2,
                        ),
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                    ),

                    SizedBox(
                      height: height * 0.005,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        "Say goodbye to stubborn belly fat and hello to a ripped six-pack-right from home! with Beginner ,immediate and Advanced workout levels, you'll sculpt your core step by step-no equippement needed! \n But abs aren’t just made in the gym—they’re made in the kitchen too! Our expert diet plans fuel muscle growth and burn fat faster, giving you real results. ",
                        style: TextStyle(
                          fontSize: 13,

                            wordSpacing: 1,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1e1e1e)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: height*0.05,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fitness_center,color: Colors.yellow,),
                        Text("Train. Eat. Transform. Are you ready",
                        style: TextStyle(
                          fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1e1e1e),

                        ),)
                      ],

                    ),
                    SizedBox(height: 5,)


                  ],
                ),
              ),
            ),



            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: WelcomePage()));
              },
              child:
              Container(
                alignment: Alignment.center,
                width: width*0.4,
                height: height*0.032,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff55a2fa),
                    Color(0xff2c67f2),


                  ],

                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.15, 1.0],
                  ),
                    color: AppColors.secondaryolor,
                    borderRadius: BorderRadius.circular(17)),
                child: Text(
                  "START TODAY",
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
