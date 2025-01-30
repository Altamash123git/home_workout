import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:home_workout/UTILS/appcolors.dart';
import 'package:home_workout/UTILS/textdecoration.dart';
import 'package:home_workout/models/chalenges.dart';
import 'package:home_workout/models/workout_model.dart';
import 'package:home_workout/screens/Workout_history.dart';
import 'package:home_workout/screens/challengesScreen.dart';
import 'package:home_workout/screens/new_profile_page.dart';
import 'package:home_workout/screens/signin_code/google_login.dart';
import 'package:home_workout/userInfo/UserData_bloc/userState.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_repo.dart';
import '../userInfo/UserData_bloc/Userbloc.dart';
import '../userInfo/UserData_bloc/userEvent.dart';
import 'Progress_page.dart';
import 'WorkoutScreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{
  double _currentVolume = 0.5;
  int _currentIndex=0;
  var daysFull;
  var daysUpper;
  var daysLower;
  var userName="";
  double exerciseDuration=30;
  double restDuration= 5;
  double guideDuration= 8;
  String uid = "";
  bool isActiveTab=false;
  int selectedidx=0;
  late TabController _tabController;
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
    getUid();
    _getCurrentVolume();
    final namebox = Hive.box('days');

    // Debugging Hive box
    print("All keys: ${namebox.keys}");
    print("All values: ${namebox.values}");

    final dayFullBody = namebox.get("Full Body");
    final daysUpperBody=namebox.get("Upper Body");
    final daysLowerBody=namebox.get("Lower Body");
    print("Retrieved day: $dayFullBody");
    print("Retrieved day: $daysUpperBody");
    print("Retrieved day: $daysLowerBody");

    setState(() {
      daysFull = dayFullBody ?? 0;
      daysUpper=daysUpperBody??0;
      daysLower=daysLowerBody??0;
    });


  }
  final guidebox=Hive.openBox("guideduration");
  final restbox=  Hive.openBox("restduration");
  final exercise= Hive.openBox("exerciseduration");
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> getUid() async {
    var prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("uid") ?? "";
    print(" uid : ${uid}");

    setState(() {});
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
    FlutterVolumeController.setVolume(volume); // Update system volume asynchronously
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
                    activeColor: AppColors.secondaryolor,
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
             style:TextButton.styleFrom(
               backgroundColor: AppColors.secondaryolor
             ),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Finished",style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }

void TimerDialogue({required double width}){
    showDialog(context: context, builder: (BuildContext context){
      return Container(
        color: Colors.white.withOpacity(0.4),
        child: AlertDialog(
          elevation: 11,
          shadowColor: Colors.black,
        
        
          title: Column(
            children: [
              Icon(Icons.watch_later_rounded,color: AppColors.secondaryolor,size: 29,),
              Text("Time managment",style: DrawerTextStyle(),),
            ],
          ),
          content: Container(
            //color: Colors.blue,
            width: width*0.8,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Compact dialog
                  children: [
                    Text("Exercise Duration",textAlign: TextAlign.start,style: DrawerTextStyle()),
                    Column(
                      children: [
                        Text("${exerciseDuration.toInt()} seconds", textAlign: TextAlign.center, style: DrawerTextStyle()),
                        Slider(
                          activeColor: AppColors.secondaryolor,
                          value: exerciseDuration,
                          min: 5.0, // Keep the min value as-is
                          max: 100.0, // Max value as-is
                          divisions: (100 - 5), // Ensure each division corresponds to 1 unit
                          label: "${exerciseDuration.toInt()}",
                          onChanged: (double newValue) {
                            setState(() {
                              exerciseDuration = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Rest Duration", textAlign: TextAlign.start, style: DrawerTextStyle()),
                    Column(
                      children: [
                        Text("${restDuration.toInt()} seconds", textAlign: TextAlign.center, style: DrawerTextStyle()),
                        Slider(
                          activeColor: AppColors.secondaryolor,
                          value: restDuration,
                          min: 5.0, // Keep the min value as-is
                          max: 100.0, // Max value as-is
                          divisions: (100 - 5), // Ensure each division corresponds to 1 unit
                          label: "${restDuration.toInt()}",
                          onChanged: (double newValue) {
                            setState(() {
                              restDuration = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    Text("Guide Duration", textAlign: TextAlign.start, style: DrawerTextStyle()),
                    Column(
                      children: [
                        Text("${guideDuration.toInt()} seconds", textAlign: TextAlign.center, style: DrawerTextStyle()),
                        Slider(
                          activeColor: AppColors.secondaryolor,
                          value: guideDuration,
                          min: 8.0, // Keep the min value as-is
                          max: 100.0, // Max value as-is
                          divisions: (100 - 8), // Ensure each division corresponds to 1 unit
                          label: "${guideDuration.toInt()}",
                          onChanged: (double newValue) {
                            setState(() {
                              guideDuration = newValue;
                            });
                          },
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0, // Elevation effect
                                    offset: Offset(0, 3),

                                  ),
                                ],
                              borderRadius: BorderRadius.circular(7),
                              color: AppColors.secondaryolor
                            ),
                            width: 70,
                            height: 30,
                            child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),

                          ),
                        ),
                        InkWell(
        
                          onTap: (){
        
                            final guidebox =Hive.box("guideduration");
                            final restbox=  Hive.box("restduration");
                            final exercise= Hive.box("exerciseduration");
        
                            guidebox.put("guidetime", guideDuration);
                            restbox.put("resttime", restDuration);
                            exercise.put("exercisetime", exerciseDuration);
        
                            //guidebox.put("",);
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0, // Elevation effect
                                    offset: Offset(0, 3),
        
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(7),
                                color: AppColors.secondaryolor
                            ),
                            width: 70,
                            height: 30,
                            child: Text("Set",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
        
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
}



  bool isProfilePicSelected = false;
  static File? imgfile;
  XFile? imgPicked;
  bool isCamera = false;
  @override
  Widget build(BuildContext context) {
    final box= Hive.box("userProfile");
    final imgPath= box.get("ProfileImage") as String?;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    bool IsLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar:
      AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0,bottom: 4),
          child:
          Stack(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1,color: Colors.white)
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                      0.0), // Border thickness
                  child: CircleAvatar(
                    radius:
                    45, // Inner avatar size

                    backgroundImage: imgPath != null
                        ? FileImage(File(imgPath!))
                        : AssetImage("assets/images/fullbody2.jpeg"),

                    backgroundColor: AppColors.secondaryolor,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),

                ),
              ),
            ],
          ),
        ),
        title:
        uid.isEmpty
            ? Container(
          child: CircularProgressIndicator(),
        )
            :
        BlocProvider(
        create: (context) =>
    UserBloc(userRepository: UserRepository())
    ..add(FetchCompleteUserData(uid)),
        child:
        BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                var data= state.userData;
                userName=state.userData['name'] ??
                    'User';

                final name = state.userData['name'] ??
                    'User';
                var BMI= state.userData["BMI"];

                return
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back...!",style:  TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Color(0xffffffff)),),
                      Text("${name},Ready for today's workout",style:  TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xffffffff)),)
                    ],
                  ) ;
              } else if (state is UserLoading) {
                return Text('Loading...');
              } else {
                return Text('Error loading user',style: TextStyle(color: Colors.white),);
              }
            }),),


      backgroundColor:AppColors.secondaryolor,
      ),
      endDrawer: Padding(
        padding: const EdgeInsets.all(0.0),
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Drawer(
            backgroundColor: AppColors.secondaryolor,
              width: width * 0.8,


              //backgroundColor:Colors.black,
              child: Column(
                children: [
                  Container(

                    height:height*0.04, // Match the top padding (e.g., status bar)
                    color: AppColors.secondaryolor,
                    child:  Padding(
                      padding: const EdgeInsets.only(top: 29.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Homepage()));
                          }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: Colors.white,))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        uid.isEmpty
                            ? Container(
                                child: CircularProgressIndicator(),
                              )
                            :
                        Container(
          color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 110,
                                      child: DrawerHeader(
                                        decoration: BoxDecoration(
                                          color: AppColors.secondaryolor,

                                        ),
                                        child:
                                        Column(
                                          children: [

                                            BlocProvider(
                                            create: (context) =>
                                            UserBloc(userRepository: UserRepository())
                                              ..add(FetchCompleteUserData(uid)),
                                            child: Column(
                                              children: [
                                                BlocBuilder<UserBloc, UserState>(
                                                    builder: (context, state) {
                                                      if (state is UserLoaded) {
                                                        var data= state.userData;
                                                        userName=state.userData['name'] ??
                                                            'User';

                                                        final name = state.userData['name'] ??
                                                            'User';
                                                        var BMI= state.userData["BMI"];

                                                        return
                                                          Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [

                                                            Stack(
                                                              children: [
                                                                Container(
                                                                  width: 70,
                                                                  height: 70,
                                                                  decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                   border: Border.all(width: 2,color: Colors.white)
                                                                  ),
                                                                  child: Padding(
                                                                    padding: EdgeInsets.all(
                                                                        0.0), // Border thickness
                                                                    child: CircleAvatar(
                                                                      radius:
                                                                      45, // Inner avatar size

                                                                      backgroundImage: imgPath != null
                                                                    ? FileImage(File(imgPath!))
                                                                : AssetImage("assets/images/fullbody2.jpeg"),

                                                                      backgroundColor: AppColors.secondaryolor,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  bottom: 0,
                                                                  right: 10,
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      shape: BoxShape.circle,
                                                                      color: Colors.white,
                                                                    ),
                                                                    child: GestureDetector(
                                                                      onTap: () {
                                                                        showModalBottomSheet(
                                                                          //isDismissible: false,
                                                                          //enableDrag: false,
                                                                            context: context,
                                                                            builder: (_) {
                                                                              return ShowModalBottom();
                                                                            });
                                                                      },
                                                                      child: Icon(
                                                                        Icons.edit,
                                                                        color: Colors.blue,
                                                                        size: 20,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),

                                                            Column(
                                                              children: [
                                                                Text("$name",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700,color: Color(0xffffffff)),),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text(" BMI: ${data["BMI"]??"N/A"}",style:
                                                                    TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Color(0xffffffff)),),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0),
                                                                      child: Text("|",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,color: Color(0xffffffff)),),
                                                                    ),
                                                                    Text(" Weight :${data["weight"]??"N/A"}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Color(0xffffffff)),),

                                                                  ],
                                                                )

                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            )
                                                          ]);
                                                      } else if (state is UserLoading) {
                                                        return Text('Loading...');
                                                      } else {
                                                        return Text('App Title');
                                                      }
                                                    })
                                              ],
                                            ),
                                                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0,left: 15),
                                      child: Text("Settings",style: DrawerTextStyle(mfontSize: 20.0),textAlign: TextAlign.start,),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade,child: NewProfilePage()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: ListTile(
                                          title:Text("User Data",style: DrawerTextStyle(),),
                                          leading: CircleAvatar(

                                            backgroundColor: AppColors.secondaryolor,
                                            child: Icon(Icons.person,color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ListTile(
                                        title:Text("Favourite Workout",style: DrawerTextStyle(),),
                                        leading: CircleAvatar(

                                          backgroundColor: AppColors.secondaryolor,
                                          child: Icon(FontAwesomeIcons.heart,color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: ListTile(
                                        title:Text("Schedule Workout",style: DrawerTextStyle(),),
                                        leading: CircleAvatar(

                                          backgroundColor: AppColors.secondaryolor,
                                          child: Icon(Icons.calendar_month,color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          TimerDialogue(width: width);
                                        },
                                        child: ListTile(
                                          title:Text("Time Managment",style: DrawerTextStyle(),),
                                          leading: CircleAvatar(

                                            backgroundColor: AppColors.secondaryolor,
                                            child: Icon(Icons.watch_later_sharp,color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ListTile(
                                        title:Text("Restart Workout",style: DrawerTextStyle(),),
                                        leading: CircleAvatar(

                                          backgroundColor: AppColors.secondaryolor,
                                          child: Icon(Icons.fitness_center,color: Colors.white,),
                                        ),
                                      ),
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: GestureDetector(
                                        onTap: (){
                                        //  Navigator.pop(context);
                                          _showVolumeDialog();
                                        },
                                        child: ListTile(
                                          title:Text("Volume",style: DrawerTextStyle(),),
                                          leading: CircleAvatar(

                                            backgroundColor: AppColors.secondaryolor,
                                            child: Icon(Icons.volume_down_rounded,color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>WorkoutHistory()));
                                        },
                                        child: ListTile(
                                          title:Text(" Workout History",style: DrawerTextStyle(),),
                                          leading: CircleAvatar(

                                            backgroundColor: AppColors.secondaryolor,
                                            child: Icon(Icons.history,color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ListTile(
                                        title:Text("Log Out",style: DrawerTextStyle(),),
                                        leading: CircleAvatar(

                                          backgroundColor: AppColors.secondaryolor,
                                          child: InkWell(
                                              onTap: ()async{
                                                var prefs=await SharedPreferences.getInstance();
                                                prefs.setBool('isLoggedIn', false);
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NewLoginPage()));
                                              },
                                              child: Icon(Icons.exit_to_app,color: Colors.white,)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      height: 2,
                                      indent: 20,
                                      endIndent: 20,
                                      color: Colors.black45,

                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          //  Navigator.pop(context);
                                          _showVolumeDialog();
                                        },
                                        child: ListTile(
                                          title:Text("More Apps",style: DrawerTextStyle(),),
                                          leading: Icon(Icons.window,color: AppColors.secondaryolor,size: 30,),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>WorkoutHistory()));
                                        },
                                        child: ListTile(
                                          title:Text(" Rate Us"),
                                          leading: Icon(Icons.thumb_up,color: AppColors.secondaryolor,size: 30,),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ListTile(
                                        title:Text("Log Out",style: DrawerTextStyle(),),
                                        leading: CircleAvatar(

                                          backgroundColor: AppColors.secondaryolor,
                                          child: InkWell(
                                              onTap: ()async{
                                                var prefs=await SharedPreferences.getInstance();
                                                prefs.setBool('isLoggedIn', false);
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NewLoginPage()));
                                              },
                                              child: Icon(Icons.exit_to_app,color: Colors.white,)),
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: FadeInLeft(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Popular Exercises",
                    style: HomeTextStyle(
                        mfontSize: isLandscape?width*0.04:width*0.054
                    )
                    //TextStyle(fontSize: width * 0.06, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Container(
                  height: height*0.21,
                  child: CarouselSlider(
                    items: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Challengesscreen( isChallenge: false,workout: workoutlist[0], days: 0, challengename: '',),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: PopularExercise(
                          motivation: 'Abs are made in the gym but revealed in the kitchen—commit to both!.',
                  exerciseNumber: workoutlist[0].exercises,
                            height: isLandscape?height*0.5:height * 0.32,
                            workoutDays: "5",
                            workoutName: "Six Pack",
                            img: "assets/images/sixpack2.jpeg",
                            width: width * 0.3, workoutDuration: '5',),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Challengesscreen( isChallenge: false,workout: workoutlist[1], days: 0, challengename: '',),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: PopularExercise(
                            exerciseNumber: workoutlist[1].exercises,
                          motivation: "Strong arms build a strong foundation—lift, push, and grow!.",
                            workoutDuration: '5',
                            img: "assets/images/arms2.jpeg",
                            height:isLandscape?height*0.5:height * 0.32,
                            workoutDays: "5",
                            workoutName: "Arms",
                            width: width * 0.3),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Challengesscreen( isChallenge: false,workout: workoutlist[2],days: 0, challengename: '',),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: PopularExercise(
                            exerciseNumber: workoutlist[2].exercises,
                          motivation:"A powerful chest is built one rep at a time—push through!." ,
                            workoutDuration: '5',
                            img: "assets/images/chest2.jpeg",
                            height: isLandscape?height*0.5:height * 0.32,
                            workoutDays: "5",
                            workoutName: "Chest",
                            width: width * 0.3),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Challengesscreen( workout:  workoutlist[3], isChallenge: false, days: 0, challengename: '',),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: PopularExercise(
                            exerciseNumber: workoutlist[3].exercises,
                          motivation:"Strong legs, strong body—don’t skip leg day!" ,
                            workoutDuration: '5',
                            img: "assets/images/legs2.jpeg",
                            height: isLandscape?height*0.5:height * 0.32,
                            workoutDays: "5",
                            workoutName: "Legs",
                            width: width * 0.3),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child:Challengesscreen(workout:  workoutlist[4], isChallenge: false,days: 0, challengename: '',),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: PopularExercise(
                            exerciseNumber: workoutlist[4].exercises,
                          motivation: "One workout, countless gains—go full body, go all in!",
                            workoutDuration: '5',
                            img: "assets/images/fullbody2.jpeg",
                            height: isLandscape?height*0.5:height * 0.32,
                            workoutDays: "7",
                            workoutName: "Full Body ",
                            width: width * 0.3),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Challengesscreen( isChallenge: false,workout: workoutlist[5], days: 0, challengename: '',),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: PopularExercise(
                            exerciseNumber: workoutlist[5].exercises,
                          motivation: "Run your race—fast, strong, and unstoppable!",
                            workoutDuration: '5',
                            img: "assets/images/shoulder.jpg",
                            height:isLandscape?height*0.7:height * 0.3,
                            workoutDays: "8",
                            workoutName: "Cardio Blast",
                            width: width * 0.3),
                      ),

                    ], options:
                  CarouselOptions(
                    height: height*0.2,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.7,
                    onPageChanged:(index, reason) {
                      setState(() {
                        _currentIndex = index; // Update current index
                      });
                    },
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  ),


                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    // Generate dots based on the number of items
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.only(top: 0.0, left: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? AppColors.secondaryolor // Active dot color
                              : Colors.grey, // Inactive dot color
                        ),
                      ),
                    );
                  }),
                ),

                SizedBox(
                  height: height*0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,bottom: 4),
                  child: Text("28 Days Workout Challenge",style: HomeTextStyle(
                    mfontSize: isLandscape?width*0.04:width*0.054
                  ),),
                ),
                SizedBox(height: 6,),
                Divider(
                  height: 2,
                  color: Colors.grey,
                  indent: 7,
                  endIndent: 8,
                ),
                SizedBox(height: 6,),

                Card(
                  elevation: 4,
                  child: Column(
                    children: [

                      Container(
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                            color: AppColors.secondaryolor,

                        ),
                        //margin: EdgeInsets.symmetric(horizontal: 20),

                         // Background for the tab bar
                        child: TabBar(
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.red, width: 4,), // Red line under the selected tab
                            ),
                            color: Colors.white, // Background color for the selected tab
                            //borderRadius: BorderRadius.only(topLeft: Radius.circular(8)), // Rounded corners for the indicator
                          ),
                          labelColor: AppColors.secondaryolor, // Text color of selected tab
                          unselectedLabelColor: Colors.white, // Text color of unselected tabs
                          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: isLandscape?width*0.03:width*0.04),
                          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                          tabs: [
                            Tab(text: "Full Body"),
                            Tab(text: "Upper Body"),
                            Tab(text: "Lower Body"),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),

                          ),

                          height: height*0.23,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              // Content for each tab
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child:

                                            daysFull==0?
                                            Challengesscreen(
                                                workout: workoutlist[4],
                                                isChallenge: true, days: daysFull, challengename: 'Full Body',): WorkoutChallengePage(workout: workoutlist[4],
                                              challenge: challengelist[5],daysCompleted: daysFull,workoutName: "Full Body",),
                                            type: PageTransitionType.leftToRight));
                                  },
                                  child: ChallengesContainer(
                                    Days: daysFull,
                                    height: height * 0.4,
                                    width: width ,
                                    img: "assets/images/fullbody2.jpeg",
                                    workout: "Full Body",
                                    motivation: "Success is earned, not given. Make each workout count and build the body you deserve!",)),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child:
                                            daysUpper==0?     Challengesscreen(
                                                workout: workoutlist[6],
                                              isChallenge: true, days: daysUpper, challengename: 'Upper Body',):WorkoutChallengePage(workout: workoutlist[6],
                                              challenge: challengelist[7],daysCompleted: daysFull,workoutName: "Upper Body",),
                                            type: PageTransitionType.leftToRight));
                                  },
                                  child: ChallengesContainer( Days: daysUpper, height: height*0.4, width: width*0.85, img: "assets/images/cardioblast.jpeg", workout: "Upper Body",motivation: "Every rep gets you closer to your goal. Keep going, you’re stronger than you think!" ,
                                  )),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child:
                                            daysLower==0?  Challengesscreen(
                                                workout: workoutlist[7],
                                              isChallenge: true, days: daysLower, challengename: 'Lower Body',):WorkoutChallengePage( workout: workoutlist[7],
                                              challenge: challengelist[8],daysCompleted: daysLower,workoutName: "Lower Body",),
                                            type: PageTransitionType.leftToRight));
                                  },
                                  child: ChallengesContainer(
                                    Days: daysLower,
                                    height: height*0.3, width: width*0.85, img: "", workout: "Lower Body",motivation: "Push yourself today, and see the results tomorrow. Strength starts with your commitment.",))


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Body Focus workouts",
                    style: HomeTextStyle(
                        mfontSize: isLandscape?width*0.04:width*0.054
                    ),
                  ),
                ),
                SizedBox(height: 6,),
                Divider(
                  height: 2,
                  color: Colors.grey,
                  indent: 7,
                  endIndent: 8,
                ),
                SizedBox(height: 6,),


              Container(
               // color: Colors.black,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8)
                ),
                height: (height * 0.4 * 4), // Adjust height based on item count
                child: ListView(
                  primary: true,
                  //physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemExtent: 150,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: Challengesscreen( isChallenge: false,workout: workoutlist[0],days: 0, challengename: '',),
                            type: PageTransitionType.leftToRight,
                          ),
                        );
                      },
                      child: PopularExercise(
                        exerciseNumber: workoutlist[0].exercises,
                        motivation:
                        'Abs are made in the gym but revealed in the kitchen—commit to both!',
                        height: height * 0.3,
                        workoutDays: "5",
                        workoutName: "Six Pack",
                        img: "assets/images/sixpack2.jpeg",
                        width: width * 0.3,
                        workoutDuration: '5',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: Challengesscreen( isChallenge: false,workout: workoutlist[1], days: 0, challengename: '',),
                            type: PageTransitionType.leftToRight,
                          ),
                        );
                      },
                      child:
                      PopularExercise(
                        exerciseNumber: workoutlist[1].exercises,
                        motivation:
                        "Strong arms build a strong foundation—lift, push, and grow!",
                        workoutDuration: '5',
                        img: "assets/images/arms2.jpeg",
                        height: height * 0.3,
                        workoutDays: "5",
                        workoutName: "Arms",
                        width: width * 0.3,
                      ),
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

  void getimg(bool camera) async {
    if (camera) {
      imgPicked = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      imgPicked = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    imgCrooper();
    if (imgPicked != null) {
      final box = Hive.box("userProfile");
      box.put("ProfileImage", imgPicked!.path);
      setState(() {});
      // Provider.of<taskprovider>(context,listen: false).setImage(File(imgPicked!.path));
    }
  }

  Widget ShowModalBottom() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              isCamera = true;
              getimg(isCamera);

            },
            child: Text("Open Camera")),
        ElevatedButton(
            onPressed: () {
              isCamera = false;
              getimg(isCamera);


            },
            child: Text("Open Gallery"))
      ]),
    );
  }

  void imgCrooper() async {
    if (imgPicked != null) {
      CroppedFile? croppedFile = await ImageCropper()
          .cropImage(sourcePath: imgPicked!.path, uiSettings: [
        AndroidUiSettings(
            toolbarTitle: "Cropper",
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
            ]),
        IOSUiSettings(title: "Cropper", aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square
        ]),
        WebUiSettings(context: context),
      ]);
      if (croppedFile != null) {
        imgfile = File(croppedFile.path);

        setState(() {});
      }
    }
  }
}

