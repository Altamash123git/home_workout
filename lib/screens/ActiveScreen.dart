import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:hive/hive.dart';
import 'package:home_workout/HistroyBloc/history_bloc.dart';
import 'package:home_workout/HistroyBloc/history_event.dart';
import 'package:home_workout/UTILS/appcolors.dart';
import 'package:home_workout/favourites_bloc/favourites_bloc.dart';
import 'package:home_workout/favourites_bloc/favourites_event.dart';
import 'package:home_workout/models/exercise_historymodel.dart';
import 'package:home_workout/screens/HomePage.dart';
import 'package:intl/intl.dart';

import 'AchievementScreen.dart';

class Activescreen extends StatefulWidget {
  final String workoutName;
  final String img;
  final String calories;
  final String duration;
  final List<String> exercises;
  final List<String> exerciseDetails;
  final List<String> exerciseImages; // Paths for exercise images or GIFs
  final List<String> exercisegifs;
  final List<String> exerciseaudios;
  final int day;
  final String ChallengeName;
  final bool ischallenge;
  final List<String> instructions;
  final List<String> focuss_area;
  final List<String> not_to_do;
  final List<String> short_description;
  const Activescreen({
    super.key,
    required this.ChallengeName,
    required this.short_description,
    required this.not_to_do,
    required this.instructions,
    required this.focuss_area,
    required this.duration,
    required this.calories,
    required this.workoutName,
    required this.day,
    required this.exercises,
    required this.exerciseDetails,
    required this.exerciseImages,
    required this.exercisegifs,
    required this.exerciseaudios,
    required this.img,
    required this.ischallenge,
  });

  @override
  State<Activescreen> createState() => _ActivescreenState();
}

