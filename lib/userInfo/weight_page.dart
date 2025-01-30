import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_workout/userInfo/BMIPage.dart';
import 'package:home_workout/userInfo/user_info_values.dart';
import 'package:page_transition/page_transition.dart';

import '../UTILS/appcolors.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  bool isFeet = true; // Toggle between ft and cm

  double selectedWeight=0;
  bool iskg=true;
  double? convertlbsintokg(){
    if(iskg==false){
      var selectedweightinkg=selectedWeight*0.454;
      setState(() {

      });
      return selectedweightinkg;

    }else{
      return selectedWeight;
    }
  }
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
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height*0.1,
                  ),
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
                    child: Text("Step 4",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: isLandscape ? width * 0.03 : width * 0.05)),
                  ),
                  SizedBox(
                    height: height*0.01,

                  ),
                  Text("What is Your Weight ? ",style:
                  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,


                      shadows: [
                        Shadow(color: Colors.grey)
                      ],
                      fontSize: isLandscape ? width * 0.03 : width * 0.05),),
                  SizedBox(height: height*0.07,),
                  Container(

                      width: width*0.7,
                      height: height*0.33,
                      child:
                      Column(
                        children: [
                          SizedBox(height: height*0.03,),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),

                            child: ToggleButtons(

                              disabledColor: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              selectedBorderColor: Colors.red,
                              fillColor: AppColors.secondaryolor,
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
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                                  child: Text(' Kg',style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold

                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                                  child: Text(' lbs',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold

                                  )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: iskg ? 701 : 1501, // Feet range: 3-10 ft, CM range: 100-300 cm
                              itemBuilder: (context, index) {
                                bool isDivisibleBy10 = index % 10 == 0;
                                bool isDivisibleBy5=index%5==0;
                                double value = iskg ? (25+ index*0.1).toDouble() : (55 + index*0.1).toDouble();
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
                                        Text(isDivisibleBy5 || isDivisibleBy10?"${value.toStringAsFixed(1)}":""),
                                        Container(
                                          height: isDivisibleBy5 || isDivisibleBy10 ? 70 : 30,
                                          alignment: Alignment.center,
                                          //padding: EdgeInsets.only(top: isDivisibleBy10?0:20),
                                          margin: EdgeInsets.only(top:isDivisibleBy5 || isDivisibleBy10?0:20),



                                          width: 2,

                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: selectedWeight == value ? Colors.red : Colors.grey,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            iskg ? '${value.toStringAsFixed(1)} kg' : '${value.toStringAsFixed(1)} lbs',
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
                          SizedBox(height: 20),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: Column(
                              children: [
                                Text(
                                  ' ${selectedWeight > 0 ? '${iskg ? '${selectedWeight.toStringAsFixed(1)} kgs' : '${selectedWeight.toStringAsFixed(1)} lbs'}' : 'None'}',
                                  style: TextStyle(fontSize: 24,
                                      fontWeight: FontWeight.bold,color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(
                                  height: 4,
                                  color: Colors.green,
                                  indent: 10,
                                  endIndent: 7,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      )
                  ),


                  SizedBox(
                    height: height*0.13,
                  ),
                  InkWell(
                    onTap: (){
                      if(selectedWeight !=0){
                        UserInfoValues.weight= convertlbsintokg().toString();
                        print(convertlbsintokg().toString());

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text( " weight saved:${convertlbsintokg()} kg" )));
                        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade,child: BmiPage()));


                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please select weight",style: TextStyle(color: Colors.red),)));
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


