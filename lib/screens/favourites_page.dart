import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_workout/UTILS/appcolors.dart';
import 'package:home_workout/favourites_bloc/favourites_bloc.dart';
import 'package:home_workout/favourites_bloc/favourites_event.dart';
import 'package:home_workout/favourites_bloc/favourites_state.dart';

class FavouriteExercisePage extends StatefulWidget {
  const FavouriteExercisePage({super.key});

  @override
  State<FavouriteExercisePage> createState() => _FavouriteExercisePageState();
}

class _FavouriteExercisePageState extends State<FavouriteExercisePage> {
  @override
  void initState() {

    super.initState();
    context.read<FavouritesBloc>().add(GetAllFavouritesEvent());
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Favourite Exercises",style:
        TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Color(0xffffffff)),),
        backgroundColor: AppColors.secondaryolor,
     centerTitle: true,
      ),
body: BlocBuilder<FavouritesBloc,FavouritesState>(builder: (_,state){
  if(state is FavouritesLoadingState){
    return Center(child: CircularProgressIndicator(),);
  }
  if(state is FavouritesErrorState){
    return Center(
      child: Text(state.errorMsg),
    );
  }
  if(state is FavouritesLoadedState){
    var exercise= state.mexercise;
    print("exe:${exercise}");
    return exercise.isNotEmpty?Container(
      height: double.infinity,
      child: ListView.builder(
          itemCount: exercise.length,
          itemBuilder: (_,index){
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40)),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(

                      height: 450,
                        width: width,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryolor,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0),
                            child: Column(
                              children: [
                                // exercise name
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  exercise[index].exerciseName,
                                  style:  TextStyle(
                                      color: Colors.white,
                                      fontSize: isLandscape?width*0.04:width*0.06,
                                  fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                //gif
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                  // height: height * 0.2,
                                   width: 400,
                                    child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(20),
                                        child: Image.asset(
                                          exercise[index].exerciseGif,
                                          height: height * 0.2,
                                        ))),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  height: 200, // Fixed height for the container
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(), // Optional for smooth scrolling
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minHeight: 200, // Match the height of the container
                                        maxHeight: double.infinity, // Allow content to grow
                                      ),
                                      child: Text(
                                        exercise[index].exerciseDesc,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: isLandscape ? width * 0.04 : width * 0.05,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                  child: Image.asset(exercise[index].exerciseImg),
                ),
                title: Text(exercise[index].exerciseName),
                trailing: IconButton(onPressed: (){
                  context.read<FavouritesBloc>().add(DeleteFavouritesEvent(id:state.mexercise[index].favouriteId!));


                }, icon: Icon(Icons.delete,color: AppColors.secondaryolor,)),
              ),
            ),
            Divider(color: Colors.grey,height: 4,
            endIndent: 24,
            indent: 24,)
          ],
        );
      }),
    ):Center(child: Text("No favourite workout yet"),);
  }
  return Container(
    child: Text("mai hu yaha"),
  );
}),
    );
  }
}
