/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import '../UTILS/appcolors.dart';
import '../UTILS/textdecoration.dart';
import '../userInfo/date_0f_birth.dart';
import '../userInfo/user_info_values.dart';

class AbsGenderPage extends StatefulWidget {
  const AbsGenderPage({super.key});

  @override
  State<AbsGenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<AbsGenderPage> {
  String gender = "";
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
                Text("Let Us Know About Yourself....",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26,
                        letterSpacing: 0.5,
                        height: 35.88 / 26,
                        color: Color(0xff1e1e1e),

                        //color: Color(0xff1e1e1e),
                        fontWeight: FontWeight.w900)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.22,
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                        Color(0xff55a2fa), // First color
                      Color(0xff2c67f2),
                    ],
                      begin: Alignment.topLeft, // Adjust gradient direction
                      end: Alignment.bottomRight,
                      stops: [0.3, 1.0],),
                    border: Border.all(width: 2, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 1,
                          spreadRadius: 0,
                          color: Colors.grey)
                    ],
                    shape: BoxShape.circle,

                    color: AppColors.secondaryolor,
                    //borderRadius: BorderRadius.circular(width * 0.1)
                  ),
                  child: Text("Step 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: isLandscape ? width * 0.03 : width * 0.05)),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "What is Your Gender ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      shadows: [Shadow(color: Colors.grey)],
                      fontSize: isLandscape ? width * 0.03 : width * 0.05),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.33,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Image.asset("assets/images/male 1.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              //color: Colors.green,
                              height: height * 0.315,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child:
                                Image.asset("assets/images/female 1.png"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                gender == "male"
                                    ? Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                                    : Container(),
                                //  gender=="male" ?  Icon(Icons.check,color: Colors.green,weight: 29,):null,
                                Text("I am",
                                    style:
                                    mTextStyle12(mFontWeight: FontWeight.w700)),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                  color:Color(0xff2c67f2),
                                  borderRadius: BorderRadius.circular(7)),
                              child: GestureDetector(
                                onTap: () {
                                  gender = "male";
                                  setState(() {});
                                  UserInfoValues.gender = "male";
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text(
                                        "Gender Saved as ${UserInfoValues.gender}",
                                        style: TextStyle(color: Colors.green),
                                      )));
                                },
                                child: Text(" Male",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isLandscape
                                            ? width * 0.03
                                            : width * 0.05)),
                              ),
                            )
                          ],
                        )),
                    Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                gender == "female"
                                    ? Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  weight: 50,
                                )
                                    : Container(),
                                Text("I am",
                                    style:
                                    mTextStyle12(mFontWeight: FontWeight.w700)),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                  color:Color(0xff2c67f2),

                                  borderRadius: BorderRadius.circular(7)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    gender = "female";
                                  });
                                  UserInfoValues.gender = "female";

                                  */
/* ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "Gender Saved as ${UserInfoValues.gender}",
                                style: TextStyle(color: Colors.green),
                              )));*//*

                                },
                                child: Text(" Female",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isLandscape
                                            ? width * 0.03
                                            : width * 0.05)),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                GestureDetector(
                  onTap: () {
                    if (UserInfoValues.gender == "male" ||
                        UserInfoValues.gender == "female") {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: AbsScrollableCalendar()));
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text(
                      //   "Gender Saved as ${UserInfoValues.gender}",
                      //   style: TextStyle(color: Colors.green),
                      // )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Please Select gender",
                            style: TextStyle(color: Colors.red),
                          )));
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                        color:Color(0xff2c67f2),

                        borderRadius: BorderRadius.circular(7)),
                    child: Text("Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                            isLandscape ? width * 0.03 : width * 0.05)),
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
*/