class _ActivescreenState extends State<Activescreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  AudioPlayer player = AudioPlayer();
  DateTime? selectedDate;
  DateFormat dtFormat = DateFormat.yMMMEd();
  bool isPaused = false;
  double _currentVolume = 0.5;
  int currentExerciseIndex = 0;
  double? exerciseDuration;
  double? restDuration;
  double? guideDuration;
  Timer? timer;
  double fixtiming = 30;
  late TabController _tabController;
  double timerSeconds = 30; // General timer value
  String currentPhase =
      'getReady'; // Phase control: 'getReady', 'guiding', 'exercise', 'rest'

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    timer?.cancel(); // Cancel any active timer
    player.stop();
    _tabController.dispose();

    super.dispose();
  }

  Future<void> _getCurrentVolume() async {
    try {
      double? volume = await FlutterVolumeController.getVolume();
      if (mounted) {
        setState(() {
          _currentVolume = volume ?? 0.5; // Set to default if null
        });
      }
    } catch (e) {
      print("Error getting volume: $e");
    }
  }

  void _setVolume(double volume) {
    print("Setting volume: $volume");
    setState(() {
      _currentVolume = volume; // Update slider immediately
    });
    FlutterVolumeController.setVolume(
        volume); // Update system volume asynchronously
  }

  Future<void> _showVolumeDialog() async {
    await _getCurrentVolume(); // Fetch the current volume before showing the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Volume Setting"),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min, // Compact dialog
                children: [
                  Text("Current Volume: ${(_currentVolume * 100).toInt()}%"),
                  Slider(
                    value: _currentVolume,
                    min: 0.0,
                    max: 1.0,
                    divisions: 10, // Optional: For finer control
                    label: "${(_currentVolume * 100).toInt()}%",
                    onChanged: (double newValue) {
                      print("Slider moved to: $newValue");
                      setState(() {
                        _currentVolume = newValue; // Update local dialog state
                      });
                      _setVolume(newValue); // Update system volume
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Finished"),
            ),
          ],
        );
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is in background
      setState(() {
        isPaused = true;
      });
      timer?.cancel(); // Stop the timer
      player.pause(); // Pause audio
    } else if (state == AppLifecycleState.resumed) {
      // App is in foreground
      setState(() {
        isPaused = false;
      });
      resumeTimer(); // Resume the timer
      player.resume(); // Resume audio
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addObserver(this);
    startPhase();
    print("${widget.day} is this");
    final guidebox = Hive.box("guideduration");
    final restbox = Hive.box("restduration");
    final exercise = Hive.box("exerciseduration");

    guideDuration = guidebox.get("guidetime");
    restDuration = restbox.get("resttime");
    exerciseDuration = exercise.get("exercisetime");
  }

  //guiding audio
  void playGuidingAudio() async {
    await player.play(
      AssetSource(widget.exerciseaudios[currentExerciseIndex]),
    );
  }

  void startPhase() {
    timer?.cancel(); // Cancel any active timer

    setState(() {
      // Determine timer duration and phase name
      switch (currentPhase) {
        case 'getReady':
          fixtiming = 5;
          timerSeconds = 5;
          player.stop();
          break;
        case 'guiding':
          fixtiming = guideDuration != null ? guideDuration! : 8;
          timerSeconds = guideDuration != null ? guideDuration! : 8;
          playGuidingAudio();

          break;
        case 'exercise':
          fixtiming = exerciseDuration != null ? exerciseDuration! : 30;
          timerSeconds = exerciseDuration != null ? exerciseDuration! : 30;
          player.stop();

          break;
        case 'rest':
          fixtiming = restDuration != null ? restDuration! : 5;
          timerSeconds = restDuration != null ? restDuration! : 5;
          player.stop();

          break;
      }
    });

    // Start the timer
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--;
        } else {
          timer.cancel();
          nextPhase();
        }
      });
    });
  }

  void nextPhase() {
    // Transition between phases
    switch (currentPhase) {
      case 'getReady':
        currentPhase = 'guiding';
        break;
      case 'guiding':
        currentPhase = 'exercise';
        break;
      case 'exercise':
        currentPhase = 'rest';
        break;
      case 'rest':
        if (currentExerciseIndex < widget.exercises.length - 1) {
          currentPhase = 'getReady';
          currentExerciseIndex++;
        } else {
          // All exercises completed
          _addName(widget.workoutName, widget.img);
          if (widget.ischallenge) {
            _addDay(widget.day);
          }
          player.stop();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => AchievementScreen(
                        exerciseLength: widget.exercises.length.toString(),
                        duration: widget.duration,
                        calories: widget.calories,
                        ischallenge: widget.ischallenge,
                        days: widget.day,
                        challengeName: widget.ChallengeName,
                      )));
          /*  Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => AchievementScreen(
                  workoutName: widget.workoutName,
                  duration: 5,
                  caloriesBurned: 500),
            ),
                (Route<dynamic> route) => false,
          );*/
          return;
        }
        break;
    }

    startPhase(); // Start the next phase
  }

  //pause timer
  // Tracks whether the timer is paused

  void toggleTimer() {
    setState(() {
      if (isPaused) {
        // Resume the timer
        isPaused = false;

        resumeTimer();
        player.resume();
      } else {
        // Pause the timer
        isPaused = true;
        player.pause();
        timer?.cancel();
      }
    });
  }

  void resumeTimer() {
    if (timer != null && timer!.isActive) {
      return; // Prevent multiple timers
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--;
        } else {
          timer.cancel();
          nextPhase();
        }
      });
    });
  }

  //add name
  void _addName(String name, String img) {
    var box = Hive.box<Map<dynamic, dynamic>>('exercisehistory');
    box.add({'name': name, 'img': img});
    // box.close();
    setState(() {});
  }

  //add day///////////////////
  void _addDay(int days) {
    var box = Hive.box('days');

    box.put(widget.ChallengeName, days);
    // box.close();
    setState(() {});
  }

  ////////////////////////
  void addWorkoutHistory(
      {required String exerciseName,
      required String exerciseCalories,
      required String exerciseDate,
      required String exerciseDuration,
      required String exerciseimg}) {
    context.read<HistoryBloc>().add(HistoryaddEvenet(
        exercises: ExerciseHistoryModel(
            exerciseName: exerciseName,
            exerciseCalories: exerciseCalories,
            exerciseDate: exerciseDate,
            exerciseDuration: exerciseDuration,
            exerciseimg: exerciseimg)));
  }

  void addToFavourites(
      {required String exerciseName,
      required String exerciseDesc,
      required String exerciseGif,
      required String exerciseImg}) {
    context.read<FavouritesBloc>().add(AddFavouritesEvent(
            exercises: FavouriteExercisesModel(
          exerciseName: exerciseName,
          exerciseDesc: exerciseDesc,
          exerciseGif: exerciseGif,
          exerciseImg: exerciseImg,
        )));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          iconTheme: IconThemeData(
              weight: 40,
              color: Colors.black // Change the color of the back icon
              ),
          backgroundColor: Color(0xfff5f5f5),
          title: Text(
            currentPhase == 'getReady'
                ? 'Getting Ready'
                : currentPhase == 'guiding'
                    ? 'Guiding'
                    : currentPhase == 'rest'
                        ? 'Resting'
                        : widget.exercises[currentExerciseIndex],
            style: TextStyle(
                color: Color(0xff1e1e1e),
                fontSize: 21,
                wordSpacing: 1,
                fontWeight: FontWeight.w800),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _showVolumeDialog();
                },
                icon: Icon(
                  Icons.volume_down_rounded,
                  color: AppColors.secondaryolor,
                  size: 30,
                ))
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              currentPhase == 'getReady' || currentPhase == 'guiding'
                  ? Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            width: width * 0.9,
                            height: height * 0.14,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 30),
                                      //child: Image.asset(widget.img),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            widget.img,
                                          ),

                                          fit: BoxFit
                                              .contain, // Adjust this as needed
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            widget.exercises[
                                                currentExerciseIndex],
                                            style: TextStyle(
                                                color: Color(0xff1e1e1e),
                                                fontSize: isLandscape
                                                    ? width * 0.03
                                                    : width * 0.05,
                                                wordSpacing: 1,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Text(
                                            widget.short_description[
                                                currentExerciseIndex],
                                            style: TextStyle(
                                                color: Color(0xff1e1e1e),
                                                fontSize: isLandscape
                                                    ? width * 0.04
                                                    : width * 0.037,
                                                wordSpacing: 2,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Divider(
                            height: 3,
                            indent: 25,
                            endIndent: 25,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: height * 0.3,
                            child: Column(
                              children: [
                                Container(
                                  width: width * 0.9,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryolor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                  ),
                                  child: TabBar(
                                    isScrollable: false,
                                    controller: _tabController,
                                    indicator: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: AppColors.secondaryolor,
                                          width: 4,
                                        ),
                                      ),
                                      color: Colors.white,
                                    ),
                                    labelColor: AppColors.secondaryolor,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    unselectedLabelColor: Colors.white,
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: isLandscape
                                            ? width * 0.03
                                            : width * 0.033),
                                    unselectedLabelStyle:
                                        TextStyle(fontWeight: FontWeight.w500),
                                    tabs: [
                                      Tab(text: "INSTRUCTION"),
                                      Tab(text: "FOCUS AREA"),
                                      Tab(text: "NOT TO DO"),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  // Use Expanded to let the TabBarView take the remaining space properly
                                  child: Card(
                                    child: Container(
                                      width: width * 0.9,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        ),
                                      ),
                                      child: TabBarView(
                                        controller: _tabController,
                                        children: [
                                          SingleChildScrollView(
                                            // Make content scrollable
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                widget.instructions[
                                                    currentExerciseIndex],
                                                style: TextStyle(
                                                  color: Color(0xff4a4545),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            // Make content scrollable
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                widget.focuss_area[
                                                    currentExerciseIndex],
                                                style: TextStyle(
                                                  color: Color(0xff4a4545),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            // Make content scrollable
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                widget.not_to_do[
                                                    currentExerciseIndex],
                                                style: TextStyle(
                                                  color: Color(0xff4a4545),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: height * 0.44,
                      margin: EdgeInsets.only(bottom: height * 0.01),
                      //color: Colors.blue,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.exercisegifs[currentExerciseIndex],
                          fit: BoxFit.contain,
                          //height: height * 0.33,
                          width: width + 50,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.9,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "LET'S DO THIS!",
                        style: TextStyle(
                            fontSize:
                                isLandscape ? width * 0.04 : width * 0.054,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.exercises[currentExerciseIndex],
                        style: TextStyle(
                            fontSize: isLandscape ? width * 0.04 : width * 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: toggleTimer,
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  isPaused ? Icons.play_arrow : Icons.pause,
                                  size: 45,
                                  color: AppColors.secondaryolor,
                                )),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  //color: Colors.green[400],
                                  shape: BoxShape.circle,
                                ),
                                width: width * 0.3,
                                height: height * 0.14,
                                child: CircularProgressIndicator(
                                  value: timerSeconds.toDouble() / fixtiming,
                                  strokeWidth: 12.0,
                                  color: Colors.grey,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Text(
                                '${timerSeconds.toString()}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.07,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                nextPhase();
                                toggleTimer();
                                // player.stop();
                              },
                              child: Icon(
                                Icons.skip_next_rounded,
                                size: 55,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        "EXERCISE NUMBER",
                        style: TextStyle(
                            fontSize:
                                isLandscape ? width * 0.04 : width * 0.054,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Align(
                        // alignment: Alignment.topRight,
                        child: Text(
                          '${currentExerciseIndex + 1} / ${widget.exercises.length}',
                          style: TextStyle(
                              fontSize:
                                  isLandscape ? width * 0.04 : width * 0.065,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: height * 0.001),
                      InkWell(
                        onTap: () {
                          if (widget.exercises.isEmpty ||
                              widget.exerciseDetails.isEmpty ||
                              widget.exercisegifs.isEmpty) {
                            print(
                                "One or more lists are empty. Cannot add to favourites.");
                            return;
                          }
                          if (currentExerciseIndex < 0 ||
                              currentExerciseIndex >= widget.exercises.length) {
                            print(
                                "Invalid currentExerciseIndex: $currentExerciseIndex");
                            return;
                          }

                          print(widget.exercises[currentExerciseIndex]);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "${widget.exercises[currentExerciseIndex]} added to favourites")));
                          print("favourites added in databse");
                          addToFavourites(
                            exerciseName:
                                widget.exercises[currentExerciseIndex],
                            exerciseDesc:
                                widget.exerciseDetails[currentExerciseIndex],
                            exerciseGif:
                                widget.exercisegifs[currentExerciseIndex],
                            exerciseImg: widget.img,
                          );
                        },
                        child:
                            Icon(Icons.favorite, color: Colors.blue, size: 30),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              timer?.cancel();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  elevation: 11,
                  backgroundColor: Colors.white,
                  title: Text(
                    currentExerciseIndex + 1 == widget.exercises.length
                        ? 'Great job finishing your workout!'
                        : 'Work out Not Completed',
                    style: const TextStyle(color: Colors.green),
                  ),
                  content: Text(
                    currentExerciseIndex + 1 == widget.exercises.length
                        ? 'Great job finishing your workout!'
                        : 'Still want to exit workout?',
                    style: const TextStyle(color: Colors.black),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        player.stop();
                        addWorkoutHistory(
                            exerciseName: widget.workoutName,
                            exerciseCalories: widget.calories.toString(),
                            exerciseDate: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            exerciseDuration: widget.duration,
                            exerciseimg: widget.img);
                        _addName(widget.workoutName, widget.img);
                        if (widget.ischallenge) {
                          _addDay(widget.day);
                        }
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AchievementScreen(
                                      exerciseLength:
                                          widget.exercises.length.toString(),
                                      duration: widget.duration,
                                      calories: widget.calories,
                                      ischallenge: widget.ischallenge,
                                      days: widget.day,
                                      challengeName: widget.ChallengeName,
                                    )));
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Homepage()));
              },
              child: Container(
                alignment: Alignment.center,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: AppColors.secondaryolor,
                    borderRadius: BorderRadius.circular(10)),
                height: 60,
                child: Text(
                  "Finish",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
