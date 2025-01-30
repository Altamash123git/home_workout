import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:home_workout/HistroyBloc/history_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../HistroyBloc/history_event.dart';
import '../HistroyBloc/history_state.dart';
import '../UTILS/appcolors.dart';
import '../filter_history.dart';
import '../firebase_repo.dart';
import '../models/exercise_historymodel.dart';
import '../userInfo/UserData_bloc/Userbloc.dart';
import '../userInfo/UserData_bloc/userEvent.dart';
import '../userInfo/UserData_bloc/userState.dart';


/*
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController namecontroller = TextEditingController();
  // String username = 'Username';

  List<Map<dynamic, dynamic>>? history;
  String? username;

  @override
  void initState() {
    super.initState();

    var historybox = Hive.box<Map<dynamic, dynamic>>('exercisehistory');
    var namebox = Hive.box<String>('username');

    // Get history list
    List<Map<dynamic, dynamic>> list = historybox.values.toList();

    // Safely get the username
    String name = namebox.isEmpty ? 'Username' : namebox.values.first;

    setState(() {
      history = list;
      username = name;
    });

    print(history);
  }

  @override
  Widget build(BuildContext context) {
    // var namebox = Hive.box<String>('username');
    // var box = Hive.box<String>('exercisehistory');
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title:  Text(
          "Exercise History",
            style: TextStyle(color: Colors.white,
              fontSize: isLandscape?width*0.04:width*0.05,
            fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section

            SizedBox(height: height * 0.02),

            // Section Title
           Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ),
            SizedBox(height: height * 0.02),

            SizedBox(
              height: height * 0.5,
              child: history!.isEmpty
                  ? const Center(
                child: Text(
                  'No Workout History',
                  style: TextStyle(color: Colors.white),
                ),
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                    itemCount: history!.length,
                    itemBuilder: (context, index) {
                      // final exercise = exerciseHistory[index];

                      return Card(
                        color: const Color.fromARGB(255, 77, 77, 77)
                            .withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  // Exercise Image
                                  ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    child: Image.asset(
                                      history![index]['img']!,
                                      // exercise["imagePath"],
                                      fit: BoxFit.cover,
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  const SizedBox(width: 16),

                                  // Exercise name
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          history![index]['name']!,
                                          // exercise["name"],
                                            style: TextStyle(color: Colors.white,
                                              fontSize: isLandscape?width*0.04:width*0.05,)
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                               Divider(
                                color: AppColors.primarycolor,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            // SizedBox(
            //   height: height * 0.05,
            // ),
            //delete icon
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  history!.clear();
                },
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        var historybox = Hive.box<Map<dynamic, dynamic>>(
                            'exercisehistory',);
                        historybox.clear();
                        setState(() {
                          history = [];
                        });
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    //text deelete
                    Text(
                      'Delete History',
                        style: TextStyle(color: Colors.white,
                          fontSize: isLandscape?width*0.04:width*0.05,)
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
*/
class WorkoutHistory extends StatefulWidget {
  const WorkoutHistory({super.key});

  @override
  State<WorkoutHistory> createState() => _WorkoutHistoryState();
}

class _WorkoutHistoryState extends State<WorkoutHistory> {

  String uid="";
  var totalkcal=0;
  var totalduration=0;
  @override

  void initState() {
    super.initState();
    context.read<HistoryBloc>().add(GetallhistoryEvent());
    getUid();

  }

  Future<void> getUid() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var prefs = await SharedPreferences.getInstance();
      uid = prefs.getString("uid") ?? "";
      print(" uid : ${uid}");

      setState(() {}); // Safely called after build is complete
    });
  }