/*
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_workout/userInfo/height_info.dart';
import 'package:home_workout/userInfo/user_info_values.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:table_calendar/table_calendar.dart';

import '../UTILS/appcolors.dart';

class AbsScrollableCalendar extends StatefulWidget {
  @override
  _ScrollableCalendarState createState() => _ScrollableCalendarState();
}

class _ScrollableCalendarState extends State<AbsScrollableCalendar> {
  DateTime _selectedDate = DateTime.now(); // Initially set to today's date
  DateTime _focusedDate = DateTime.now(); // Currently focused date in the calendar
  String SelecteDate="";
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
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height*0.1,
                ),
                // Text("Let Us Know About Yourslef..",textAlign: TextAlign.center,style: TextStyle(decoration: TextDecoration.underline,fontSize: isLandscape?width*0.03:width*0.05),),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.22,
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff55a2fa), // First color
                      Color(0xff2c67f2),
                    ],
                      begin: Alignment.topLeft, // Adjust gradient direction
                      end: Alignment.bottomRight,
                      stops: [0.3, 1.0],),
                    border: Border.all(width: 2, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 1,
                          spreadRadius: 0,
                          color: Colors.grey)
                    ],
                    shape: BoxShape.circle,

                    color: AppColors.secondaryolor,
                    //borderRadius: BorderRadius.circular(width * 0.1)
                  ),
                  child: Text("Step 2",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: isLandscape ? width * 0.03 : width * 0.05)),
                ),
                SizedBox(
                  height: height*0.01,

                ),
                Text("What is Your Date of Birth ?",style:
                TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,


                    shadows: [
                      Shadow(color: Colors.grey)
                    ],
                    fontSize: isLandscape ? width * 0.03 : width * 0.05),),

                SizedBox(height: height*0.06,),
                Container(

                  width: width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [

                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 2,
                          spreadRadius: 3,
                          color:Colors.grey
                      )
                    ],
                  ),
                  //height: height*0.52,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7,bottom: 3),
                        width: width*0.87,
                        decoration :BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 0.4,
                                color: Colors.white

                            )
                        ),
                        child: Card(
                          color: Colors.white,
                          borderOnForeground: true,
                          elevation: 4,
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                TableCalendar(
                                  firstDay: DateTime(1900),
                                  lastDay: DateTime(2100),
                                  focusedDay: _focusedDate,
                                  selectedDayPredicate: (day) =>
                                      isSameDay(_selectedDate, day),
                                  onDaySelected: (selectedDay, focusedDay) {
                                    setState(() {
                                      _selectedDate = selectedDay;
                                      _focusedDate = focusedDay;
                                    });
                                  },
                                  headerStyle: HeaderStyle(
                                    formatButtonVisible: false,
                                    titleCentered: true,
                                    titleTextStyle: TextStyle(
                                      color:Color(0xff2c67f2),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    leftChevronIcon: Icon(
                                      Icons.chevron_left,
                                      color:Color(0xff2c67f2),
                                    ),
                                    rightChevronIcon: Icon(
                                      Icons.chevron_right,
                                        color:Color(0xff2c67f2),

                                    ),
                                  ),
                                  calendarStyle: CalendarStyle(
                                    todayDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:  Color(0xff2c67f2),
                                      //shape: BoxShape.circle,

                                    ),
                                    selectedTextStyle: TextStyle(
                                      color:Color(0xff2c67f2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    selectedDecoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.4),
                                      shape: BoxShape.circle,
                                    ),
                                    defaultTextStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                                    weekendTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                                    outsideDaysVisible: false,
                                  ),
                                  rowHeight: 45,
                                  daysOfWeekStyle: DaysOfWeekStyle(
                                    weekendStyle: TextStyle(color: Colors.grey),
                                    weekdayStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Divider(
                                  height: 3,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "My Date of Birth",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color:Color(0xff2c67f2),
                                      ),
                                    ),




                                    Text(
                                      DateFormat('dd/MMMM/yyyy').format(_selectedDate),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color:Color(0xff2c67f2),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 6,),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(
                  height: height*0.1,
                ),
                InkWell(
                  onTap:    (){
                    UserInfoValues.dob=" ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}";
                    if(UserInfoValues.dob!=null){

                      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Date of birth saved ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year} ",style: TextStyle(color: Colors.green),)));
                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade,child: NewHeightInfoPage()));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please select birth date ",style: TextStyle(color: Colors.red),)));
                    }

                  },
                  child: Container(
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
                    child: Text("Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                            isLandscape ? width * 0.03 : width * 0.05)),
                  ),
                )  ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_workout/userInfo/user_info_values.dart';
import 'package:home_workout/userInfo/weight_page.dart';
import 'package:page_transition/page_transition.dart';

import '../UTILS/appcolors.dart';

class NewHeightInfoPage extends StatefulWidget {
  const NewHeightInfoPage({super.key});

  @override
  State<NewHeightInfoPage> createState() => _HeightInfoPageState();
}

class _HeightInfoPageState extends State<NewHeightInfoPage> {
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
                      gradient: LinearGradient(colors: [
                        Color(0xff55a2fa), // First color
                        Color(0xff2c67f2),
                      ],
                        begin: Alignment.topLeft, // Adjust gradient direction
                        end: Alignment.bottomRight,
                        stops: [0.3, 1.0],),
                      border: Border.all(width: 2, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 1,
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
                            fontSize: isLandscape ? width * 0.03 : width * 0.05)),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    "How tall are you ? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        shadows: [Shadow(color: Colors.grey)],
                        fontSize: isLandscape ? width * 0.03 : width * 0.05),
                  ),
                  SizedBox(
                    height: height * 0.02,
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
                              //selectedBorderColor: Colors.red,
                              fillColor:  Color(0xff2c67f2),
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
                                                          ?  Color(0xff2c67f2)
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
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color:  Color(0xff2c67f2),),
                                ),
                                Divider(
                                  height: 4,
                                  color:Color(0xff2c67f2),
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
                                child: NewWeightPage()));
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
*/


