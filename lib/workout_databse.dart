import 'package:home_workout/models/exercise_historymodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  DBHelper._();
  static DBHelper getinstance() => DBHelper._();
  Database? mDB;

  //login pref key
  static final String Exercise_Table = "excercise";
  static final String Exercise_Id = "excerciseid";
  static final String Exercise_Name = "excercisename";
  static final String Exercise_Image = "excerciseimage";
  static final String Exercise_Date = "exercisedate";
  static final String Exercise_calories = "excercisecalories";
  static final String Exercise_duration = "excerciseduration";

//// favourites
  static final String Favourites_table = "favourites";
  static final String Favourites_exercise_gif = "exerciseGif";
  static final String Favourites_exercise_name = "exerciseName";
  static final String Favourites_exercise_desc = "description";
  static final String Favourites_exercise_image = "image";
  static final String Favourites_exercise_id = "favouriteuid";

  Future<Database> getDB() async {
    mDB ??= await openDB();
    return mDB!;
  }

  Future<Database> openDB() async {
    var appDir = await getApplicationDocumentsDirectory();
    var dbpath = join(appDir.path, "fitness.db");
    return openDatabase(
      dbpath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "create table $Favourites_table ( $Favourites_exercise_id integer primary key autoincrement, $Favourites_exercise_name text, $Favourites_exercise_image text, $Favourites_exercise_desc text, $Favourites_exercise_gif text )");
        db.execute(
            "create table $Exercise_Table ( $Exercise_Id integer primary key autoincrement, $Exercise_Name text , $Exercise_Date text, $Exercise_calories text, $Exercise_duration text, $Exercise_Image text)");
      },
    );
  }



  Future<bool> addFavourites(FavouriteExercisesModel exercise)async{
    var db = await getDB();
    var rowseffected= await db.insert(Favourites_table, exercise.toMap());
    return rowseffected>0;
  }
  // Insert table
  Future<bool> addExercise(ExerciseHistoryModel exercise) async {
    var db = await getDB();
    var rowseffected = await db.insert(Exercise_Table, exercise.toMap());
    return rowseffected > 0;
  }

  Future<List<FavouriteExercisesModel>> getAllFavourites() async {
    var db = await getDB();
    var result = await db.query(Favourites_table);

    return result.map((map) {
      try {
        return FavouriteExercisesModel.fromMap(map);
      } catch (e) {
        print('Error parsing row: $map, Error: $e');
        return null; // Handle invalid row gracefully
      }
    }).where((e) => e != null).cast<FavouriteExercisesModel>().toList();
  }

  // Fetch all exercise history

  Future<List<ExerciseHistoryModel>> getAllExercises() async {
    var db = await getDB();
    var result =
        await db.query(Exercise_Table); // Retrieve all rows from the table
    return result.map((map) => ExerciseHistoryModel.fromMap(map)).toList();
  }

  Future<bool> deleteFavourites(int id)async{
    var db = await getDB();
    var rowsDeleted = await db.delete(
        Favourites_table,
        where: '$Favourites_exercise_id = ?',
        whereArgs: [id],);
    return rowsDeleted>0;
  }
  Future<bool> deleteAllExercises() async {
    var db = await getDB();
    var rowsDeleted = await db.delete(Exercise_Table);
    return rowsDeleted > 0;
  }

  Future<bool> deleteExercise(int id) async {
    var db = await getDB();
    var rowsDeleted = await db.delete(
      Exercise_Table,
      where: '$Exercise_Id = ?',
      whereArgs: [id],
    );
    return rowsDeleted > 0;
  }

  Future<ExerciseHistoryModel?> getExerciseById(int id) async {
    var db = await getDB();
    var result = await db.query(
      Exercise_Table,
      where: '$Exercise_Id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return ExerciseHistoryModel.fromMap(result.first);
    }
    return null; // Return null if no record is found
  }
}