DateFormat timeformat=DateFormat("dd\\MM");
  List<FilterHistoryModel> mFilterData = [];
  List<ExerciseHistoryModel> mexercise=[];
  DateFormat dtFormat = DateFormat.yMMMEd();
  DateFormat monthFormat = DateFormat.MMMEd();
  DateFormat yearFormat = DateFormat.y();
  String selectedFilter = "This Month";
  final List<String> filterOptions = [
    "This Week",
    "This Month",
    "This Year",

  ]; // Options
  @override
  Widget build(BuildContext context) {
    final box= Hive.box("userProfile");
    final imgPath= box.get("ProfileImage") as String?;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SafeArea(
      child: Scaffold(
      body:Container(
        height: height,
        child: SingleChildScrollView(
      child: Column(
        children: [
          BlocProvider(
            create: (context) =>
            UserBloc(userRepository: UserRepository())..add(FetchCompleteUserData(uid)),
            child:
            Column(
              children: [
                uid.isEmpty
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: CircularProgressIndicator(),),
                    )
                    :
                BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        var data = state.userData;
                        final name = state.userData['name'] ?? 'User';
                        return
                          Container(
                          padding: EdgeInsets.all(10),
                          //margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: AppColors.secondaryolor,
                              borderRadius:BorderRadius.only(
                                bottomLeft: Radius.circular(width*0.05),
                                bottomRight: Radius.circular(width*0.05)
                              )),
                          //color: AppColors.secondaryolor,
                          child: Column(
                            children: [
                              Text(
                                "Exercise History",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              SizedBox(height: height * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.white)),
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  0.0), // Border thickness
                                              child: CircleAvatar(
                                                radius: 45, // Inner avatar size

                                                backgroundImage: imgPath != null
                                                    ? FileImage(File(imgPath!))
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Column(
                                    children: [
                                      Icon(Icons.local_fire_department, color: Colors.white,size: 40,),
                                      Text(
                                        "kcal $totalkcal",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),

                                  Text("$name",  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),),
                                  Column(
                                    children: [
                                      Icon(Icons.timer, color: Colors.white,size: 40,),
                                      Text(
                                        "$totalduration min",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      } else if (state is UserLoading) {
                        return Text('Loading...');
                      } else {
                        return Text('App Title');
                      }
                    }),

                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child:
                  DropdownButton<String>(
                    value: selectedFilter,

                    icon: Icon(
                      FontAwesomeIcons.filter,

                      color:AppColors.secondaryolor,
                    ),

                    underline: Container(),
                    isExpanded:
                    true,
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value!;
                        _applyFilter(mexercise);

                        // Call _applyFilter() if needed here
                        // Uncomment if you need to apply the filter immediately
                      });
                    },
                    items:
                    /* filterOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
               */ [
                      DropdownMenuItem(
                        value: 'This Year',
                        child: Text(
                          'This Year',
                          style: TextStyle(
                              color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Color(0xFFF6F6F6)
                                  : Colors.black),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'This Month',
                        child: Text(
                          'This Month',
                          style: TextStyle(
                              color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Color(0xFFF6F6F6)
                                  : Colors.black),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'This Week',
                        child: Text(
                          'This Week',
                          style: TextStyle(
                              color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Color(0xFFF6F6F6)
                                  : Colors.black),
                        ),
                      ),

                    ],
                  ),
                ),
                BlocBuilder<HistoryBloc, ExerciseHistroyState>(
                  builder: (_, state) {
                    if (state is HistoryLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is HistoryErrorState) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    }
                    if (state is HistoryLoadedState) {
                      var allExercises = state.mExercise;
                      mexercise=state.mExercise;

                      if (mFilterData.isEmpty) {

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _applyFilter(state.mExercise);
                        });
                      }
      
                      //_applyFilter(allExercises);
      
                      return mFilterData.isNotEmpty
                          ? Column(
                            children: [

                              ListView.builder(
                                                      shrinkWrap: true, // Constrain to parent size
                                                      physics: NeverScrollableScrollPhysics(), // Prevent nested scroll conflicts
                                                      itemCount: mFilterData.length,
                                                      itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: const Color(0xFFB9D1FF)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              mFilterData[index].exercise,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                       /*     Text(
                                              '${mFilterData[index].totaltime} mins',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),*/
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Divider(
                                            color: const Color(0xFFB9D1FF),
                                            thickness: 1,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount:
                                          mFilterData[index].mExercises.length,
                                          itemBuilder: (_, childIndex) {
                                            var exercise =
                                            mFilterData[index].mExercises[childIndex];
                                            DateTime date = DateTime.fromMillisecondsSinceEpoch(
                                                int.parse(exercise.exerciseDate));
                                            String formattedDate = DateFormat('dd\\MM HH:mm').format(date);
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    height: 70,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(3),
                                                      color: const Color(0xFFFAE6E7),
                                                    ),
                                                    child: Image.network(
                                                      exercise.exerciseimg,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          exercise.exerciseName,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.w700,
                                                            color: Color(0xff1e1e1e)
                                                          ),
                                                        ),
                                                        Text(
                                                          '${formattedDate} ',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 5,
                                                          color: Colors.black,
                                                        ),


                                                        Row(

                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Icon(Icons.timer,color: AppColors.secondaryolor,size: 29,),
                                                                Text("Time",style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w600,
                                                                  color: Color(0xff4a4545),
                                                                ),),
                                                                Text('${exercise.exerciseDuration} ',
                                                                  style: TextStyle(
                                                                    fontSize: 12,
                                                                    fontWeight: FontWeight.w600,
                                                                    color: Color(0xff4a4545),
                                                                  ),),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Icon(Icons.local_fire_department,color: AppColors.secondaryolor,size: 29,),
                                                                Text("kcal",style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w600,
                                                                  color: Color(0xff4a4545),
                                                                ),),
                                                                Text('${exercise.exerciseCalories} ',
                                                                  style: TextStyle(
                                                                    fontSize: 12,
                                                                    fontWeight: FontWeight.w600,
                                                                    color: Color(0xff4a4545),
                                                                  ),),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                GestureDetector(
                                                                    onTap:(){

                                                                      context.read<HistoryBloc>().add(HistoryDeleteEvent(id:mFilterData[index].mExercises[childIndex].historyid!));

                                                                    },
                                                                    child: Icon(Icons.delete,color: AppColors.secondaryolor,size: 29,)),
                                                                Text("Delete",style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w600,
                                                                  color: Color(0xff4a4545),
                                                                ),),
                                                                Text("")
                                                              ],
                                                            ),
                                                          ],
                                                        )


                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                                                      },
                                                    ),
                            ],
                          )
                          : Center(
                        child: Text("No workout history yet."),
                      );
                    }
      
                    return Center(
                      child: Text("Loading workout history..."),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
        ),
      ),
      
      
      ),
    );
  }
  void _applyFilter(List<ExerciseHistoryModel> allExercises) {
    // Reset total variables
    totalkcal = 0;
    totalduration = 0;

    mFilterData.clear(); // Clear previous filtered data

    // Apply filter based on selected filter
    if (selectedFilter == 'This Year') {
      _filterByYear(allExercises); // Filter by year
    } else if (selectedFilter == 'This Month') {
      _filterByMonth(allExercises); // Filter by month
    } else if (selectedFilter == 'This Week') {
      _filterByWeek(allExercises); // Filter by week
    } else {
      _showAllExercises(allExercises); // Default: Show all exercises
    }

    setState(() {}); // Update UI with the new totals
  }

