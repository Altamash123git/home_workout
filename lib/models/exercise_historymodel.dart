import 'package:home_workout/workout_databse.dart';

class ExerciseHistoryModel {
  int? historyid;
  String exerciseName;
  String exerciseimg;
  String exerciseDate;
  String exerciseCalories;
  String exerciseDuration;
  ExerciseHistoryModel(
      {this.historyid,
      required this.exerciseName,
      required this.exerciseCalories,
      required this.exerciseDate,
      required this.exerciseDuration,
      required this.exerciseimg});

  factory ExerciseHistoryModel.fromMap(Map<String, dynamic> map) {
    return ExerciseHistoryModel(
        historyid: map[DBHelper.Exercise_Id],
        exerciseName: map[DBHelper.Exercise_Name],
        exerciseCalories: map[DBHelper.Exercise_calories],
        exerciseDate: map[DBHelper.Exercise_Date],
        exerciseDuration: map[DBHelper.Exercise_duration],
        exerciseimg: map[DBHelper.Exercise_Image]);
  }
  Map<String, dynamic> toMap() {
    return {
      DBHelper.Exercise_Id: historyid,
      DBHelper.Exercise_calories: exerciseCalories,
      DBHelper.Exercise_Date: exerciseDate,
      DBHelper.Exercise_duration: exerciseDuration,
      DBHelper.Exercise_Name: exerciseName,
      DBHelper.Exercise_Image: exerciseimg
    };
  }
}

class FavouriteExercisesModel {
  int? favouriteId;
  String exerciseName;
  String exerciseImg;
  String exerciseDesc;
  String exerciseGif;

  FavouriteExercisesModel(
      {required this.exerciseName,
      required this.exerciseDesc,
      required this.exerciseGif,
      required this.exerciseImg,
       this.favouriteId});
  factory FavouriteExercisesModel.fromMap(Map<String, dynamic> map) {
    return FavouriteExercisesModel(
        exerciseName: map[DBHelper.Favourites_exercise_name],
        exerciseDesc: map[DBHelper.Favourites_exercise_desc],
        exerciseGif: map[DBHelper.Favourites_exercise_gif],
        exerciseImg: map[DBHelper.Favourites_exercise_image],
        favouriteId: map[DBHelper.Favourites_exercise_id]);
  }
Map< String,dynamic> toMap(){
    return {
      DBHelper.Favourites_exercise_name:exerciseName,
      DBHelper.Favourites_exercise_image:exerciseImg,
      DBHelper.Favourites_exercise_gif:exerciseGif,
      DBHelper.Favourites_exercise_desc:exerciseDesc,
      DBHelper.Favourites_exercise_id:favouriteId,
    };
}
}
