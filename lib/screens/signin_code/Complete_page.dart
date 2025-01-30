import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../userInfo/user_info_values.dart';

class UserInfoComplete extends StatefulWidget {
  const UserInfoComplete({super.key});

  @override
  State<UserInfoComplete> createState() => _UserInfoCompleteState();
}

class _UserInfoCompleteState extends State<UserInfoComplete> {
  FirebaseFirestore firestore= FirebaseFirestore.instance;
  String uid="";
  @override
  void initState() {
    super.initState();
    getUid();
  }

  Future<void> getUid() async {
    var prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("uid") ?? "";

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
      if (currentUser != null ) {
       // Example default goal
      }
    }
    setState(() {});
  }


  /// saveuser data


  Future<void> saveAdditionalUserInfo() async {
    try {
      await firestore
          .collection("users")
          .doc(uid)
          .collection("userPreferences")
          .doc(DateTime.now().toString())
          .set({
        "gender": UserInfoValues.gender,
        "dob": UserInfoValues.dob,
        "height": UserInfoValues.height,
        "weight": UserInfoValues.weight,
        "BMI":UserInfoValues.BMI,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(

),
    );
  }
}

