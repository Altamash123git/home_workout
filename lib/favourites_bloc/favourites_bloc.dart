import 'package:bloc/bloc.dart';
import 'package:home_workout/favourites_bloc/favourites_event.dart';
import 'package:home_workout/favourites_bloc/favourites_state.dart';
import 'package:home_workout/workout_databse.dart';

class FavouritesBloc extends Bloc<FavouritesEvent,FavouritesState> {
  DBHelper dbHelper;
  FavouritesBloc({required this.dbHelper}):super(FavouritesInitialState()){
    on<AddFavouritesEvent>((event,emit)async{
      emit(FavouritesLoadingState());
      bool check= await dbHelper.addFavourites(event.exercises);
      if(check){
        var data= await dbHelper.getAllFavourites();
        emit(FavouritesLoadedState(mexercise: data));
      }
    });
on<DeleteFavouritesEvent>((event,emit)async{
  emit(FavouritesLoadingState());
  bool check= await dbHelper.deleteFavourites(event.id);
  if(check){

    var data= await dbHelper.getAllFavourites();
    emit(FavouritesLoadedState(mexercise: data));
  }
});
on<GetAllFavouritesEvent>((event,emit)async{
  emit(FavouritesLoadingState());
  var data= await dbHelper.getAllFavourites();
  emit(FavouritesLoadedState(mexercise: data));
});
  }
}
/*class HistoryBloc extends Bloc<HistoryEvent,ExerciseHistroyState>{
  DBHelper dbHelper;
  HistoryBloc({required this.dbHelper}):super(HistoryInitialState()){
    on<HistoryaddEvenet>((event,emit)async{
      emit(HistoryLoadingState());
      bool check= await dbHelper.addExercise(event.exercises);
      if(check){
        var data= await dbHelper.getAllExercises();
        emit(HistoryLoadedState(mExercise: data));

      }
    });
    on<HistoryDeleteEvent>((event,emit)async{
      emit(HistoryLoadingState());
bool check= await dbHelper.deleteExercise(event.id);
if(check){
  var data= await dbHelper.getAllExercises();
  emit(HistoryLoadedState(mExercise: data));

}
    });
    on<AllHistoryDeleteEvent>((event,emit)async{
      emit(HistoryLoadingState());
      bool check= await dbHelper.deleteAllExercises();
      if(check){
        var data= await dbHelper.getAllExercises();
        emit(HistoryLoadedState(mExercise: data));

      }
    });
    on<GetallhistoryEvent>((event, emit) async {
      emit(HistoryLoadingState());
      var data = await dbHelper.getAllExercises();

      emit(HistoryLoadedState(mExercise: data));
    });
  }
}*/