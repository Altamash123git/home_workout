import 'package:home_workout/models/exercise_historymodel.dart';

abstract class FavouritesState{}

class FavouritesInitialState extends FavouritesState{}
class FavouritesLoadingState extends FavouritesState{}
class FavouritesLoadedState extends FavouritesState{

  List<FavouriteExercisesModel> mexercise;
  FavouritesLoadedState({required this.mexercise});
}
class FavouritesErrorState extends FavouritesState{
  String errorMsg;
  FavouritesErrorState({required this.errorMsg});
}
