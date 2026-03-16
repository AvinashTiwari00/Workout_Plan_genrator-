

enum UserGoal { muscleGain, fatLoss, maintenance }

class WorkoutPlan {
  final UserGoal goal;
  final int workoutDays;
  final List<WorkoutDay> schedule;

  WorkoutPlan({
    required this.goal,
    required this.workoutDays,
    required this.schedule,
  });
}

class WorkoutDay {
  final String name;
  final List<String> muscleGroups;
  final List<Exercise> exercises;

  WorkoutDay({
    required this.name,
    required this.muscleGroups,
    required this.exercises,
  });
}

class Exercise {
  final String name;
  final String sets;
  final String reps;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
  });
}
