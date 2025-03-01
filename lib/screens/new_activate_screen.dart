import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../HistroyBloc/history_bloc.dart';
import '../HistroyBloc/history_event.dart';
import '../UTILS/appcolors.dart';
import '../favourites_bloc/favourites_bloc.dart';
import '../favourites_bloc/favourites_event.dart';
import '../models/exercise_historymodel.dart';
import '../models/workout_model.dart';
import 'AchievementScreen.dart';
import 'HomePage.dart';

class ChallengesActiveScreen extends StatefulWidget {
  final String workoutName;
  final String img;
  final List<String> exerciseDetails;
  final String calories;
  final String duration;
  final List<String> exerciseImages;
  final int day;
  final String ChallengeName;
  final bool ischallenge;
  final List<WeekDataModel> weekwise;
  const ChallengesActiveScreen(
      {required this.weekwise,
      required this.ischallenge,
      required this.day,
      required this.ChallengeName,
      required this.workoutName,
      required this.calories,
      required this.duration,
      required this.img,
      required this.exerciseImages,
      required this.exerciseDetails});

  @override
  State<ChallengesActiveScreen> createState() => _ChallengesActiveScreenState();
}

class _ChallengesActiveScreenState extends State<ChallengesActiveScreen>
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
  int currentrecoveryindex = 0;
  Timer? timer;
  String exercisname = "";
  bool isFavourite=false;
  double fixtiming = 30;
  late TabController _tabController;
  int currentWarmUpPhaseIndex = 0;
  int challengesdays = 0;
  String Instructions = "";
  String Not_to_do = "";
  String focus_area = "";
  double timerSeconds = 30;
  final List<String> RecoveryWorkout = [
    "Arm Circles",
    "Leg Swings",
    "Hip Circles",
    "Child's Pose",
    "Cobra Pose",
    "Calves",
    "Cat-Cow Stretch",
    "Shoulder Stretch",
    "Head tilt",
    "Chest Stretch",
  ];
  final List<String> RecoveryGif = [
    'assets/exercises/jumping_jack.gif',
    'assets/exercises/mountain_climb.gif',
    'assets/exercises/pushups.gif',
    'assets/exercises/squats.gif',
    'assets/exercises/burpees.gif',
    'assets/exercises/jumping_jack.gif',
    'assets/exercises/mountain_climb.gif',
    'assets/exercises/pushups.gif',
    'assets/exercises/squats.gif',
    'assets/exercises/burpees.gif',
  ];
  final List<String> RecoveryAudio = [
    'audio/squats.mp3',
    'audio/lunges.mp3',
    'audio/forwardlunges.mp3',
    'audio/wallsquats.mp3',
    'audio/wallsquats.mp3',
    'audio/squats.mp3',
    'audio/lunges.mp3',
    'audio/forwardlunges.mp3',
    'audio/wallsquats.mp3',
    'audio/wallsquats.mp3',
  ];
  final List<String> RecoveryNotToDo = [
    "Avoid fast or jerky movements",
    "Do not hold your breath",
    "Avoid overstretching",
    "Do not lock your joints",
    "Avoid bouncing during stretches",
    "Do not rush through the exercises",
    "Avoid skipping warm-up or cool-down",
    "Do not ignore pain or discomfort",
    "Avoid slouching or poor posture",
    "Do not perform exercises on an uneven surface",
  ];

  final List<String> RecoveryInstructions = [
    "Perform each movement slowly and with control",
    "Breathe deeply and consistently",
    "Maintain proper form and alignment",
    "Hold each stretch for at least 15-30 seconds",
    "Engage your core to support your movements",
    "Relax your muscles while stretching",
    "Perform the exercises on a comfortable surface",
    "Repeat each movement as instructed",
    "Listen to your body and modify as needed",
    "Stay hydrated and take breaks if necessary",
  ];
  final List<Map<String, dynamic>> warmUpPhases = [
    {'phase': 'armCirclesForward', 'duration': 30.0},
    {'phase': 'armCirclesBackward', 'duration': 30.0},
    {'phase': 'legSwings', 'duration': 90.0}, // e.g. 10 swings per leg
    {
      'phase': 'jumpingJacks',
      'duration': 150.0
    }, // remaining time to fill 5 min
  ];
  final List<String> warmupGifList = [
    'assets/exercises/jumping_jack.gif',
    'assets/exercises/mountain_climb.gif',
    'assets/exercises/pushups.gif',
    'assets/exercises/squats.gif',
    'assets/exercises/plank_shoulder_taps.gif',
  ];

  final List<String> warmupAudioList = [
    'audio/jumpingjacks.mp3',
    'audio/mountainclimb.mp3',
    'audio/pushups.mp3',
    'audio/squats.mp3',
    'audio/shoulderplank.mp3',
  ];
  final List<String> RecoveryFocusArea = [
    "Shoulders and arms",
    "Legs and hips",
    "Lower back and spine",
    "Core stability",
    "Flexibility and mobility",
    "Posture correction",
    "Joint health",
    "Neck and upper back",
    "Balance and coordination",
    "Breathing techniques",
  ];

  String Challengesaudio = "";
  String exercisegif = "";
  String shortdesc = "";
  String currentPhase = 'warmUp';
  @override
  void initState() {
    super.initState();
    challengesdays = widget.day;
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addObserver(this);
    TabControllerData();
    setState(() {});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      TabControllerData();
    });
    startPhase();
    print("${widget.day} is this");

    final guidebox = Hive.box("guideduration");
    final restbox = Hive.box("restduration");
    final exercise = Hive.box("exerciseduration");

    guideDuration = guidebox.get("guidetime");
    restDuration = restbox.get("resttime");
    exerciseDuration = exercise.get("exercisetime");
  }

  bool isWarmupActive = true; // Flag to track warm-up state

  void warmupdata() {
    if (!isWarmupActive) return; // Exit if warm-up is skipped

    setState(() {
      exercisname = warmUpPhases[currentWarmUpPhaseIndex]["phase"];
      exercisegif = warmupGifList[currentWarmUpPhaseIndex];
    });
  }