class ChallengesContainer extends StatelessWidget {
  ChallengesContainer({
    required this.height,
    required this.width,
    required this.img,
    required this.workout,
    required this.motivation,
    required this.Days

  });
  final double height;
  final double width;
  final String img;
  final String workout;
 final String motivation;
 final int Days;

  @override
  Widget build(BuildContext context) {
    bool IsLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Container(
      padding: EdgeInsets.only(right: width * 0.05),
      //margin: EdgeInsets.only(right: width * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * 0.03),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover, // Adjust this as needed
                  ),
                ),
                //child: Image.asset(img,fit: BoxFit.contain,),
                //height: height * 0.4, // Ensure the image container takes up the height
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "28 DAYS ",
                          
                          style: TextStyle(
                            fontSize: IsLandscape?width*0.03:width*0.07,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff4a4545),
                          )),
                      TextSpan(
                          text: "${workout}   ",
                          style:
                          TextStyle(
                            color: AppColors.secondaryolor,
                            fontSize: IsLandscape?width*0.03:width*0.06,
                            fontWeight: FontWeight.w700,
                          ),     )
                    ])),
                  ),
                  Text(
                    "CHALLENGE...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.secondaryolor,
                      fontSize:  IsLandscape?width*0.03:width*0.06,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(motivation,style:
                  TextStyle(
                    fontSize:  IsLandscape?width*0.03:width*0.04,
                    color: Color(0xff4a4545),
                    fontWeight: FontWeight.w700
                  ),textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),


                Container(
        padding:EdgeInsets.symmetric(horizontal: 10),
                  margin:EdgeInsets.symmetric(horizontal: 10) ,

                  alignment: Alignment.center,
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0, // Elevation effect
                        offset: Offset(0, 3),

                      ),
                    ],
                    color: AppColors.secondaryolor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text( Days==0?"ACCEPT CHALLENGE ":"Continue",style: TextStyle(fontSize:IsLandscape?width*0.03:width*0.04,color: Colors.white,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PopularExercise extends StatefulWidget {
  PopularExercise(
      {required this.height,
      required this.workoutDays,
      required this.workoutName,
      required this.width,
      required this.img,
      required this.workoutDuration,
        required this.motivation,
        required this.exerciseNumber,
      });
  final double height;
  final double width;
  final String workoutName;
  final String workoutDays;
  final String img;
  final String workoutDuration;
  final String motivation;
  final String exerciseNumber;

  @override
  State<PopularExercise> createState() => _PopularExerciseState();
}

class _PopularExerciseState extends State<PopularExercise> {
  @override
  Widget build(BuildContext context) {
    bool IsLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    // TODO: implement build
    return

      Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      decoration: BoxDecoration(
        border:Border.all(
          width: 1,
          color: Colors.transparent
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6.0, // Elevation effect
            offset: Offset(0, 3),

          ),
        ],

        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          Color(0xffE5EEF5),
          Color(0xffffffff),
        ]),

        color: Colors.white,
        //border: Border.all(width: 2,),
       /* image: DecorationImage(
            image: AssetImage(widget.img), fit: BoxFit.cover, opacity: 0.6),*/
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              elevation: 15,
              //shadowColor: Colors.grey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: Colors.transparent
                  ),

                  image: DecorationImage(
                    image: AssetImage(widget.img,),


                    fit: BoxFit.cover, // Adjust this as needed
                  ),
                ),
                //child: Image.asset(img,fit: BoxFit.contain,),
                height: widget.height,
              ),

            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Flexible(
                  child: Text(
                    widget.workoutName,
                    style: TextStyle(fontSize: IsLandscape?widget.width*0.03:widget.height*0.06, color: AppColors.secondaryolor,fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis, // Prevents text from overflowing
                  ),
                ),   Flexible(
                  child: Text(
                    widget.motivation,
                    style: TextStyle(fontSize: IsLandscape?widget.width*0.03:widget.height*0.04, color: Color(0xff4a4545)),
                    textAlign: TextAlign.center,
                    maxLines: 2, // Limit the number of lines to prevent overflow
                    overflow: TextOverflow.ellipsis,
                  ),
                ),   SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(children: [
                      Icon(FontAwesomeIcons.clock,color: AppColors.secondaryolor,size: 17,),
                      SizedBox(width: 8,),
                      Text("${widget.workoutDuration} minutes",style: TextStyle(fontSize: IsLandscape?widget.width*0.03:widget.height*0.04,fontWeight: FontWeight.w700,color: Color(0xff4a4545)),)
                    ],),

                    Row(
                      children: [
                        Icon(Icons.fitness_center,color: AppColors.secondaryolor,size: 17,),
                        SizedBox(width: 8,),
                        Text("${widget.exerciseNumber} Exercise",style: TextStyle(fontSize: IsLandscape?widget.width*0.03:widget.height*0.04,fontWeight: FontWeight.w700,color: Color(0xff4a4545)),)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 30,
                    //height: widget.height*0.11,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0, // Elevation effect
                          offset: Offset(0, 3),

                        ),
                      ],
                      color: AppColors.secondaryolor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("START",style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

