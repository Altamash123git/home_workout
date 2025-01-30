import 'package:home_workout/models/exercise_historymodel.dart';

abstract class ExerciseHistroyState{}

class HistoryInitialState extends ExerciseHistroyState{

}
class HistoryLoadingState extends ExerciseHistroyState{}
class HistoryLoadedState extends ExerciseHistroyState{
  List<ExerciseHistoryModel> mExercise;

  HistoryLoadedState({required this.mExercise});
}
class HistoryErrorState extends ExerciseHistroyState{
  String errorMsg;
  HistoryErrorState({required this.errorMsg});
}