// Function to skip warm-up and start the workout immediately
  void skipWarmup() {
    timer?.cancel(); // Stop the current warm-up timer

    setState(() {
      currentWarmUpPhaseIndex = 0; // Reset warm-up index
      currentPhase = 'getReady'; // Jump directly to "Get Ready" phase
    });

    startPhase(); // Start the "Get Ready" phase immediately
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    timer?.cancel(); // Cancel any active timer
    player.stop();
    _tabController.dispose();

    super.dispose();
  }

  bool isWarmUp() {
    return currentPhase == "warmUp";
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
  bool isRestDay() {
    if (widget.ChallengeName == "Upper Body" ||
        widget.ChallengeName == "Lower Body") {
      return false; // No rest days for these challenges
    }
    return challengesdays == 7 ||
        challengesdays == 14 ||
        challengesdays == 21 ||
        challengesdays == 28;
  }

  bool isRecoveryDay() {
    if (widget.ChallengeName == "Upper Body" ||
        widget.ChallengeName == "Lower Body") {
      return widget.day == 7 ||
          widget.day == 14 ||
          widget.day == 21 ||
          widget.day == 28 ||
          widget.day == 3 ||
          widget.day == 10 ||
          widget.day == 17 ||
          widget.day == 24;
    }
    return widget.day == 6 ||
        widget.day == 13 ||
        widget.day == 20 ||
        widget.day == 27;
  }

// ✅ New function that accepts a day parameter
  bool isRecoveryDayFor(int day) {
    if (widget.ChallengeName == "Upper Body" ||
        widget.ChallengeName == "Lower Body") {
      return day == 7 ||
          day == 14 ||
          day == 21 ||
          day == 28 ||
          day == 3 ||
          day == 10 ||
          day == 17 ||
          day == 24;
    }
    return day == 6 || day == 13 || day == 20 || day == 27;
  }

  int getValidWorkoutIndex(int challengeDay) {
    int validIndex = 0;
    for (int i = 1; i <= challengeDay; i++) {
      if (!isRecoveryDayFor(i)) {
        validIndex++;
      }
    }
    return validIndex - 1; // Adjust for 0-based index
  }

  void TabControllerData() {
    setState(() {
      if (isWarmUp()) {
        warmupdata();
      }

      print("Challenges Day: $challengesdays");
      print("Weekwise Data Length: ${widget.weekwise.length}");

      // ✅ Handle Upper Body & Lower Body Challenges
      if (widget.ChallengeName == "Upper Body" ||
          widget.ChallengeName == "Lower Body") {
        if (isRecoveryDayFor(challengesdays)) {
          print("Skipping workout, today is a recovery day.");
          assignRecoveryData(); // ✅ Assign recovery data properly
          return;
        }

        int index = getValidWorkoutIndex(challengesdays);
        if (index >= 0 && index < widget.weekwise.length) {
          assignData(index);
        } else {
          print("⚠ Invalid index for Upper/Lower Body challenge: $index");
        }
        return;
      }

      // ✅ Handle Other Challenges
      if (widget.weekwise.isNotEmpty) {
        if (challengesdays == 1 || challengesdays == 3 || challengesdays == 5) {
          assignData(0);
        } else if (challengesdays == 2 || challengesdays == 4) {
          assignData(1);
        } else if (challengesdays == 8 ||
            challengesdays == 10 ||
            challengesdays == 12) {
          assignData(2);
        } else if (challengesdays == 9 || challengesdays == 11) {
          assignData(3);
        } else if (challengesdays == 15 ||
            challengesdays == 17 ||
            challengesdays == 19) {
          assignData(4);
        } else if (challengesdays == 16 || challengesdays == 18) {
          assignData(5);
        } else if (challengesdays == 22 ||
            challengesdays == 24 ||
            challengesdays == 26) {
          assignData(6);
        } else if (challengesdays == 23 || challengesdays == 25) {
          assignData(7);
        } else if (isRecoveryDayFor(challengesdays)) {
          // ✅ Ensure recovery logic works
          assignRecoveryData();
        }
      } else {
        print("Error: widget.weekwise is empty!");
      }
    });
  }

  /*void warmupdata() {
    setState(() {});
    exercisname = warmUpPhases[currentWarmUpPhaseIndex]["phase"];
    exercisegif = warmupGifList[currentWarmUpPhaseIndex];
  }*/

// ✅ Updated assignData function
  void assignData(int index) {
    if (index >= 0 && index < widget.weekwise.length) {
      if (widget.weekwise[index].workoutlist.isNotEmpty &&
          currentExerciseIndex < widget.weekwise[index].workoutlist.length) {
        setState(() {
          exercisname =
              widget.weekwise[index].workoutlist[currentExerciseIndex];
          exercisegif = widget.weekwise[index]
              .exercisegiflist[currentExerciseIndex]; // ✅ Fix GIF Update
          Challengesaudio =
              widget.weekwise[index].exerciseaudiolist[currentExerciseIndex];
          focus_area = widget.weekwise[index].focus_areas[currentExerciseIndex];
          Not_to_do = widget.weekwise[index].not_to_do[currentExerciseIndex];
          Instructions =
              widget.weekwise[index].instructions[currentExerciseIndex];
          shortdesc = widget.weekwise[index].shortdesc[currentExerciseIndex];
        });

        print(
            "✅ Updated Exercise: $exercisname | GIF: $exercisegif"); // ✅ Debugging Log
      } else {
        print(
            "⚠ Invalid exercise index: $currentExerciseIndex for index: $index");
      }
    } else {
      print("⚠ Invalid weekwise index: $index");
    }
  }

// ✅ Updated assignRecoveryData function
  void assignRecoveryData() {
    setState(() {
      exercisname = RecoveryWorkout[currentrecoveryindex];
      exercisegif = RecoveryGif[currentrecoveryindex];
      Instructions = RecoveryInstructions[currentrecoveryindex];
      Not_to_do = RecoveryNotToDo[currentrecoveryindex];
      focus_area = RecoveryFocusArea[currentrecoveryindex];
      shortdesc = "";
    });
  }

// ✅ Updated playGuidingAudio function
  void playGuidingAudio() async {
    try {
      String audioPath;

      if (isRestDay()) {
        print("No audio on rest days!");
        return; // Prevent audio from playing
      }

      if (isWarmUp()) {
        if (warmupAudioList.isEmpty ||
            currentWarmUpPhaseIndex >= warmupAudioList.length) {
          print("⚠ Error: WarmupAudio list is empty or index out of range!");
          return;
        }
        audioPath = warmupAudioList[currentWarmUpPhaseIndex];
      } else if (isRecoveryDay()) {
        if (RecoveryAudio.isEmpty ||
            currentrecoveryindex >= RecoveryAudio.length) {
          print("⚠ Error: RecoveryAudio list is empty or index out of range!");
          return;
        }
        audioPath = RecoveryAudio[currentrecoveryindex];
      } else {
        int index =
            getValidWorkoutIndex(challengesdays); // ✅ Get valid workout index
        if (widget.weekwise.isEmpty ||
            widget.weekwise[index].exerciseaudiolist.isEmpty ||
            currentExerciseIndex >=
                widget.weekwise[index].exerciseaudiolist.length) {
          print("⚠ Error: exerciseaudiolist is empty or index out of range!");
          return;
        }
        audioPath = widget.weekwise[index]
            .exerciseaudiolist[currentExerciseIndex]; // ✅ Use correct index
      }

      print("🔊 Playing: assets/$audioPath");
      await player.play(AssetSource(audioPath));
    } catch (e) {
      print("❌ Error playing audio: $e");
    }
  }

  void startPhase() {
    timer?.cancel(); // Cancel any active timer

    setState(() {
      // Determine timer duration and phase name for normal phases.
      if (currentPhase == 'warmUp') {
        // Use the current warm-up sub-phase duration.
        fixtiming = warmUpPhases[currentWarmUpPhaseIndex]['duration'];
        timerSeconds = warmUpPhases[currentWarmUpPhaseIndex]['duration'];
        // Optionally, update UI or play specific warm-up audio here.
        //player.stop();
        playGuidingAudio();
      } else {
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
      }
    });

    // Start the timer.
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
    if (currentPhase == 'warmUp') {
      if (currentWarmUpPhaseIndex < warmUpPhases.length - 1) {
        currentWarmUpPhaseIndex++;
      } else {
        currentWarmUpPhaseIndex = 0;
        currentPhase = 'getReady';
      }
    } else {
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
          if (isRecoveryDay()) {
            if (currentrecoveryindex < RecoveryWorkout.length - 1) {
              currentPhase = 'getReady';
              currentrecoveryindex++;
            } else {
              _completeWorkout();
              return;
            }
          } else {
            if (currentExerciseIndex <
                widget.weekwise[0].workoutlist.length - 1) {
              currentExerciseIndex++; // ✅ Update Exercise Index
              currentPhase = 'getReady';
              assignData(
                  currentExerciseIndex); // ✅ Call assignData() to update Exercise Name & GIF
            } else {
              _completeWorkout();
              return;
            }
          }
          break;
      }
    }
    startPhase();
  }

  void _completeWorkout() {
    _addName(widget.workoutName, widget.img);
    if (widget.ischallenge) {
      _addDay(widget.day);
    }
    player.stop();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => AchievementScreen(
          exerciseLength: "5",
          duration: widget.duration,
          calories: widget.calories,
          ischallenge: widget.ischallenge,
          days: widget.day,
          challengeName: widget.ChallengeName,
        ),
      ),
    );
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

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isRestDay()
        ? SafeArea(
            child: Scaffold(
            body: Center(
              child: Container(
                height: height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Even warriors need a break!\n Enjoy your rest day and get ready to crush your next workout! ⚡🏆",
                      style: TextStyle(
                          color: Color(0xff454545),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/rest.jpg"),
                            fit: BoxFit.contain),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  timer?.cancel();
                  _addName(widget.workoutName, widget.img);
                  if (widget.ischallenge) {
                    _addDay(widget.day);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => Homepage()));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryolor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 60,
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ))
        : SafeArea(
            child: WillPopScope(
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
                backgroundColor: Color(0xfff5f5f5),
                appBar: AppBar(
                  iconTheme: IconThemeData(
                      weight: 40,
                      color: Colors.black // Change the color of the back icon
                      ),
                  backgroundColor: Color(0xfff5f5f5),
                  title: Text(
                    currentPhase == "warmUp"
                        ? "warming up"
                        : currentPhase == 'getReady'
                            ? 'Getting Ready'
                            : currentPhase == 'guiding'
                                ? 'Guiding'
                                : currentPhase == 'rest'
                                    ? 'Resting'
                                    : exercisname,
                    style: TextStyle(
                        color: Color(0xff1e1e1e),
                        fontSize: 21,
                        wordSpacing: 1,
                        fontWeight: FontWeight.w800),
                  ),
                  actions: [
                    isRecoveryDay() ? Text("recovery day") : Text(""),
                    isWarmUp()
                        ? IconButton(
                            onPressed: skipWarmup,
                            icon: Icon(
                              Icons.skip_next,
                              color: AppColors.secondaryolor,
                              size: 30,
                            ))
                        : Container(),
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
                      isWarmUp()
                          ? Container(
                              height: height * 0.44,
                              margin: EdgeInsets.only(bottom: height * 0.01),
                              //color: Colors.blue,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  warmupGifList[currentWarmUpPhaseIndex],
                                  fit: BoxFit.contain,
                                  //height: height * 0.33,
                                  width: width + 50,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            )
                          : currentPhase == 'getReady' ||
                                  currentPhase == 'guiding'
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
                                                  padding: EdgeInsets.only(
                                                      left: 20, top: 30),
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
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        exercisname == ""
                                                            ? "hlo"
                                                            : exercisname,
                                                        style: TextStyle(
                                                            color:
                                                                Color(0xff1e1e1e),
                                                            fontSize: isLandscape
                                                                ? width * 0.03
                                                                : width * 0.05,
                                                            wordSpacing: 1,
                                                            fontWeight:
                                                                FontWeight.w800),
                                                      ),
                                                      Text(
                                                        shortdesc,
                                                        style: TextStyle(
                                                            color:
                                                                Color(0xff1e1e1e),
                                                            fontSize: isLandscape
                                                                ? width * 0.04
                                                                : width * 0.037,
                                                            wordSpacing: 2,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                        textAlign:
                                                            TextAlign.start,
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
                                                      color:
                                                          AppColors.secondaryolor,
                                                      width: 4,
                                                    ),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                labelColor:
                                                    AppColors.secondaryolor,
                                                indicatorSize:
                                                    TabBarIndicatorSize.tab,
                                                unselectedLabelColor:
                                                    Colors.white,
                                                labelStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: isLandscape
                                                        ? width * 0.03
                                                        : width * 0.029),
                                                unselectedLabelStyle: TextStyle(
                                                    fontWeight: FontWeight.w500),
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
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffffffff),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: TabBarView(
                                                    controller: _tabController,
                                                    children: [
                                                      SingleChildScrollView(
                                                        // Make content scrollable
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            Instructions,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff4a4545),
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize: width * 0.037,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SingleChildScrollView(
                                                        // Make content scrollable
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            focus_area,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff4a4545),
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize: width * 0.037,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SingleChildScrollView(
                                                        // Make content scrollable
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            Not_to_do,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff4a4545),
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize:width * 0.037,
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
                                      exercisegif,
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
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "LET'S DO THIS!",
                                    style: TextStyle(
                                        fontSize: isLandscape
                                            ? width * 0.04
                                            : width * 0.054,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    isWarmUp()
                                        ? warmUpPhases[currentWarmUpPhaseIndex]
                                            ["phase"]
                                        : exercisname,
                                    style: TextStyle(
                                        fontSize:
                                            isLandscape ? width * 0.04 : width * 0.05,
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
                                              isPaused
                                                  ? Icons.play_arrow
                                                  : Icons.pause,
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
                                              value:
                                                  timerSeconds.toDouble() / fixtiming,
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
                                  Align(
                                    // alignment: Alignment.topRight,
                                    child: Text(
                                      isWarmUp()
                                          ? '${currentWarmUpPhaseIndex + 1} / ${warmUpPhases.length}'
                                          : isRecoveryDay()
                                              ? '${currentExerciseIndex + 1} / ${RecoveryWorkout.length}'
                                              : '${currentExerciseIndex + 1} / ${widget.weekwise[0].workoutlist.length}',
                                      style: TextStyle(
                                          fontSize: isLandscape
                                              ? width * 0.04
                                              : width * 0.065,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.001),

                                ],
                              ),
                              Positioned(
                                  right: 5,
                                  top: 0,
                                  child:  isWarmUp() || isRecoveryDay()
                                      ? Container()
                                      : InkWell(
                                    onTap: isWarmUp()
                                        ? () {}
                                        : isRecoveryDay()
                                        ? () {}
                                        : () {
                                      setState(() {
                                        isFavourite = !isFavourite; // Toggle state
                                      });
                                      /* if (widget.exercises.isEmpty ||
                                    widget.exerciseDetails.isEmpty ||
                                    widget.exercisegifs.isEmpty) {
                                  print(
                                      "One or more lists are empty. Cannot add to favourites.");
                                  return;
                                }*/
                                      if (currentExerciseIndex < 0 ||
                                          currentExerciseIndex >=
                                              widget
                                                  .weekwise[0]
                                                  .workoutlist
                                                  .length) {
                                        print(
                                            "Invalid currentExerciseIndex: $currentExerciseIndex");
                                        return;
                                      }

                                      // print(widget.exercises[currentExerciseIndex]);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          content: Text(
                                              "${exercisname} added to favourites")));
                                      print(
                                          "favourites added in databse");
                                      addToFavourites(
                                        exerciseName: exercisname,
                                        exerciseDesc:
                                        widget.exerciseDetails[
                                        currentExerciseIndex],
                                        exerciseGif: exercisegif,
                                        exerciseImg: widget.img,
                                      );
                                    },
                                    child: Icon(Icons.favorite,
                                        color:isFavourite? Colors.blue:Colors.white, size: 30),
                                  ))
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
                      player.stop();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          elevation: 11,
                          backgroundColor: Colors.white,
                          title: isRecoveryDay()
                              ? Text(
                                  currentrecoveryindex + 1 ==
                                          RecoveryWorkout.length
                                      ? 'Great job finishing your workout!'
                                      : 'Work out Not Completed',
                                )
                              : Text(
                                  currentExerciseIndex + 1 ==
                                          widget.weekwise[0].workoutlist.length
                                      ? 'Great job finishing your workout!'
                                      : 'Work out Not Completed',
                                  style: const TextStyle(color: Colors.green),
                                ),
                          content: isRecoveryDay()
                              ? Text(
                                  currentrecoveryindex + 1 ==
                                          RecoveryWorkout.length
                                      ? 'Great job finishing your workout!'
                                      : 'Still want to exit workout?',
                                )
                              : Text(
                                  currentExerciseIndex + 1 ==
                                          widget.weekwise[0].workoutlist.length
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
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AchievementScreen(
                                            exerciseLength:
                                                isRecoveryDay() ? "10" : "5",
                                            duration: widget.duration,
                                            calories: widget.calories,
                                            ischallenge: widget.ischallenge,
                                            days: widget.day,
                                            challengeName: widget.ChallengeName,
                                          )),
                                  (Route<dynamic> route) => false,
                                );
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
