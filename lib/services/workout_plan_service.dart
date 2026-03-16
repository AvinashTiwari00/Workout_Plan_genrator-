import 'package:college_project/models/workout_plan.dart';

class WorkoutPlanService {
  WorkoutPlan generatePlan(UserGoal goal) {
    switch (goal) {
      case UserGoal.muscleGain:
        return _generateMuscleGainPlan();
      case UserGoal.fatLoss:
        return _generateFatLossPlan();
      case UserGoal.maintenance:
        return _generateMaintenancePlan();
    }
  }

  WorkoutPlan _generateMuscleGainPlan() {
    return WorkoutPlan(
      goal: UserGoal.muscleGain,
      workoutDays: 5,
      schedule: [
        WorkoutDay(
          name: "Day 1: Push (Chest/Shoulders/Triceps)",
          muscleGroups: ["Chest", "Shoulders", "Triceps"],
          exercises: [
            Exercise(name: "Barbell Bench Press", sets: "4", reps: "8-10"),
            Exercise(name: "Overhead Barbell Press", sets: "4", reps: "8-12"),
            Exercise(name: "Incline Dumbbell Press", sets: "3", reps: "10-12"),
            Exercise(name: "Lateral Raises", sets: "3", reps: "12-15"),
            Exercise(name: "Tricep Pushdowns", sets: "3", reps: "10-12"),
          ],
        ),
        WorkoutDay(
          name: "Day 2: Pull (Back/Biceps)",
          muscleGroups: ["Back", "Biceps"],
          exercises: [
            Exercise(name: "Deadlifts", sets: "3", reps: "5-8"),
            Exercise(name: "Pull-Ups (or Lat Pulldowns)", sets: "4", reps: "8-10"),
            Exercise(name: "Barbell Rows", sets: "4", reps: "8-10"),
            Exercise(name: "Face Pulls", sets: "3", reps: "12-15"),
            Exercise(name: "Barbell Bicep Curls", sets: "3", reps: "10-12"),
          ],
        ),
        WorkoutDay(
          name: "Day 3: Legs",
          muscleGroups: ["Quads", "Hamstrings", "Calves"],
          exercises: [
            Exercise(name: "Barbell Squats", sets: "4", reps: "6-8"),
            Exercise(name: "Romanian Deadlifts", sets: "3", reps: "8-10"),
            Exercise(name: "Leg Press", sets: "3", reps: "10-12"),
            Exercise(name: "Leg Curls", sets: "3", reps: "10-12"),
            Exercise(name: "Standing Calf Raises", sets: "4", reps: "12-15"),
          ],
        ),
        WorkoutDay(
          name: "Day 4: Upper Body Focus",
          muscleGroups: ["Chest", "Back", "Shoulders", "Arms"],
          exercises: [
            Exercise(name: "Dumbbell Press", sets: "3", reps: "8-12"),
            Exercise(name: "Seated Cable Rows", sets: "3", reps: "10-12"),
            Exercise(name: "Dumbbell Shoulder Press", sets: "3", reps: "10-12"),
            Exercise(name: "Hammer Curls", sets: "3", reps: "10-12"),
            Exercise(name: "Skullcrushers", sets: "3", reps: "10-12"),
          ],
        ),
        WorkoutDay(
          name: "Day 5: Lower Body Focus",
          muscleGroups: ["Legs", "Abs"],
          exercises: [
            Exercise(name: "Goblet Squats", sets: "3", reps: "10-12"),
            Exercise(name: "Lunges", sets: "3", reps: "10-12 per leg"),
            Exercise(name: "Leg Extensions", sets: "3", reps: "12-15"),
            Exercise(name: "Plank", sets: "3", reps: "60 sec"),
            Exercise(name: "Hanging Leg Raises", sets: "3", reps: "10-15"),
          ],
        ),
      ],
    );
  }

