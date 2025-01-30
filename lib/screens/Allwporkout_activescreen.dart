import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hive/hive.dart';
import 'dart:async';

import 'AchievementScreen.dart';

class ExerciseScreen extends StatefulWidget {
  final String exerciseName;
  final String exerciseGif;
  final String exerciseAudio;
  final int caloriesBurned;

  const ExerciseScreen({
    Key? key,
    required this.exerciseName,
    required this.exerciseGif,
    required this.exerciseAudio,
    required this.caloriesBurned,
  }) : super(key: key);

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  late AudioPlayer audioPlayer;
  bool isPaused = true; // Ensure the audio and timer are initially paused
  AudioPlayer player = AudioPlayer();
  int timerSeconds = 30; // Default duration
  Timer? timer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _loadDuration();
    _initializeAudio(); // Prepare the audio but don't play it
  }

  @override
  void dispose() {
    timer?.cancel();
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  void _loadDuration() async {
    var box = await Hive.openBox<int>('exerciseDurations');
    int? savedDuration = box.get(widget.exerciseName);
    setState(() {
      timerSeconds = savedDuration ?? 30; // Default to 30 if no saved value
    });
  }

  /// Save duration to Hive box
  void _saveDuration(int duration) async {
    var box = await Hive.openBox<int>('exerciseDurations');
    box.put(widget.exerciseName, duration);
  }

  /// Initialize audio but do not play it immediately
  void _initializeAudio() async {
    await audioPlayer.setSource(AssetSource(widget.exerciseAudio));
    audioPlayer.setReleaseMode(ReleaseMode.loop); // Set to loop when started
  }

  void startTimer() {
    if (timer != null && timer!.isActive) return;

    setState(() {
      isPaused = false;
      audioPlayer.resume(); // Start audio
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--;
        } else {
          timer.cancel();
          _finishWorkout();
        }
      });
    });
  }

  void stopTimer() {
    if (!isPaused) {
      setState(() {
        isPaused = true;
        audioPlayer.pause(); // Pause audio
        timer?.cancel(); // Stop timer
      });
    }
  }

  void _finishWorkout() {
    timer?.cancel();
    audioPlayer.stop(); // Stop audio
    player.stop();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Workout Complete!',
          style: TextStyle(color: Colors.green),
        ),
        content: Text(
          'You have burned ${widget.caloriesBurned} calories.',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
/*              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AchievementScreen(
                          workoutName: widget.exerciseName,
                          duration: 6,
                          caloriesBurned: widget.caloriesBurned)),
                      (Route<dynamic> route) => false);
            */},
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.exerciseName,
          style: TextStyle(
            fontSize: isLandscape ? width * 0.03 : width * 0.07,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.only(top: height*0.03),
        padding: EdgeInsets.only(top: height*0.01),
        child: Column(

          children: [
            Image.asset(
              widget.exerciseGif,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              'Timer: $timerSeconds seconds',
              style: TextStyle(
                fontSize: isLandscape ? width * 0.03 : width * 0.06,
                color: Colors.white,
              ),
            ),
            Slider(
              value: timerSeconds.toDouble(),
              min: 0,
              max: 120,
              divisions: 11,
              label: '$timerSeconds seconds',
              onChanged: (value) {
                setState(() {
                  timerSeconds = value.toInt();
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _saveDuration(timerSeconds);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Duration saved for ${widget.exerciseName}!')),
                );
              },
              child: const Text('Save Duration'),
            ),
            Container(
              width: width * 0.3,
              height: height * 0.2,
              decoration: BoxDecoration(
                color: Colors.green[400],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${timerSeconds.toString()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: startTimer,
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white, fontSize: width * 0.08),
                  ),
                ),
                InkWell(
                  onTap: stopTimer,
                  child: Text(
                    'Stop',
                    style: TextStyle(color: Colors.white, fontSize: width * 0.08),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

