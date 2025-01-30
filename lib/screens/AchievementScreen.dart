import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_workout/screens/DashBoardPage.dart';

import '../UTILS/appcolors.dart';


class AchievementScreen extends StatefulWidget {
  final String exerciseLength;

  final String calories;
  final String duration;
 final bool ischallenge;
 final String challengeName;
 final int days;

  const AchievementScreen({

    super.key,
    required this.challengeName,
    required this.days,
    required this.ischallenge,
   required this.exerciseLength,
    required this.duration,
    required this.calories,
  });

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  late ConfettiController _confettiController;
  var totalexercise = 0;
  var totalduration = 0.0;
  var totalcalories = 0.0;
  List<int> weeklyExercises = List.filled(4, 0);
  List<double> weeklyDurations = List.filled(4, 0.0);
  List<double> weeklyCalories = List.filled(4, 0.0);


  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void calculateexercises() {
    if (widget.ischallenge) {
      totalexercise += int.parse(widget.exerciseLength); // Parse String to int
      totalduration += convertTimeToMinutes(widget.duration);
      totalcalories += double.parse(widget.calories);

    }
  }

  double convertTimeToMinutes(String time) {
    // Split the time string into hours and minutes or minutes and seconds
    List<String> parts = time.split(':');
    if (parts.length == 2) {
      int hoursOrMinutes = int.parse(parts[0]);
      int minutesOrSeconds = int.parse(parts[1]);

      // If the format is HH:MM, convert to total minutes
      return hoursOrMinutes * 60 + minutesOrSeconds.toDouble();
    }
    return 0.0;
  }


  void calculateWeeklyRecords() {
    int weekNumber = widget.days ~/ 7; // Determine the current week (1, 2, 3, or 4)

    if (widget.ischallenge && weekNumber > 0 && weekNumber <= 4) {
      weeklyExercises[weekNumber - 1] += int.parse(widget.exerciseLength);
      weeklyDurations[weekNumber - 1] += convertTimeToMinutes(widget.duration);
      weeklyCalories[weekNumber - 1] += double.parse(widget.calories);
    }
  }
String getDesscTitle(){
    if (widget.days == 7 || widget.days == 14 || widget.days == 21){
      return "Congratulations! This \nWeek's Workout is complete";
    }else if(widget.days == 28){
      return "You Have Successfully Completed \nYour ${widget.challengeName} Challenge";
    }
    return "Today's Workout Session\nhas Been Successfully\nCompleted.";
}
  String getRecordTitle() {
    if (widget.ischallenge) {
      if (widget.days == 7 || widget.days == 14 || widget.days == 21) {
        return "Weekly Records";
      } else if (widget.days == 28) {
        return "Your Challenge Records";
      }
    }
    return "Today's Record";
  }
  @override
  void initState() {
    super.initState();
    calculateexercises();
    print("$totalexercise is this");
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }
  @override



    Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    bool isLandscape=MediaQuery.of(context).orientation==Orientation.landscape;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          title:  Text(
            'CONGRATULATIONS',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff4a4545),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,

          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            widget.ischallenge? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.days>=7?Icon(Icons.star,color: Colors.yellow,):Container(),
                widget.days>=14?Icon(Icons.star,color: Colors.yellow):Container(),
                widget.days==21?Icon(Icons.star,color: Colors.yellow):Container(),
                widget.days==28?Icon(Icons.star,color: Colors.yellow):Container(),

              ],
            ):Container(),
            Icon(
              Icons.star, // Replace with a medal icon if needed
              color: Colors.orange,
              size: 130,
            ),
            SizedBox(height: 50),

            Text(
              getDesscTitle(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isLandscape?width*0.03:width*0.06,
                fontWeight: FontWeight.w600,
                color: Color(0xff4a4545),
              ),
            ),
            SizedBox(height: height*0.1),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.secondaryolor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Display Title Dynamically
                    Text(
                      getRecordTitle(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Container for Record Details
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 10), // Added padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildRecordColumn(
                            icon: Icons.fitness_center,
                            title: 'Exercise',
                            value: widget.ischallenge && (widget.days % 7 == 0)
                                ? "${totalexercise}" // Weekly count
                                : "${widget.exerciseLength}",
                          ),
                          buildRecordColumn(
                            icon: Icons.local_fire_department,
                            title: 'Calories Burned',
                            value: widget.ischallenge && (widget.days % 7 == 0)
                                ? "${totalcalories}"
                                : "${widget.calories}",
                          ),
                          buildRecordColumn(
                            icon: Icons.timer,
                            title: 'Time',
                            value: widget.ischallenge && (widget.days % 7 == 0)
                                ? "${totalduration} Minutes"
                                : "${widget.duration} Minutes",
                          ),
                        ],
                      ),
                    ),

                    // Save & Continue Button
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 7,
                        child: Container(
                          width: 180,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white
                          ),
                          child: Text(                          'SAVE AND CONTINUE',
                            style: TextStyle(fontSize: isLandscape?width*0.03:width*0.04, color: AppColors.secondaryolor,fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),
            Spacer(),

          ],
        ),
      );

    }
  Widget buildRecordColumn({required IconData icon, required String title, required String value}) {
    return Column(
      children: [
        Icon(icon, color: AppColors.secondaryolor),
        Divider(
          height: 2,color: Colors.grey,
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff4a4545),
            fontWeight: FontWeight.bold,
          ),
        ), Divider(
          thickness: 3,
          height: 4,color: Colors.red,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff4a4545),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }


}

