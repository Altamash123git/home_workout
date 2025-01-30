import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_workout/userInfo/height_info.dart';
import 'package:home_workout/userInfo/user_info_values.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:table_calendar/table_calendar.dart';

import '../UTILS/appcolors.dart';

class ScrollableCalendar extends StatefulWidget {
  @override
  _ScrollableCalendarState createState() => _ScrollableCalendarState();
}

class _ScrollableCalendarState extends State<ScrollableCalendar> {
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
                    border: Border.all(
                        width: 2,color: Colors.white
                    ),
                    boxShadow: [

                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color:Colors.grey
                      )
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
                Text("What is Your Date of Birth ",style:
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
                                      color: AppColors.secondaryolor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    leftChevronIcon: Icon(
                                      Icons.chevron_left,
                                      color: AppColors.secondaryolor,
                                    ),
                                    rightChevronIcon: Icon(
                                      Icons.chevron_right,
                                      color:AppColors.secondaryolor,
                                    ),
                                  ),
                                  calendarStyle: CalendarStyle(
                                    todayDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.primarycolor,
                                      //shape: BoxShape.circle,

                                    ),
                                    selectedTextStyle: TextStyle(
                                      color: AppColors.secondaryolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    selectedDecoration: BoxDecoration(
                                      color: AppColors.secondaryolor.withOpacity(0.3),
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
                                    ),
                                  ),




                                  Text(
                                    DateFormat('dd/MMMM/yyyy').format(_selectedDate),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.secondaryolor,
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

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Date of birth saved ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year} ",style: TextStyle(color: Colors.green),)));
                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade,child: HeightInfoPage()));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please select birth date ",style: TextStyle(color: Colors.red),)));
                    }

                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryolor,
                        borderRadius: BorderRadius.circular(7)
                    ),
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