// Filter by Month (grouped by days)
  void _filterByMonth(List<ExerciseHistoryModel> allExercises) {
    Map<String, num> dailyTotals = {}; // Store total by day
    Map<String, List<ExerciseHistoryModel>> dailyWorkouts = {}; // Store workouts by day

    for (ExerciseHistoryModel exercise in allExercises) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
          int.parse(exercise.exerciseDate));
      String day = DateFormat('dd MMM yyyy').format(date); // Updated date format for Month filter

      if (!dailyTotals.containsKey(day)) {
        dailyTotals[day] = 0;
        dailyWorkouts[day] = [];
      }

      double calories = _parseCalories(exercise.exerciseCalories);
      int duration = _parseDuration(exercise.exerciseDuration);

      dailyTotals[day] = dailyTotals[day]! + calories;
      dailyWorkouts[day]!.add(exercise);

      totalkcal += calories.toInt(); // Add to total calories
      totalduration += duration;    // Add to total duration
    }

    dailyTotals.forEach((day, totalCalories) {
      mFilterData.add(FilterHistoryModel(
          exercise: day, // Updated: Display formatted day
          totaltime: totalCalories,
          mExercises: dailyWorkouts[day]!));
    });
  }

// Filter by Year (grouped by months)
  void _filterByYear(List<ExerciseHistoryModel> allExercises) {
    Map<String, num> monthlyTotals = {}; // Store total by month
    Map<String, List<ExerciseHistoryModel>> monthlyWorkouts = {}; // Store workouts by month

    for (ExerciseHistoryModel exercise in allExercises) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
          int.parse(exercise.exerciseDate));
      String month = DateFormat('MMM yyyy').format(date); // Updated date format for Year filter

      if (!monthlyTotals.containsKey(month)) {
        monthlyTotals[month] = 0;
        monthlyWorkouts[month] = [];
      }

      double calories = _parseCalories(exercise.exerciseCalories);
      int duration = _parseDuration(exercise.exerciseDuration);

      monthlyTotals[month] = monthlyTotals[month]! + calories;
      monthlyWorkouts[month]!.add(exercise);

      totalkcal += calories.toInt(); // Add to total calories
      totalduration += duration;    // Add to total duration
    }

    monthlyTotals.forEach((month, totalCalories) {
      mFilterData.add(FilterHistoryModel(
          exercise: month, // Updated: Display formatted month
          totaltime: totalCalories,
          mExercises: monthlyWorkouts[month]!));
    });
  }

