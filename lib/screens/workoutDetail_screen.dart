import 'package:flutter/material.dart';
import 'package:college_project/models/workout_plan.dart';
import 'package:college_project/widgets/exercise_tile.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String workoutName;
  final int exercisesCount;
  final List<Exercise> exercises;

  const WorkoutDetailScreen({
    super.key,
    required this.workoutName,
    required this.exercisesCount,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text(workoutName),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Text(
              workoutName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "$exercisesCount Exercises • Approx 30–45 min",
              style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 25),

            // Exercises List
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  return ExerciseTile(
                    exercise: exercises[index],
                    index: index,
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Start Workout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  /// start workout logic here
                },
                child: const Text(
                  "Start Workout",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
