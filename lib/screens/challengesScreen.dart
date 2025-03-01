import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:home_workout/UTILS/appcolors.dart';
import 'package:home_workout/screens/ActiveScreen.dart';
import 'package:home_workout/screens/new_activate_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_repo.dart';
import '../models/workout_model.dart';
import '../userInfo/UserData_bloc/Userbloc.dart';
import '../userInfo/UserData_bloc/userEvent.dart';
import '../userInfo/UserData_bloc/userState.dart';

class Challengesscreen extends StatefulWidget {
  //final ChallengeModel challenge;
  final WorkoutModel workout;
  final bool isChallenge;
  final int days;
  final String challengename;

  const Challengesscreen(
      {super.key,
      required this.workout,
      required this.isChallenge,
      required this.days,
      required this.challengename});

  @override
  State<Challengesscreen> createState() => _ChallengesscreenState();
}

class _ChallengesscreenState extends State<Challengesscreen> {
  var days;
  String uid = "";

  @override
  void initState() {
    super.initState();
    final namebox = Hive.box('days');
    getUid();

    // Debugging Hive box
    print("All keys: ${namebox.keys}");
    print("All values: ${namebox.values}");

    final day = namebox.get(widget.workout.workoutname);
    print("Retrieved day: $day");

    setState(() {
      days = day ?? 0; // Set to 0 if the value is null
    });
  }

  Future<void> getUid() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var prefs = await SharedPreferences.getInstance();
      uid = prefs.getString("uid") ?? "";
      print(" uid : ${uid}");

      setState(() {}); // Safely called after build is complete
    });
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box("userProfile");
    final imgPath = box.get("ProfileImage") as String?;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool IsLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.secondaryolor,
        title: Text(
          "${widget.workout.workoutname} ",
          style: TextStyle(
              fontSize: IsLandscape ? width * 0.03 : width * 0.05,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xfff5f5f5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => UserBloc(userRepository: UserRepository())
              ..add(FetchCompleteUserData(uid)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                uid.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    : BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is UserLoaded) {
                            var data = state.userData;
                            final name = state.userData['name'] ?? 'User';
                            return
                              Container(
                              height: height * 0.21,
                              padding: EdgeInsets.all(10),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: AppColors.secondaryolor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(width * 0.05),
                                      bottomRight:
                                          Radius.circular(width * 0.05))),
                              //color: AppColors.secondaryolor,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: width * 0.2,
                                                height: height * 0.1,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 2,
                                                        color: Colors.white)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      0.0), // Border thickness
                                                  child: CircleAvatar(
                                                    radius:
                                                        45, // Inner avatar size

                                                    backgroundImage: imgPath !=
                                                            null
                                                        ? FileImage(
                                                            File(imgPath!))
                                                        : AssetImage(
                                                            "assets/images/fullbody2.jpeg"),

                                                    backgroundColor:
                                                        AppColors.secondaryolor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.local_fire_department,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          Text(
                                            "kcal ${widget.workout.calories}",
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                          Text(
                                            "$name",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.timer,
                                            color: Colors.white,
                                            size: 37,
                                          ),
                                          Text(
                                            "${widget.workout.duration} min",
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          } else if (state is UserLoading) {
                            return     Container(
                              height: height * 0.21,
                              padding: EdgeInsets.all(10),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: AppColors.secondaryolor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(width * 0.05),
                                      bottomRight:
                                      Radius.circular(width * 0.05))),
                              //color: AppColors.secondaryolor,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: width * 0.2,
                                                height: height * 0.1,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 2,
                                                        color: Colors.white)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      0.0), // Border thickness
                                                  child: CircleAvatar(
                                                    radius:
                                                    45, // Inner avatar size

                                                    backgroundImage: imgPath !=
                                                        null
                                                        ? FileImage(
                                                        File(imgPath!))
                                                        : AssetImage(
                                                        "assets/images/fullbody2.jpeg"),

                                                    backgroundColor:
                                                    AppColors.secondaryolor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.local_fire_department,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          Text(
                                            "kcal ${widget.workout.calories}",
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "user",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.timer,
                                            color: Colors.white,
                                            size: 37,
                                          ),
                                          Text(
                                            "${widget.workout.duration} min",
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );;
                          } else {
                            return Center(child: Text('Error loading user'));
                          }
                        },
                      ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Exercises",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff1e1e1e),
                        fontWeight: FontWeight.w700),
                  ),
                ),

                // Flexible ListView.builder
                Container(
                  //height: height * 0.7,
                  decoration: BoxDecoration(
                      //color: Colors.white
                      ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.workout.exerciselist.length,
                    itemBuilder: (_, index) {
                      //print(widget.workout.exercises.length,);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: ListTile(
                              leading: Container(
                                height: 300,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        widget.workout.exercisegiflist[index]),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              title: Text(
                                "${widget.workout.exerciselist[index]}",
                                style: TextStyle(
                                    color: Color(0xff4a4545),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        color: AppColors.secondaryolor,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "00:30 sec",
                                        style:
                                            TextStyle(color: Color(0xff4a4545)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.local_fire_department,
                                        color: AppColors.secondaryolor,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "18 kcal",
                                        style:
                                            TextStyle(color: Color(0xff4a4545)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 10,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            PageTransition(
              child: widget.isChallenge
                  ? ChallengesActiveScreen(
                      weekwise: widget.workout.weekwise,
                      ischallenge: true,
                      day: widget.days + 1,
                      ChallengeName: widget.challengename,
                      workoutName: widget.workout.workoutname,
                      calories: widget.workout.calories,
                      duration: widget.workout.duration,
                      img: widget.workout.image,
                      exerciseImages: [],
                      exerciseDetails: widget.workout.exercisedetaillist,
                    )
                  : Activescreen(
                      img: widget.workout.image,
                      ischallenge: false,
                      day: widget.days + 1,
                      exercisegifs: widget.workout.exercisegiflist,
                      workoutName: widget.workout.workoutname,
                      exercises: widget.workout.exerciselist,
                      exerciseDetails: widget.workout.exercisedetaillist,
                      exerciseaudios: widget.workout.exerciseaudiolist,
                      exerciseImages: [],
                      duration: widget.workout.duration,
                      calories: widget.workout.calories,
                      not_to_do: widget.workout.not_to_do,
                      instructions: widget.workout.instructions,
                      focuss_area: widget.workout.focus_areas,
                      short_description: widget.workout.shortdescription,
                      ChallengeName: widget.challengename,
                    ),
              type: PageTransitionType.leftToRight,
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(height * 0.02),
          alignment: Alignment.center,
          width: 200,
          height: height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondaryolor,
          ),
          child: Text(
            "Start",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
