import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_workout/screens/Workout_history.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UTILS/appcolors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController goalController = TextEditingController();

  String uid = "";
  String docId = ""; // For storing the document ID to update
  bool isUserCreated = false;
  bool isUpdate = false;
 double _BMI=0.0;
 var result;
  @override
  void initState() {
    super.initState();
    getUid();
  }

  Future<void> getUid() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString("uid") ?? "";
    });
  }


  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
    
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: uid.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
          children: [
            // User Info Stream
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: firestore.collection("users").doc(uid).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error: ${snapshot.error}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                if (snapshot.hasData && snapshot.data != null) {
                  var userData = snapshot.data!.data();
                  if (userData == null) {
                    return const Center(
                      child: Text(
                        "No user data found",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:EdgeInsets.only(top: height*0.02),
                          padding: EdgeInsets.all(width*0.02),
                          child: Row(
                            children: [
                              Expanded(
                                flex:2,
                                child: Text(
                                  "Hi ${userData['name']}",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: isLandscape?width*0.04:width*0.06,)
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    isUpdate=true;
                              
                                    showModalBottomSheet(
                                      backgroundColor: Colors.black,
                                      isDismissible: true,
                                      enableDrag: true,
                              
                                      context: context,
                                      builder: (_) {
                                        return FractionallySizedBox(


                                          child: ShowModal(
                                            isupdate: isUpdate,
                                            height: height,
                                            width: width,
                                            isLandscape: isLandscape,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                              
                                    color: AppColors.primarycolor.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 2,color: Colors.green
                              )
                          ),
                          child: ListTile(
                            leading: Icon(Icons.email_outlined),
                            title: Text(
                              "Email Id",
                                style: TextStyle(color: Colors.white,
                                  fontSize: isLandscape?width*0.04:width*0.04,),
    
                            ),
                            subtitle: Text(" ${userData['email']},", style: TextStyle(color: Colors.white,
                              fontSize: isLandscape?width*0.04:width*0.05,)),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: Text(
                    "No data available",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
    
            // Preferences Stream
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: firestore
                  .collection("users")
                  .doc(uid)
                  .collection("userPreferences")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error: ${snapshot.error}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                if (snapshot.hasData && snapshot.data != null) {
                  var docs = snapshot.data!.docs;
                  if (docs.isEmpty) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(

                            backgroundColor: Colors.black.withOpacity(0.5),
                            isDismissible: true,
                            enableDrag: true,
                            context: context,
                            builder: (_) {
                              return Container(
                                height: height*0.7,
                                child: ShowModal(
                                  isupdate: isUpdate,
                                  height: height,
                                  width: width,
                                  isLandscape: isLandscape,
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Text(
                              "No user preferences found",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Set Your Preferences now",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
    
                  // Prepopulate data for updating
    
    
    
                  return Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: docs.map((doc) {
                        var data = doc.data();
                        if (  docs.isNotEmpty) {

                          // Set docId for the first document
                          docId = docs.first.id;
    
                          var data = docs.first.data();

                          double? bmiheight = double.parse(data['height']);
                          double? bmiweight = double.parse(data['weight']);

                          // Calculate BMI and result message
                          _calculateBMI(height:bmiheight, weight: bmiweight,isLandscape: isLandscape,texthegiht: height,textwidth: width);

                        }



                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Container(
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 border: Border.all(
                                     width: 2,color: Colors.green
                                 )
                             ),
                             child: ListTile(
                               title: Text("Height", style: TextStyle(color: Colors.white,
                                 fontSize: isLandscape?width*0.04:width*0.04,)),
                             subtitle:    Text(
                               " ${data['height']}",
                                 style: TextStyle(color: Colors.white,
                                   fontSize: isLandscape?width*0.04:width*0.05,)
                             ),
                             ),
                           ),
    
                            SizedBox(height: height*0.02),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2,color: Colors.green
                                  )
                              ),
                              child: ListTile(
                                title:Text("Weight", style: TextStyle(color: Colors.white,
                                  fontSize: isLandscape?width*0.04:width*0.04,)),
                                subtitle:  Text(
                                    " ${data['weight']}",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: isLandscape?width*0.04:width*0.05,)
                                ),
                              ),
                            ),
    
                             SizedBox(height: height*0.02),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2,color: Colors.green
                                  )
                              ),
                              child: ListTile(
                                title:Text(" Your Goal", style: TextStyle(color: Colors.white,
                                  fontSize: isLandscape?width*0.04:width*0.04,)),
                                subtitle:  Text(
                                    " ${data['goal']}",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: isLandscape?width*0.04:width*0.05,)
                                ),
                              ),

                            ),
                            SizedBox(height: height * 0.02),
                            // Display BMI result
                            result ?? SizedBox(),
    
                          ],
                        );
                      }).toList(),
                    ),
                  );
                }
    
                return Center(
                  child: GestureDetector(
    
                    child: Column(
                      children: [
                        Text(
                          "No preferences available bro",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("Set Your Preferences now "),
                      ],
                    ),
                  ),
                );
              },
            ),
            InkWell(
              onTap: (){
               // Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade,child: ProfileScreen()));
              },
              child: Container(
                margin:EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,color: Colors.green,
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.white),
                    leading:Icon( FontAwesomeIcons.history,
                    weight: 20,
                    color: Colors.white,
                    size: 20,),
                    title: Text("Workout History", style: TextStyle(color: Colors.white,
                      fontSize: isLandscape?width*0.04:width*0.05,)),
                  ),
                ),
              ),
            )
          ],
        ),

      ),


    );

  }
  _calculateBMI({required double height, required double weight,required  double texthegiht, required double textwidth,required bool isLandscape}) {
    double heightInMeters = height / 100;  // Convert height to meters

    if (weight != null && height != null && weight > 0 && height > 0) {
      double bmi = weight / (heightInMeters * heightInMeters);

      _BMI=bmi;

      if (bmi <= 18) {
        result =
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2,color: Colors.green
                  )
              ),
              child: ListTile(

                title: Text("Your BMI:  ${_BMI.toStringAsFixed(2)}",style: TextStyle(color: Colors.red,
                  fontSize: isLandscape?textwidth*0.04:textwidth*0.05,),),
                subtitle: Row(

                  children: [

                    Text(" Underweight,focus on bulking",style: TextStyle(color: Colors.redAccent,
                      fontSize: isLandscape?textwidth*0.04:textwidth*0.044,)),
                  ],
                ),
              ),
            );
      } else if (bmi > 18 && bmi < 25) {
        result =      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 2,color: Colors.green
              )
          ),
          child: ListTile(

            title: Text("Your BMI:  ${_BMI.toStringAsFixed(2)}",style: TextStyle(color:Colors.greenAccent,
              fontSize: isLandscape?textwidth*0.04:textwidth*0.05,),),
            subtitle: Row(

              children: [

                Text("Healthyweight, keep it up",style: TextStyle(color: Colors.greenAccent,
                  fontSize: isLandscape?textwidth*0.04:textwidth*0.044,)),
              ],
            ),
          ),
        );      }
      else {
        result =    Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 2,color: Colors.green
              )
          ),
          child: ListTile(

            title: Text("Your BMI:  ${_BMI.toStringAsFixed(2)}",style: TextStyle(color: Colors.red,
              fontSize: isLandscape?textwidth*0.04:textwidth*0.05,),),
            subtitle: Row(

              children: [

                Text("OverWeight, Please loose weight",style: TextStyle(color: Colors.red,
                  fontSize: isLandscape?textwidth*0.04:textwidth*0.044,)),
              ],
            ),
          ),
        );
      }
    }else{
      _BMI=0.0;
    }
  }

  Widget ShowModal({
    required bool isupdate,
    required double height,
    required double width,
    required bool isLandscape,
  }) {
    return Container(
      height: height*0.8,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: weightController,
              style: TextStyle(
                color: Colors.white,
                fontSize: isLandscape ? width * 0.03 : width * 0.06,
              ),
              decoration: InputDecoration(
                hintText: "Enter your weight (in kg)",
                label: Text(
                  "Weight",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isLandscape ? width * 0.03 : width * 0.06,
                  ),
                ),
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor, width: 2),
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor, width: 2),
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: heightController,
              style: TextStyle(
                color: Colors.white,
                fontSize: isLandscape ? width * 0.03 : width * 0.06,
              ),
              decoration: InputDecoration(
                hintText: "Enter your height (in cm)",
                label: Text(
                  "Height",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isLandscape ? width * 0.03 : width * 0.06,
                  ),
                ),
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor, width: 2),
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor, width: 2),
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: goalController,
              style: TextStyle(
                color: Colors.white,
                fontSize: isLandscape ? width * 0.03 : width * 0.06,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor,width: 2),

                  borderRadius: BorderRadius.circular(width*0.02),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primarycolor,width: 2),

                  borderRadius: BorderRadius.circular(width*0.02),
                ),
                hintText: "Enter your goal (e.g., lose weight)",
                label: Text(
                  "Goal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isLandscape ? width * 0.03 : width * 0.06,
                  ),
                ),
                hintStyle: TextStyle(color: Colors.white),

              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primarycolor.withOpacity(0.5),
                  ),
                  onPressed: () async {
                    if (isUpdate) {
                      // Ensure docId is not empty before update
                      if (docId.isNotEmpty) {
                        await firestore
                            .collection("users")
                            .doc(uid)
                            .collection("userPreferences")
                            .doc(docId)
                            .update({
                          'weight': weightController.text,
                          'height': heightController.text,
                          'goal': goalController.text,
                        });
                      } else {
                        print("Error: docId is empty");
                      }
                    } else {
                      await firestore
                          .collection("users")
                          .doc(uid)
                          .collection("userPreferences")
                          .add({
                        'weight': weightController.text,
                        'height': heightController.text,
                        'goal': goalController.text,
                      });
                    }
                    Navigator.pop(context);
                  },

                  child: Text(isUpdate ? "Update" : "Add Preferences",style: TextStyle(
                    color: Colors.white,
                    fontSize: isLandscape ? width * 0.03 : width * 0.06,
                  ),),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primarycolor.withOpacity(0.5),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isLandscape ? width * 0.03 : width * 0.06,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
}
}

