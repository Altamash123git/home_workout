import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_workout/userInfo/user_info_values.dart';
import 'package:home_workout/userInfo/weight_page.dart';
import 'package:page_transition/page_transition.dart';

import '../UTILS/appcolors.dart';

class HeightInfoPage extends StatefulWidget {
  const HeightInfoPage({super.key});

  @override
  State<HeightInfoPage> createState() => _HeightInfoPageState();
}

class _HeightInfoPageState extends State<HeightInfoPage> {
  bool isFeet = true; // Toggle between ft and cm
  double selectedHeight = 0; // Selected height value
  var selectedheightlength;
  final ScrollController _scrollController = ScrollController();

  void _storeHeight() {
    // Function to store the height
    print(
        'Height stored: ${isFeet ? '$selectedHeight ft' : '$selectedHeight cm'}');
  }

  double? convertftintocm() {
    if (isFeet) {
      var selectedHeightincm = selectedHeight * 30;
      setState(() {});
      return selectedHeightincm;
    } else {
      return selectedHeight;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    heightselection();
  }

  void heightselection() {
    if (selectedHeight / 10 == 0) {
      selectedheightlength = 70.0;
      print(selectedheightlength);
    } else {
      //selectedheightlength=40.0;
    }
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
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
                    child: Text("Step 3",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize:
                                isLandscape ? width * 0.03 : width * 0.05)),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "What is Your Height ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        shadows: [Shadow(color: Colors.grey)],
                        fontSize: isLandscape ? width * 0.03 : width * 0.05),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Container(
                      //color: Colors.blueGrey,
                      width: width * 0.7,
                      height: height * 0.33,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: ToggleButtons(
                              borderRadius: BorderRadius.circular(8),
                              selectedBorderColor: Colors.red,
                              fillColor: AppColors.secondaryolor,
                              selectedColor: Colors.white,
                              color: Colors.black,
                              isSelected: [isFeet, !isFeet],
                              onPressed: (index) {
                                setState(() {
                                  isFeet = index == 0;
                                });
                              },
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  child: Text(
                                    ' Ft',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  child: Text(
                                    ' Cm',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: Stack(
                              children: [
                                // Horizontal ListView.builder
                                ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: isFeet
                                      ? 71
                                      : 201, // Feet range: 3-10 ft, CM range: 100-300 cm
                                  itemBuilder: (context, index) {
                                    bool isDivisibleBy10 = index % 10 == 0;
                                    bool isDivisibleBy5 = index % 5 == 0;
                                    double value = isFeet
                                        ? (3 + index * 0.1).toDouble()
                                        : (100 + index).toDouble();
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedHeight = value;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Text(isDivisibleBy5 ||
                                                        isDivisibleBy10
                                                    ? "${value.toStringAsFixed(1)}"
                                                    : ""),
                                                Container(
                                                  height: isDivisibleBy5 ||
                                                          isDivisibleBy10
                                                      ? 70
                                                      : 30,
                                                  alignment: Alignment.center,
                                                  //padding: EdgeInsets.only(top: isDivisibleBy10?0:20),
                                                  margin: EdgeInsets.only(
                                                      top: isDivisibleBy5 ||
                                                              isDivisibleBy10
                                                          ? 0
                                                          : 20),
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: selectedHeight ==
                                                              value
                                                          ? Colors.red
                                                          : Colors.grey,
                                                      width: 2.5,
                                                    ),
                                                    //borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Text(
                                                    isFeet
                                                        ? '${value.toStringAsFixed(1)} ft'
                                                        : '${value.toInt()} cm',
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                // The horizontal scrolling stick
                                GestureDetector(
                                  onHorizontalDragUpdate: (details) {
                                    // Update horizontal scrolling when the stick is dragged
                                    _scrollController.jumpTo(
                                      _scrollController.offset -
                                          details.delta.dx, // Adjust offset
                                    );
                                  },
                                  child: Container(
                                    width: 0, // Width of the stick
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 100,
                            child: Column(
                              children: [
                                Text(
                                  ' ${selectedHeight > 0 ? '${isFeet ? '${selectedHeight.toStringAsFixed(1)} ft' : '$selectedHeight. cm'}' : 'None'}',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Divider(
                                  height: 4,
                                  color: Colors.black,
                                  indent: 10,
                                  endIndent: 7,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      )),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  SizedBox(
                    height: height * 0.09,
                  ),
                  InkWell(
                    onTap: () {
                      if (selectedHeight != 0) {
                        UserInfoValues.height = convertftintocm().toString();


                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: WeightPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "please select height",
                          style: TextStyle(color: Colors.red),
                        )));
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryolor,
                          borderRadius: BorderRadius.circular(7)),
                      child: Text("Next",
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
        ));
  }
}