/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_workout/userInfo/BMIPage.dart';
import 'package:home_workout/userInfo/user_info_values.dart';
import 'package:page_transition/page_transition.dart';

import '../UTILS/appcolors.dart';

class NewWeightPage extends StatefulWidget {
  const NewWeightPage({super.key});

  @override
  State<NewWeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<NewWeightPage> {
  bool isFeet = true; // Toggle between ft and cm

  double selectedWeight = 0;
  bool iskg = true;
  double? convertlbsintokg() {
    if (iskg == false) {
      var selectedweightinkg = selectedWeight * 0.454;
      setState(() {});
      return selectedweightinkg;
    } else {
      return selectedWeight;
    }
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
                      gradient: LinearGradient(colors: [
                        Color(0xff55a2fa), // First color
                        Color(0xff2c67f2),
                      ],
                        begin: Alignment.topLeft, // Adjust gradient direction
                        end: Alignment.bottomRight,
                        stops: [0.3, 1.0],),
                      border: Border.all(width: 2, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 1,
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
                            fontSize: isLandscape ? width * 0.03 : width * 0.05)),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    "What is your current weight ? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        shadows: [Shadow(color: Colors.grey)],
                        fontSize: isLandscape ? width * 0.03 : width * 0.05),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                      width: width * 0.7,
                      height: height * 0.33,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: ToggleButtons(
                              disabledColor: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              //selectedBorderColor: Colors.red,
                              fillColor: Color(0xff2c67f2),
                              selectedColor: Colors.white,
                              color: Colors.black,
                              isSelected: [iskg, !iskg],
                              onPressed: (index) {
                                setState(() {
                                  iskg = index == 0;
                                });
                              },
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  child: Text(
                                    ' Kg',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  child: Text(' lbs',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: iskg
                                  ? 701
                                  : 1501, // Feet range: 3-10 ft, CM range: 100-300 cm
                              itemBuilder: (context, index) {
                                bool isDivisibleBy10 = index % 10 == 0;
                                bool isDivisibleBy5 = index % 5 == 0;
                                double value = iskg
                                    ? (25 + index * 0.1).toDouble()
                                    : (55 + index * 0.1).toDouble();
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedWeight = value;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(isDivisibleBy5 || isDivisibleBy10
                                            ? "${value.toStringAsFixed(1)}"
                                            : ""),
                                        Container(
                                          height:
                                          isDivisibleBy5 || isDivisibleBy10
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
                                              color: selectedWeight == value
                                                  ? Color(0xff2c67f2)
                                                  : Colors.grey,
                                              width: 2.5,
                                            ),
                                            //borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            iskg
                                                ? '${value.toStringAsFixed(1)} kg'
                                                : '${value.toStringAsFixed(1)} lbs',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: Column(
                              children: [
                                Text(
                                  ' ${selectedWeight > 0 ? '${iskg ? '${selectedWeight.toStringAsFixed(1)} kgs' : '${selectedWeight.toStringAsFixed(1)} lbs'}' : 'None'}',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2c67f2),),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(
                                  height: 4,
                                  color: Color(0xff2c67f2),
                                  indent: 10,
                                  endIndent: 7,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      )),
                  SizedBox(
                    height: height * 0.13,
                  ),
                  InkWell(
                    onTap: () {
                      if (selectedWeight != 0) {
                        UserInfoValues.weight = convertlbsintokg().toString();
                        print(convertlbsintokg().toString());

                        */
/* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                " weight saved:${convertlbsintokg()} kg")));
                      *//*
  Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: BmiPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "please select weight",
                              style: TextStyle(color: Colors.red),
                            )));
                      }
                    },
                    child: Container(
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

*/


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_workout/screens/signin_code/google_login.dart';
import 'package:home_workout/userInfo/gender_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UTILS/appcolors.dart';
import 'DashBoardPage.dart';
import 'UserInfo.dart';

class AbsSignInPage extends StatefulWidget {
  const AbsSignInPage({super.key});

  @override
  State<AbsSignInPage> createState() => _AbsSignInPageState();
}

class _AbsSignInPageState extends State<AbsSignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController pswrdcontoller = TextEditingController();
  TextEditingController repswrdcontroller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    Future<void> signUpWithGoogle(BuildContext context) async {
      try {
        // Google Sign-In Process
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          print('Google Sign-In cancelled.');
          return;
        }

        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

        // Firebase Authentication
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
        await auth.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user == null) {
          print('Error: User is null after signing in with Google.');
          return;
        }

        // Save UID in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("uid", user.uid);
        prefs.setBool("isLoggedIn", true)!;
        // Check if user exists in Firestore
        final DocumentSnapshot userDoc =
        await firestore.collection('users').doc(user.uid).get();

        if (!userDoc.exists) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("uid", user.uid);
          prefs.setBool("isLoggedIn", true)!;
          // Create new user in Firestore
          await firestore.collection('users').doc(user.uid).set({
            'uid': user.uid,
            'name': user.displayName ?? 'Unknown',
            'email': user.email ?? 'No email provided',
            'photoUrl': user.photoURL ?? '',
            'createdAt': FieldValue.serverTimestamp(),
          });
          print('New user created in Firestore.');
        } else {
          print('User already exists in Firestore.');
        }

        // Navigate to the next page
        if (!context.mounted) return;
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            child: GenderPage(),
          ),
        );
      } catch (e) {
        print('Error during Google Sign-Up: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error during Google Sign-Up: $e')),
        );
      }
    }

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
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create an account",
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
                  "Join us and unlock a world of possibilities!",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff4a4545),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/Ellipse 1-shadow (1).png"),
                        fit: BoxFit.contain),
                  ),
                ),
                // SizedBox(
                //   height: height * 0.00,
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          "Your Name",
                          style:
                          TextStyle(color: Color(0xff1e1e1e), fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Color(0xff2c67f2)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Icon(
                              Icons.person_outline,
                              color: Color(0xff2c67f2),
                              size: 27,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Color(0xff2c67f2)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color:Color(0xff2c67f2),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            color: Color(0xffC8C8C8),
                          ),
                          hintText: "Ex. Saul Ramirez",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          "Email",
                          style:
                          TextStyle(color: Color(0xff1e1e1e), fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Color(0xff2c67f2)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Icon(
                              Icons.forward_to_inbox_outlined,
                              color: Color(0xff2c67f2),
                              size: 27,
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
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          "Your Password",
                          style:
                          TextStyle(color: Color(0xff1e1e1e), fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        textAlign: TextAlign.justify,
                        controller: pswrdcontoller,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Icon(
                              Icons.lock_open,
                              color:Color(0xff2c67f2),
                              size: 27,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Color(0xffAF001A)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Color(0xff2c67f2)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xff2c67f2),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            letterSpacing: 3,
                            color: Color(0xffC8C8C8),
                          ),
                          hintText: "******",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Homepage(username: namecontroller.text)));
                          if (nameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              pswrdcontoller.text.isNotEmpty) {
                            //  FirebaseAuth auth=FirebaseAuth.instance;
                            try {
                              var cred =
                              await auth.createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: pswrdcontoller.text);
                              print(cred.user!.uid);
                              print("uid is ${cred.user!.uid}");
                              SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                              prefs.setString("uid", cred.user!.uid);
                              //FirebaseFirestore firestore= FirebaseFirestore.instance;
                              await firestore
                                  .collection("users")
                                  .doc(cred.user!.uid)
                                  .set({
                                "uid": cred.user!.uid,
                                "name": nameController.text,
                                "email": emailController.text,
                                'createdAt': FieldValue.serverTimestamp(),
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => GenderPage()));
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("error creating account")));
                            }

                            SharedPreferences mpref =
                            await SharedPreferences.getInstance();
                            mpref.setBool("login", true);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                "please enter all the columns",
                              ),
                              backgroundColor: Colors.red,
                            ));
                            setState(() {});
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width,
                          height: 55,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(width*0.07),
                            color: Color(0xffAF001A),
                            gradient: LinearGradient(colors: [
                              Color(0xff55a2fa),
                              Color(0xff2c67f2),


                            ],

                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.15, 1.0],)
                          ),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              letterSpacing: 0.2,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min, // Ensures it takes only needed space
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                            visualDensity: VisualDensity.compact, // Reduces default padding
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrinks tap area
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isChecked = !_isChecked; // Allow text tap to toggle checkbox
                              });
                            },
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "By continuing you accept our ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffada4a5),
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: "Privacy policy and Term of use",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffada4a5),
                                  ))
                            ])),
                          ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Divider(
                              height: 4,
                              endIndent: 30,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "or",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Expanded(
                            child: Divider(
                              height: 4,
                              indent: 30,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Continue with",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff1e1e1e)),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              signUpWithGoogle(context);
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                  Border.all(width: 2, color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 30,
                                    child: Image.asset(
                                      "assets/images/google.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    "Google",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff1e1e1e),
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                Border.all(width: 2, color: Colors.grey)),
                            width: 150,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    height: 30,
                                    child: Image.asset(
                                      "assets/images/facebook.png",
                                      fit: BoxFit.contain,
                                    )),
                                Text(
                                  "Facebook",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff1e1e1e),
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type:
                                    PageTransitionType.rightToLeftWithFade,
                                    child: NewLoginPage()));
                          },
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Already have an Account?  ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff1e1e1e),
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                                text: "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffaf001a),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xffaf001a)))
                          ])),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                     /* Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            //Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade,child: NEwSignInPage()));
                          },
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "By signing up, you agree to our",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff4a4545),
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: "Terms of Service and Privacy Policy",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffaf001a),
                                ))
                          ])),
                        ),
                      ),*/
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
