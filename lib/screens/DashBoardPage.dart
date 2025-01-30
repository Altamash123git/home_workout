import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_workout/UTILS/appcolors.dart';
import 'package:home_workout/screens/Allworkout_page.dart';
import 'package:home_workout/screens/HomePage.dart';
import 'package:home_workout/screens/ProfilePage.dart';


import 'favourites_page.dart';
import 'new_profile_page.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  List pages=[Homepage(),FavouriteExercisePage(),AllworkoutPage(),NewProfilePage()];
  int currindx=0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
body: pages[currindx],
     bottomNavigationBar: BottomNavigationBar(

         backgroundColor: AppColors.secondaryolor,
         selectedItemColor: AppColors.secondaryolor,
         unselectedItemColor: Colors.white,
         type: BottomNavigationBarType.fixed,
         elevation: 1,

         //Color(0xfff6f6f6),
         currentIndex: currindx,
         onTap: (index){setState(() {
           currindx=index;
         });


         },
       items: [
         BottomNavigationBarItem(
           icon: _buildIcon(Icons.home, 0),
           label: 'Home',
         ),
         BottomNavigationBarItem(
           icon: _buildIcon(Icons.favorite, 1),
           label: 'Favorites',
         ),
         BottomNavigationBarItem(
           icon: _buildIcon(Icons.fitness_center, 2),
           label: 'Workout',
         ),
         BottomNavigationBarItem(
           icon: _buildIcon(Icons.person, 3),
           label: 'Profile',
         ),
       ],),

   );

  }
  Widget _buildIcon(IconData icon, int index) {
    bool isSelected = currindx == index;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Container(
            //margin: EdgeInsets.only(bottom: 20),
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Colors.white.withOpacity(0.5),
               Colors.pinkAccent.withOpacity(0.4)
              ],
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6,1.0]
              ),
              //color: Colors.white.withOpacity(0.2), // Background effect
              //shape: BoxShape.circle, // Rounded circle for the selected item
            ),
          ),
        Icon(icon, size: 28, color: isSelected ? Colors.white : Colors.white70),
      ],
    );
  }
}

