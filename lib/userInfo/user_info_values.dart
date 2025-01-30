import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
@override

Future<String> getUid() async {
  var prefs = await SharedPreferences.getInstance();
var  uid = prefs.getString("uid") ?? "";
return uid;
}

class UserInfoValues{
  static String? gender;
  static String? dob;
  static String? height;
  static String? weight;
  static String? BMI;
}


