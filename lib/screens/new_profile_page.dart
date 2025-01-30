import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:home_workout/UTILS/textdecoration.dart';
import 'package:home_workout/firebase_repo.dart';
import 'package:home_workout/userInfo/UserData_bloc/Userbloc.dart';
import 'package:home_workout/userInfo/UserData_bloc/userEvent.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UTILS/appcolors.dart';
import '../userInfo/UserData_bloc/userState.dart';

class NewProfilePage extends StatefulWidget {
  const NewProfilePage({super.key});

  @override
  State<NewProfilePage> createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  String uid = "";
  static File? imgfile;
  XFile? imgPicked;
  bool isCamera = false;
  void initState() {
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    final box = Hive.box("userProfile");
    final imgPath = box.get("ProfileImage") as String?;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryolor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
              create: (context) => UserBloc(userRepository: UserRepository())
                ..add(FetchCompleteUserData(uid)),
              child: uid.isEmpty
                  ? Container(
                      child: CircularProgressIndicator(),
                    )
                  : BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                      if (state is UserLoading) {
                        return CircularProgressIndicator();
                      } else if (state is UserError) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else if (state is UserLoaded) {
                        var data = state.userData;
                        return Container(
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                //alignment: Alignment.center,
                                height: height * 0.14,
                                width: width,
                                padding: EdgeInsets.all(10),
                                //margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryolor,
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Hello....!",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "${data["name"]}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      )
                                    ]),
                              ),
                              Container(
                                height: height * 0.7,
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Text("Your Name",style: profileTextStyle(),),
                                        subtitle: Text("${data["name"]}",style: TextStyle(fontSize: 16,color: Color(0xff4a4545)),),
                                        leading: CircleAvatar(
                                          backgroundColor:
                                              AppColors.secondaryolor,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Text("Your BMI",style: profileTextStyle(),),
                                        subtitle: Text("${data["BMI"]} kg/m^2",style: TextStyle(fontSize: 16,color: Color(0xff4a4545)),),
                                        leading: CircleAvatar(
                                          backgroundColor:
                                              AppColors.secondaryolor,
                                          child: Icon(
                                            Icons.fitness_center_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Text("Weight",style: profileTextStyle(),),
                                        subtitle: Text("${data["weight"]} kg",style: TextStyle(fontSize: 16,color: Color(0xff4a4545)),),
                                        leading: CircleAvatar(
                                          backgroundColor:
                                              AppColors.secondaryolor,
                                          child: Icon(
                                            Icons.man,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Text("Height",style: profileTextStyle(),),
                                        subtitle: Text("${data["height"]} cm",style: TextStyle(fontSize: 16,color: Color(0xff4a4545)),),
                                        leading: CircleAvatar(
                                          backgroundColor:
                                              AppColors.secondaryolor,
                                          child: Icon(
                                            Icons.man,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Text("Date of Birth",style: profileTextStyle(),),
                                        subtitle: Text("${data["dob"]}",style: TextStyle(fontSize: 16,color: Color(0xff4a4545)),),
                                        leading: CircleAvatar(
                                          backgroundColor:
                                              AppColors.secondaryolor,
                                          child: Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                            size: 27,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      return Container();
                    })),
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

    if (imgPicked != null) {
      final box = Hive.box("userProfile");
      box.put("ProfileImage", imgfile?.path);
      //Provider.of<taskprovider>(context,listen: false).setImage(File(imgPicked!.path));
    }
  }

  Widget ShowModalBottom() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              isCamera = true;
              getimg(isCamera);
              Navigator.pop(context);
            },
            child: Text("Open Camera")),
        ElevatedButton(
            onPressed: () {
              isCamera = false;
              getimg(isCamera);
              Navigator.pop(context);
            },
            child: Text("Open Gallery"))
      ]),
    );
  }

  void imgCrooper() async {
    try {
      if (imgPicked != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
            sourcePath: imgPicked!.path, uiSettings: [/* UI settings */]);
        if (croppedFile != null) {
          imgfile = File(croppedFile.path);
          setState(() {});
        }
      }
    } catch (e) {
      print("Error cropping image: $e");
    }
  }

  void getimga(bool camera) async {
    try {
      // Your existing logic here
    } catch (e, stacktrace) {
      print("Error: $e");
      print("Stacktrace: $stacktrace");
    }
  }

/*void getimg(bool camera) async {
    try {
      if (camera) {
        imgPicked = await ImagePicker().pickImage(source: ImageSource.camera);
      } else {
        imgPicked = await ImagePicker().pickImage(source: ImageSource.gallery);
      }

      if (imgPicked == null) {
        // User canceled the image picking
        return;
      }


       imgCrooper(); // Ensure this is awaited

      final box = Hive.box("userProfile");
      box.put("ProfileImage", imgfile?.path); // Use the cropped file if available
      setState(() {});
    } catch (e) {
      print("Error picking image: $e");
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
    try {
      if (imgPicked != null) {
        // Crop the image
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: imgPicked!.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: "Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              aspectRatioPresets: [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
              ],
            ),
            IOSUiSettings(
              title: "Cropper",
              aspectRatioPresets: [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
              ],
            ),
          ],
        );

        // Check if cropping was successful
        if (croppedFile != null) {
          imgfile = File(croppedFile.path); // Convert CroppedFile to File
          setState(() {}); // Update the UI
        }
      }
    } catch (e) {
      print("Error cropping image: $e");
    }
  }
*/
}
