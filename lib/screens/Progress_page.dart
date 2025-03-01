import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

import 'package:flutter/material.dart';
import 'package:home_workout/UTILS/appcolors.dart';
import 'package:home_workout/screens/challengesScreen.dart';

import '../models/chalenges.dart';
import '../models/workout_model.dart';

class WorkoutChallengePage extends StatefulWidget {
  final int daysCompleted;
  final String workoutName;
  final ChallengeModel challenge;
  final WorkoutModel workout;



  WorkoutChallengePage({required this.daysCompleted,required this.workoutName,required this.workout,required this.challenge,}
       );

  @override
  State<WorkoutChallengePage> createState() => _WorkoutChallengePageState();
}

class _WorkoutChallengePageState extends State<WorkoutChallengePage> {

@override
  void initState() {

    super.initState();
    print(widget.daysCompleted);
  }
  @override
  Widget build(BuildContext context) {
    final box = Hive.box("userProfile");
    final imgPath = box.get("ProfileImage") as String?;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: AppColors.secondaryolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              color: AppColors.secondaryolor,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.purple
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  3.0), // Border thickness
                              child: CircleAvatar(
                                radius:
                                45, // Inner avatar size

                                backgroundImage: imgPath != null
                                    ? FileImage(File(imgPath!))
                                    : null,

                                //backgroundColor: Colors.blue,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                FontAwesomeIcons.medal,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.workoutName, style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),),
                          Text(
                            "WORKOUT CHALLENGE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              widget.daysCompleted >= 7
                                  ? Icon(
                                  Icons.star_outlined, color: Colors.yellow)
                                  : Icon(
                                  Icons.star_border, color: Colors.yellow),
                              widget.daysCompleted >= 14
                                  ? Icon(
                                  Icons.star_outlined, color: Colors.yellow)
                                  : Icon(
                                  Icons.star_border, color: Colors.yellow),
                              widget.daysCompleted >= 21
                                  ? Icon(
                                  Icons.star_outlined, color: Colors.yellow)
                                  : Icon(
                                  Icons.star_border, color: Colors.yellow),
                              widget.daysCompleted >= 28
                                  ? Icon(
                                  Icons.star_outlined, color: Colors.yellow)
                                  : Icon(
                                  Icons.star_border, color: Colors.yellow),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  Row(
                    children: [
                      Text(
                        "My Progress",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        "${widget.daysCompleted}/28 Days",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${(widget.daysCompleted / 28 * 100).toStringAsFixed(
                            1)}% Completed",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      value: widget.daysCompleted / 28,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            // Content Section
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.workoutName} Challenge",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),

                    // Week 1
                    buildWeekContainer(1, 7, widget.daysCompleted, "Week 1"),

                    // Week 2 (Days 8-14)
                    if (widget.daysCompleted >= 7) buildWeekContainer(8, 14, widget.daysCompleted, "Week 2"),

                    // Week 3 (Days 15-21)
                    if (widget.daysCompleted >= 15) buildWeekContainer(15, 21, widget.daysCompleted, "Week 3"),

                    // Week 4 (Days 22-28)
                    if (widget.daysCompleted >= 22) buildWeekContainer(22, 28, widget.daysCompleted, "Week 4"),
                  ],
                ),
              ),


            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryolor,
            padding: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Challengesscreen(workout: widget.workout,isChallenge: true,days: widget.daysCompleted, challengename: widget.workoutName, )));
          },
          child: Text(
            "Continue",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
Widget buildWeekContainer(int startDay, int endDay, int daysCompleted, String weekTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          weekTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: AppColors.secondaryolor),
        ),
      ),
      Container(
        height: 200,  // Adjust height if needed
        child: GridView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: 4,
          ),
          itemBuilder: (_, index) {
            int dayNumber = startDay + index;

            if (index == 7) {
              return Container(
                width: 200,
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: daysCompleted >= endDay ? Colors.yellowAccent : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(Icons.emoji_events, size: 40, color: Colors.white),
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: daysCompleted >= dayNumber ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Day $dayNumber", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Icon(
                      daysCompleted >= dayNumber ? Icons.lock_open_rounded : Icons.lock,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    ],
  );
}

}
