import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_workout/demo_firebase.dart';
import 'package:home_workout/firebase_repo.dart';
import 'package:home_workout/screens/DashBoardPage.dart';
import 'package:home_workout/userInfo/user_info_values.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UTILS/appcolors.dart';
import '../UTILS/textdecoration.dart';
import '../screens/signin_code/Complete_page.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String uid = "";
  double _BMI = 0.0;
  var result;
  @override
  void initState() {
    super.initState();
    getUid();
  }

  Future<void> getUid() async {
    var prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("uid") ?? "";
    print(" uid is : ${uid}");
    if (uid.isNotEmpty) {
      // Check if user profile exists
      QuerySnapshot userPreferences = await firestore
          .collection("users")
          .doc(uid)
          .collection("userPreferences")
          .get();

      // isProfileCreated = userPreferences.docs.isNotEmpty;

      // Pre-fill fields for Google users (if applicable)

      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // Example default goal
      }
    }
    setState(() {});
  }

  /// saveuser data
  int calculateAge(String? dob) {
    if (dob == null || dob.isEmpty) {
      return 0; // Return 0 or a default value if dob is null or empty
    }

    try {
      // Parse the date string into a DateTime object
      DateFormat dateFormat = DateFormat("d/M/yyyy");
      DateTime birthDate = dateFormat.parse(dob);

      // Get today's date
      DateTime today = DateTime.now();

      // Calculate the age
      int age = today.year - birthDate.year;

      // Adjust for cases where the birthday hasn't occurred this year
      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }

      return age;
    } catch (e) {
      return 0; // Return a default value in case of an error
    }
  }

  Future<void> saveAdditionalUserInfo() async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("userPreferences")
          .doc("preferences")
          .set({
        "gender": UserInfoValues.gender,
        "dob": UserInfoValues.dob,
        "height": UserInfoValues.height,
        "weight": UserInfoValues.weight,
        "BMI": UserInfoValues.BMI,
      });
      print("Additional user info saved successfully.");
    } catch (e) {
      print("Error saving user info: $e");
    }
  }

  ///getuser data
  Future<Map<String, dynamic>?> fetchUserData(String uid) async {
    try {
      DocumentSnapshot doc = await firestore.collection("users").doc(uid).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        print("No user data found for UID: $uid");
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }

  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WillPopScope(
      onWillPop: () async {
        // Reset orientation to allow both landscape and portrait when leaving
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.22,
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: Colors.grey)
                    ],
                    shape: BoxShape.circle,

                    color: AppColors.secondaryolor,
                    //borderRadius: BorderRadius.circular(width * 0.1)
                  ),
                  child: Text("Result ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: isLandscape ? width * 0.03 : width * 0.05)),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  height: height*0.53,
                  child: SingleChildScrollView(
                    child: Container(

                      width: width * 0.79,
                      //height: height * 0.52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 4,
                              spreadRadius: 0,
                              color: Colors.grey)
                        ],
                          //color: Colors.grey,


                          ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${UserInfoValues.weight} kg",
                                  style: mTextStyle18()),
                              Text("${UserInfoValues.height} cm",
                                  style: mTextStyle18()),
                              Text(
                                  "${calculateAge(UserInfoValues.dob.toString())} ",
                                  style: mTextStyle18()),
                              Text("${UserInfoValues.gender} ",
                                  style: mTextStyle18())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Weight",
                                style: mTextStyle18(mcolor: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "Height",
                                  style: mTextStyle18(mcolor: Colors.grey),
                                ),
                              ),
                              Text(
                                "Age",
                                style: mTextStyle18(mcolor: Colors.grey),
                              ),
                              Text(
                                "Gender",
                                style: mTextStyle18(mcolor: Colors.grey),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            "Calories/Day",
                            style: TextStyle(
                                fontSize: 22,
                                color: Color(
                                  0xff1e1e1e,
                                ),
                                fontWeight: FontWeight.w900),
                          ),
                          Text("Maintain weight: 2,549 100%",style: mTextStyle18(mcolor: Color(0xaf1e1e1e)),),
                          Text("Mild weight loss: 2,299 90%" ,style: mTextStyle18(mcolor: Color(0xaf1e1e1e)),),
                          Text("Weight loss: 2,049 80%" ,style: mTextStyle18(mcolor: Color(0xaf1e1e1e)),),
                          Text("Extreme weight loss: 1,549 61%",style: mTextStyle18(mcolor: Color(0xaf1e1e1e)),),
                          SizedBox(
                            height: height*0.02,

                          ),
                          Text("BMI Results",style: TextStyle(
                              fontSize: 22,
                              color: Color(
                                0xff1e1e1e,
                              ),
                              fontWeight: FontWeight.w900),),
                          Divider(
                            height: 4,
                            color: Colors.grey,
                            indent: 30,
                            endIndent: 30,
                          ),
                          Container(
                              //width: width * 0.5,
                              //height: height * 0.2,
                              child: _calculateBMI(
                                  height: double.parse(
                                      UserInfoValues.height.toString()),
                                  weight: double.parse(
                                      UserInfoValues.weight.toString()),
                                  texthegiht: height,
                                  textwidth: width,
                                  isLandscape: isLandscape)),
                          SizedBox(
                            height: height*0.01,
                          ),
                          Text("Under Weight: BMI less Than 18.5",style: mTextStyle18(mcolor: Color(0xaf1e1e1e))),
                          Text("Normal Weight: BMI 18.5 to 24.9",style: mTextStyle18(mcolor: Color(0xaf1e1e1e))),
                          Text("Over Weight: BMI 25 to 29.9",style: mTextStyle18(mcolor: Color(0xaf1e1e1e))),
                          Text("Obesity: BMI 30 to 40",style: mTextStyle18(mcolor: Color(0xaf1e1e1e)))

                          //  Text( "${_calculatebminew(height: double.parse(UserInfoValues.height.toString()), weight: double.parse(UserInfoValues.height.toString()))}")
                          // _calculatebminew(height: double.parse(UserInfoValues.height.toString()), weight: double.parse(UserInfoValues.height.toString()))
                          // _calculateBMI(height: double.parse(UserInfoValues.height.toString()), weight: double.parse(UserInfoValues.height.toString()), texthegiht: 16, textwidth: 16, isLandscape: isLandscape)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                InkWell(
                  onTap: () async {
                    UserInfoValues.BMI = _BMI.toStringAsFixed(2);

                    saveAdditionalUserInfo();
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: Dashboardpage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryolor,
                        borderRadius: BorderRadius.circular(7)
                    ),
                    child: Text("Finished",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                            isLandscape ? width * 0.03 : width * 0.05)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _calculatebminew({required height, required weight}) {
    var heightInMeters = height / 100;
    var bmi = weight / (heightInMeters * heightInMeters);

    _BMI = bmi;
    return bmi;
  }

  Widget? _calculateBMI(
      {required double height,
      required double weight,
      required double texthegiht,
      required double textwidth,
      required bool isLandscape}) {
    var heightInMeters = height / 100; // Convert height to meters

    if (weight != 0 && height != 0 && weight > 0 && height > 0) {
      var bmi = weight / (heightInMeters * heightInMeters);
      print(heightInMeters);
      print(weight);

      _BMI = bmi;

      if (bmi <= 18.5) {
        return Column(
          children:
          [
            Text(
              "  ${_BMI.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: height*0.02,),
            Text(" Underweight",style: TextStyle(
                fontSize: 24,
                color: Color(
                  0xff1e1e1e,
                ),
                fontWeight: FontWeight.w900))
          ],
        );
      } else if (bmi > 18.5 && bmi < 24.9) {
        return  Column(
          children:
          [
            Text(
              "  ${_BMI.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: height*0.02,),
            Text("NORMAL BMI",style: TextStyle(
                fontSize: 24,
                color: Color(
                  0xff1e1e1e,
                ),
                fontWeight: FontWeight.w900))
          ],
        );
      } else if(bmi > 25 && bmi < 29.0){
        return
          Column(
            children:
            [
              Text(
                "  ${_BMI.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: height*0.02,),
              Text("Overweight",style: TextStyle(
                  fontSize: 24,
                  color: Color(
                    0xff1e1e1e,
                  ),
                  fontWeight: FontWeight.w900))
            ],
          );
      }else if(bmi>=30){
        return  Column(
          children:
          [
            Text(
              "  ${_BMI.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: height*0.02,),
            Text("Obese",style: TextStyle(
                fontSize: 24,
                color: Color(
                  0xff1e1e1e,
                ),
                fontWeight: FontWeight.w900))
          ],
        );
      }
    } else {
      _BMI = 0.0;
    }
  }
}
