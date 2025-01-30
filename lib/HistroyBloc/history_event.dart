import 'package:home_workout/models/exercise_historymodel.dart';

abstract class HistoryEvent{}


class HistoryaddEvenet extends HistoryEvent{
  ExerciseHistoryModel exercises;
  HistoryaddEvenet({required this.exercises});
}

class HistoryDeleteEvent extends HistoryEvent{
  int id;
  HistoryDeleteEvent({required this.id});

}
class GetallhistoryEvent extends HistoryEvent{

}
class AllHistoryDeleteEvent extends HistoryEvent{

}