  WorkoutPlan _generateFatLossPlan() {
    return WorkoutPlan(
      goal: UserGoal.fatLoss,
      workoutDays: 4,
      schedule: [
        WorkoutDay(
          name: "Day 1: Upper Body",
          muscleGroups: ["Chest", "Back", "Shoulders"],
          exercises: [
            Exercise(name: "Bench Press", sets: "3", reps: "12-15"),
            Exercise(name: "Bent Over Rows", sets: "3", reps: "12-15"),
            Exercise(name: "Overhead Press", sets: "3", reps: "12-15"),
            Exercise(name: "Lat Pulldowns", sets: "3", reps: "12-15"),
            Exercise(name: "Push-ups", sets: "3", reps: "Max"),
          ],
        ),
        WorkoutDay(
          name: "Day 2: Lower Body & Cardio",
          muscleGroups: ["Legs", "Cardio"],
          exercises: [
            Exercise(name: "Squats", sets: "3", reps: "12-15"),
            Exercise(name: "Lunges", sets: "3", reps: "12-15 per leg"),
            Exercise(name: "Leg Curls", sets: "3", reps: "15"),
            Exercise(name: "Calf Raises", sets: "3", reps: "20"),
            Exercise(name: "HIIT Cardio", sets: "1", reps: "15 mins"),
          ],
        ),
        WorkoutDay(
          name: "Day 3: Full Body Circuit A",
          muscleGroups: ["Whole Body"],
          exercises: [
            Exercise(name: "Dumbbell Thrusters", sets: "3", reps: "12-15"),
            Exercise(name: "Renegade Rows", sets: "3", reps: "12-15"),
            Exercise(name: "Mountain Climbers", sets: "3", reps: "30 sec"),
            Exercise(name: "Kettlebell Swings", sets: "3", reps: "15-20"),
            Exercise(name: "Burpees", sets: "3", reps: "10-12"),
          ],
        ),
        WorkoutDay(
          name: "Day 4: Full Body Circuit B",
          muscleGroups: ["Whole Body"],
          exercises: [
            Exercise(name: "Deadlifts", sets: "3", reps: "12"),
            Exercise(name: "Push-Ups", sets: "3", reps: "15"),
            Exercise(name: "Box Jumps", sets: "3", reps: "12"),
            Exercise(name: "Battle Ropes", sets: "3", reps: "30 sec"),
            Exercise(name: "Plank", sets: "3", reps: "60 sec"),
          ],
        ),
      ],
    );
  }

  WorkoutPlan _generateMaintenancePlan() {
    return WorkoutPlan(
      goal: UserGoal.maintenance,
      workoutDays: 3,
      schedule: [
        WorkoutDay(
          name: "Day 1: Full Body A",
          muscleGroups: ["Whole Body"],
          exercises: [
            Exercise(name: "Squats", sets: "3", reps: "8-10"),
            Exercise(name: "Bench Press", sets: "3", reps: "8-10"),
            Exercise(name: "Bent Over Rows", sets: "3", reps: "8-10"),
            Exercise(name: "Overhead Press", sets: "3", reps: "8-10"),
            Exercise(name: "Plank", sets: "3", reps: "45 sec"),
          ],
        ),
        WorkoutDay(
          name: "Day 2: Full Body B",
          muscleGroups: ["Whole Body"],
          exercises: [
            Exercise(name: "Deadlifts", sets: "3", reps: "6-8"),
            Exercise(name: "Pull-Ups", sets: "3", reps: "8-10"),
            Exercise(name: "Dumbbell Press", sets: "3", reps: "8-10"),
            Exercise(name: "Lunges", sets: "3", reps: "10 per leg"),
            Exercise(name: "Hanging Leg Raises", sets: "3", reps: "12"),
          ],
        ),
        WorkoutDay(
          name: "Day 3: Full Body C",
          muscleGroups: ["Whole Body"],
          exercises: [
            Exercise(name: "Leg Press", sets: "3", reps: "10"),
            Exercise(name: "Seated Cable Rows", sets: "3", reps: "10"),
            Exercise(name: "Incline Dumbbell Press", sets: "3", reps: "10"),
            Exercise(name: "Lateral Raises", sets: "3", reps: "12"),
            Exercise(name: "Bicep Curls", sets: "3", reps: "10"),
          ],
        ),
      ],
    );
  }
}
