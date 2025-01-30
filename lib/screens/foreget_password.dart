import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UTILS/appcolors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void _resetPassword() async {
    String email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email")),
      );
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset email sent")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    bool isLandscape=MediaQuery.of(context).orientation==Orientation.landscape;
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
      child:
      Scaffold(
        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot Your Password?",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff1e1e1e)),
                  ),
                  SizedBox(
                    width: 4,
                  ),

                ],
              ),
              Text(
                "Don't worry we'll help you to reser it",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff4a4545),
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Ellipse 1-shadow (1).png"),
                      fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: height*0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        "Email",
                        style: TextStyle(color: Color(0xff1e1e1e), fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Color(0xffAF001A)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        prefixIcon: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 18.0),
                          child: Icon(
                            Icons.alternate_email_outlined,
                            color: Color(0xffAF001A),
                            size: 30,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Color(0xffAF001A)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xffAF001A),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          color: Color(0xffC8C8C8),
                        ),
                        hintText: "Ex:abc@example.com",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        "Recover your password if you've forgotten it!",
                        style: TextStyle(color: Color(0xff4a4545), fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 7,),
                    InkWell(
                      onTap: (){
                        _resetPassword();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffAF001A),
                        ),
                        child: Text(
                          "Recover",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        )

      ),
    );
  }
}
