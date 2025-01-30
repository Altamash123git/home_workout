import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home_workout/UTILS/appcolors.dart';
import 'package:home_workout/models/workout_model.dart';
import 'package:home_workout/screens/ActiveScreen.dart';
import 'package:home_workout/screens/allworkout_detailpage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_repo.dart';
import '../userInfo/UserData_bloc/Userbloc.dart';
import '../userInfo/UserData_bloc/userEvent.dart';
import '../userInfo/UserData_bloc/userState.dart';

class AllworkoutPage extends StatefulWidget {
  @override
  State<AllworkoutPage> createState() => _AllworkoutPageState();
  late AllWorkoutModel workouts;
}

class _AllworkoutPageState extends State<AllworkoutPage> {
  var days;
  String uid = "";

  @override
  void initState() {
    super.initState();

    getUid();

    // Debugging Hive box
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
          "All Exercises ",
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
                            return Container(
                              height: height * 0.19,
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
                                                height: height * 0.12,
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
                                          Text(
                                            "$name",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          } else if (state is UserLoading) {
                            return Center(child: CircularProgressIndicator());
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
                  height: height * 0.7,
                  decoration: BoxDecoration(
                      //color: Colors.white
                      ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: allworkoutlist.length,
                    itemBuilder: (_, index) {
                      //print(widget.workout.exercises.length,);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      child: Activescreen(
                                          short_description: workoutlist[index]
                                              .shortdescription,
                                          not_to_do:
                                              allworkoutlist[index].not_to_do,
                                          instructions:
                                              allworkoutlist[index].instructions,
                                          focuss_area:
                                              allworkoutlist[index].focuss_area,
                                          duration: workoutlist[index].duration,
                                          calories: workoutlist[index].calories,
                                          workoutName:
                                              allworkoutlist[index].workoutname,
                                          day: 0,
                                          exercises:
                                              allworkoutlist[index].exercises,
                                          exerciseDetails: workoutlist[index]
                                              .exercisedetaillist,
                                          exerciseImages: [],
                                          exercisegifs: allworkoutlist[index]
                                              .exercisegifs,
                                          exerciseaudios: allworkoutlist[index]
                                              .exerciseaudios,
                                          img: workoutlist[index].image,
                                          ischallenge: false, ChallengeName: '',)));
                            },
                            child: Container(
                              child: ListTile(
                                leading: Container(
                                  width: 100,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          allworkoutlist[index].exerciseimg),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "${(allworkoutlist[index].workoutname)}",
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
                                          style: TextStyle(
                                              color: Color(0xff4a4545)),
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
                                          style: TextStyle(
                                              color: Color(0xff4a4545)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
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
    );
  }
}
/*ListTile(
                            leading: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(allworkoutlist[index].exerciseimg,fit: BoxFit.contain,)),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.secondaryolor),
                            title: Text(allworkoutlist[index].workoutname,style: TextStyle(color: Color(0xff1e1e1e),
                              fontSize: isLandscape?width*0.04:width*0.06,)),
                          ),*/
