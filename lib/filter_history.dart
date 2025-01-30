import 'models/exercise_historymodel.dart';

class FilterHistoryModel {
  String exercise;
  num totaltime;
  List<ExerciseHistoryModel> mExercises;

  FilterHistoryModel(

      {required this.exercise, required this.totaltime, required this.mExercises});
}
