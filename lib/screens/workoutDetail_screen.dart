import 'package:flutter/material.dart';
import 'package:college_project/models/workout_plan.dart';

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
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        // Left side details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exercises[index].name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "${exercises[index].sets} sets • ${exercises[index].reps} reps",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Right side — Image
                        Container(
                          height: 70,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage("assets/images/ex_${index + 1}.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
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
