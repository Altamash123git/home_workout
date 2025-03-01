import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_workout/HistroyBloc/history_bloc.dart';
import 'package:home_workout/demo_firebase.dart';
import 'package:home_workout/favourites_bloc/favourites_bloc.dart';
import 'package:home_workout/firebase_repo.dart';
import 'package:home_workout/screens/AchievementScreen.dart';
import 'package:home_workout/screens/Allworkout_page.dart';
import 'package:home_workout/screens/DashBoardPage.dart';
import 'package:home_workout/screens/HomePage.dart';

import 'package:home_workout/screens/New_Splash_Page.dart';
import 'package:home_workout/screens/ProfilePage.dart';
import 'package:home_workout/screens/Sign_in_page.dart';
import 'package:home_workout/screens/UserInfo.dart';
import 'package:home_workout/screens/WorkoutScreen.dart';
import 'package:home_workout/screens/allworkout_detailpage.dart';
import 'package:home_workout/screens/newsignin.dart';
import 'package:home_workout/screens/signin_code/google_login.dart';
import 'package:home_workout/screens/splash_screen.dart';
import 'package:home_workout/screens/welcome_page.dart';
import 'package:home_workout/userInfo/BMIPage.dart';
import 'package:home_workout/userInfo/UserData_bloc/Userbloc.dart';
import 'package:home_workout/userInfo/gender_page.dart';
import 'package:home_workout/userInfo/height_info.dart';
import 'package:home_workout/userInfo/weight_page.dart';
import 'package:home_workout/workout_databse.dart';
//import 'package:timezone/data/latest.dart' as tz;

import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Restrict to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  // Initialize Hive
  await Hive.initFlutter();

  // Open the box for storing weight data
  var ne = await Hive.openBox<Map<dynamic, dynamic>>('weights2');
  var ne1 = await Hive.openBox<Map<dynamic, dynamic>>('exercisehistory');
  var ne2 = await Hive.openBox<String>('username');
  var ne3 = await Hive.openBox('days');

  var workoutduration = await Hive.openBox("workouttime");
  await Hive.openBox("newdays");
  await Hive.openBox("userProfile");
  await Hive.openBox("restduration");
  await Hive.openBox("guideduration");
  await Hive.openBox("exerciseduration");

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavouritesBloc(dbHelper: DBHelper.getinstance())),
        BlocProvider(create: (context) => HistoryBloc(dbHelper: DBHelper.getinstance())),
        BlocProvider<UserBloc>(create: (context) => UserBloc(userRepository: UserRepository())),
      ],
      child:  MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily:"Akshar" ,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white, // Set your desired color
          ),
        ),
      ),
      home:NewSplashPage() ,
    );
  }
}