// Filter by Week (grouped by days)
  void _filterByWeek(List<ExerciseHistoryModel> allExercises) {
    Map<String, num> weeklyTotals = {}; // Store total by day
    Map<String, List<ExerciseHistoryModel>> weeklyWorkouts = {}; // Store workouts by day

    DateTime now = DateTime.now();
    int currentWeekday = now.weekday; // Get the current weekday
    DateTime weekStart = now.subtract(Duration(days: currentWeekday - 1)); // Start of week
    DateTime weekEnd = weekStart.add(Duration(days: 6)); // End of week

    for (ExerciseHistoryModel exercise in allExercises) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
          int.parse(exercise.exerciseDate));
      if (date.isAfter(weekStart) && date.isBefore(weekEnd)) {
        String day = DateFormat('dd MMM').format(date); // Updated date format for Week filter

        if (!weeklyTotals.containsKey(day)) {
          weeklyTotals[day] = 0;
          weeklyWorkouts[day] = [];
        }

        double calories = _parseCalories(exercise.exerciseCalories);
        int duration = _parseDuration(exercise.exerciseDuration);

        weeklyTotals[day] = weeklyTotals[day]! + calories;
        weeklyWorkouts[day]!.add(exercise);

        totalkcal += calories.toInt(); // Add to total calories
        totalduration += duration;    // Add to total duration
      }
    }

    weeklyTotals.forEach((day, totalCalories) {
      mFilterData.add(FilterHistoryModel(
          exercise: day, // Updated: Display formatted day
          totaltime: totalCalories,
          mExercises: weeklyWorkouts[day]!));
    });
  }

// Show all exercises (default)
  void _showAllExercises(List<ExerciseHistoryModel> allExercises) {
    for (ExerciseHistoryModel exercise in allExercises) {
      double calories = _parseCalories(exercise.exerciseCalories);
      int duration = _parseDuration(exercise.exerciseDuration);

      totalkcal += calories.toInt(); // Add to total calories
      totalduration += duration;    // Add to total duration

      mFilterData.add(FilterHistoryModel(
          exercise: exercise.exerciseName, // No change
          totaltime: calories,
          mExercises: [exercise]));
    }
  }

  double _parseCalories(String calories) {
    // Extract numeric part from string (e.g., "500 kcal" -> "500")
    String numericPart = calories.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(numericPart) ?? 0.0; // Return 0.0 if parsing fails
  }
  int _parseDuration(String duration) {
    try {
      List<String> parts = duration.split(':');
      int hours = int.parse(parts[0]);
      int minutes = int.parse(parts[1]);
      return (hours * 60) + minutes; // Convert to total minutes
    } catch (e) {
      print('Error parsing duration: $duration');
      return 0; // Return 0 if parsing fails
    }
  }

}
