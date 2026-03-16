import 'package:college_project/models/workout_plan.dart';

class User {
  final String name;
  final String todayWorkout;
  final int exercisesCount;
  final int completed;
  final int thisWeek;
  final String weight;
  final List<String> exercises;
  final Map<String, int> weeklyProgress;
  final UserGoal goal;
  //final List<WorkoutHistory> history;

  User({
    required this.name,
    required this.todayWorkout,
    required this.completed,
    required this.thisWeek,
    required this.exercisesCount,
    required this.exercises,
    required this.weight,
    required this.weeklyProgress,
    required this.goal,
   // required this.history,
  });
}

class WorkoutHistory {
  final String category;
  final int exercises;
  final int calories;
  final DateTime date;

  WorkoutHistory({
    required this.category,
    required this.exercises,
    required this.calories,
    required this.date,
  });
}