/*  await firestore.collection("users").doc(uid).collection("tasks").doc(DateTime.now().toString() ).set({
                              "title" : titlecontroller.text,
                              "desc": descontroller.text,
                              "assignee": assigneecotroller.text,
                              "date":dtFormat.format((selectedDate ?? DateTime.now())),
                             "isCompleted":false,


                            });


                               onPressed: () async {
                  firestore
                      .collection("users")
                      .doc(uid)
                      .collection("tasks")
                      .doc(widget.id)
                      .update({
                    "title": updatetitlecontroller.text,
                    "desc": updatedesccontroller.text
                  });
                  Navigator.pop(context);

                },


                            */

/*class ProfileScreen extends StatefulWidget {
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                height: height * 0.2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.orange.withOpacity(0.8)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const CircleAvatar(
                      //   radius: 50,
                      //   backgroundImage: AssetImage('assets/1.jpg'),
                      // ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              //user name
                              Text(
                                username.toString() == 'null'
                                    ? 'Username'
                                    : username.toString(),
                                // namebox.get('username') ?? 'USername',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              // edit icon
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  controller: namecontroller,
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText:
                                                              'Enter name'),
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        var namebox =
                                                            Hive.box<String>(
                                                                'username');
                                                        namebox.put(
                                                            'username',
                                                            namecontroller
                                                                .text);
                                                        username =
                                                            namecontroller.text;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Done'))
                                              ],
                                            ),
                                          ));
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Fitness Enthusiast",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),

              // Section Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Exercise History",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),

              // History Cards

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
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.orange,
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
                              'exercisehistory');
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
                      const Text(
                        'Delete History',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              //weight
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Text(
              //     'Weight Analysis',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // // SizedBox(
              // //   height: height * 0.05,
              // // ),
              // //progress indicator
              // SizedBox(
              //   height: height * 0.03,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Container(
              //     padding: const EdgeInsets.all(20),
              //     decoration: BoxDecoration(
              //       color: primarycolor.withOpacity(0.3),
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: Column(
              //       children: [
              //         const Text(
              //           'Weight Loss Progress',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         SizedBox(height: height * 0.02),
              //         Text(
              //           // 'Progress',
              //           'Progress: ${getProgress().toStringAsFixed(1)}%',
              //           style: const TextStyle(
              //             color: Colors.white,
              //             fontSize: 16,
              //           ),
              //         ),
              //         SizedBox(height: height * 0.02),
              //         LinearProgressIndicator(
              //           // value: 0.4,
              //           value: getProgress() / 100,
              //           backgroundColor: Colors.grey.withOpacity(0.5),
              //           valueColor: AlwaysStoppedAnimation<Color>(primarycolor),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: height * 0.02),
              // //weight lists
              // SizedBox(
              //   height: height * 0.4,
              //   child: ListView.builder(
              //     itemCount: weightData.length,
              //     // itemCount: 10,
              //     itemBuilder: (context, index) {
              //       var weightEntry = weightData[index];
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //         child: Container(
              //           margin: const EdgeInsets.symmetric(vertical: 8.0),
              //           padding: const EdgeInsets.all(10.0),
              //           decoration: BoxDecoration(
              //             color: primarycolor.withOpacity(0.2),
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 weightEntry['date'],
              //                 // 'data',
              //                 style: const TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 16,
              //                 ),
              //               ),
              //               Text(
              //                 '${weightEntry['weight']} kg',
              //                 // 'kg',
              //                 style: const TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 16,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // SizedBox(height: height * 0.02),
              // //add new weight button
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 50.0),
              //   child: GestureDetector(
              //     onTap: _addNewWeight,
              //     child: Container(
              //       height: height * 0.07,
              //       decoration: BoxDecoration(
              //         color: primarycolor.withOpacity(0.8),
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: const Center(
              //         child: Text(
              //           'Add New Weight',
              //           style: TextStyle(color: Colors.white, fontSize: 20),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class WorkoutNotificationPage extends StatefulWidget {
  @override
  _WorkoutNotificationPageState createState() => _WorkoutNotificationPageState();
}

class _WorkoutNotificationPageState extends State<WorkoutNotificationPage> {
  TimeOfDay? selectedTime;
  var uid="";
  final String userId = "testUser123"; // Replace with actual user ID
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  void getUid()async{
    var prefs= await  SharedPreferences.getInstance();
    uid= prefs.getString("uid") ?? "";
    await SharedPreferences.getInstance();

    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    initializeNotification();
  }

  void initializeNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
      saveWorkoutTime(pickedTime);
      scheduleNotification(pickedTime);
    }
  }

  void saveWorkoutTime(TimeOfDay time) {
    final workoutTime = '${time.hour}:${time.minute}';
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({
      'workoutTime': workoutTime,
    }, SetOptions(merge: true)).then((_) {
      print("Workout time saved successfully!");
    }).catchError((error) {
      print("Failed to save workout time: $error");
    });
  }

  void scheduleNotification(TimeOfDay time) async {
    final hour = time.hour;
    final minute = time.minute;
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    final tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Workout Reminder',
      'It’s time for your workout!',
      scheduledDate.isBefore(now) ? scheduledDate.add(Duration(days: 1)) : scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'workout_channel',
          'Workout Reminders',

          importance: Importance.high,
          priority: Priority.high,

        ),

      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, androidScheduleMode:  AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedTime != null
                  ? 'Selected Time: ${selectedTime!.format(context)}'
                  : 'No time selected',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => selectTime(context),
              child: Text('Select Workout Time'),
            ),
          ],
        ),
      ),
    );
  }
}
*/

/* StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: firestore
                    .collection("users")
                    .doc(uid)
                    .collection("tasks")
                    .snapshots(),
                builder: (c, snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshots.hasError) {
                    return Center(
                      child: Text("error :${snapshots.error}"),
                    );
                  }
                  if (snapshots.hasData && snapshots.data != null) {
                    return snapshots.data!.docs.isNotEmpty
                        ? ListView.builder(
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (c, i) {
                              taskongoing = snapshots.data!.docs.length;
                              var docs = snapshots.data!.docs[i];
                              var data = docs.data();
                              return ListTile(
                                  onTap: () {
                                    id = docs.id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => detail_page(
                                                id: id,
                                                title: (data["title"]),
                                                desc: data["desc"])));
                                  },
                                  title: Text(data["title"]),
                                  subtitle: Text(data["desc"]),
                                  trailing: Text(
                                      "${data["assignee"]} \n ${data["date"]}"));
                            })
                        : Column(
                            children: [
                              Text(
                                "no task yet",
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => addtask()));
                                  },
                                  child: Text("Add Tasks"))
                            ],
                          );
                  }
                  return Container();
                },
              ),*/
/*class detail_page extends StatefulWidget {
  String? id;
  String title;
  String desc;
  detail_page({this.id, required this.title, required this.desc});

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  int? ongoingcount;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DBhelper dbhelper = DBhelper.getinstance();
  String uid = "";
  TextEditingController updatetitlecontroller = TextEditingController();
  TextEditingController updatedesccontroller = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    getUid();
    setState(() {});
  }

  void getUid() async {
    var prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("uid") ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //ongoingcount=  context.watch<taskprovider>().getalltask().length;
    return Scaffold(
        backgroundColor: Color(0xff282828),
        appBar: AppBar(
          backgroundColor: Color(0xff282828),
          title: Text(
            "DETAIL",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: IconButton(
                onPressed: () async {
                  showModalBottomSheet(
                      isDismissible: false,
                      enableDrag: false,
                      context: context,
                      builder: (_) {
                        return showmodal();
                      });
                  updatetitlecontroller.text = widget.title;
                  updatedesccontroller.text = widget.desc;
                  setState(() {});
                },
                icon: Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(onPressed: ()async{
              firestore
                  .collection("users")
                  .doc(uid)
                  .collection("tasks")
                  .doc(widget.id).delete();
              Navigator.pop(context);

            }, icon: Icon(Icons.delete,color: Colors.red,)),
            ElevatedButton(
                onPressed: () async {
                  firestore.collection("tasks").doc(widget.id).update({
                    "isCompleted": true,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    "task completed",
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.center,
                  )));
                },
                child: Text("Mark as Complete")),

          ],
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Flexible(
                child: Container(
              child: Text(
                widget.desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ))
          ],
        ));
  }

  Widget showmodal() {
    return Container(
      //alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: updatetitlecontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              //hintText: "update title "
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: updatedesccontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              //hintText: "upadate desc"
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                onPressed: () async {
                  firestore
                      .collection("users")
                      .doc(uid)
                      .collection("tasks")
                      .doc(widget.id)
                      .update({
                    "title": updatetitlecontroller.text,
                    "desc": updatedesccontroller.text
                  });
                  Navigator.pop(context);

                },
                child: Text("update"),
              )),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: TextButton(
                child: Text("Cancel"),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ))
            ],
          ),


        ],
      ),
    );
  }
}
*/
