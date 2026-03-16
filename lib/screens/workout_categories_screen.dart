import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:college_project/models/menu_item.dart';
import 'package:college_project/models/user_models.dart';
import 'package:college_project/models/workout_plan.dart';
import 'package:college_project/providers/user_provider.dart';
import 'package:college_project/providers/workout_provider.dart';

class WorkoutCategoriesScreen extends StatelessWidget {
  const WorkoutCategoriesScreen({super.key});

  List<MenuItem> _getMenuItems(WorkoutPlan plan) {
    
    final Map<String, String> imageAssets = {
      "Chest": "https://cdn.iconscout.com/icon/premium/png-256-thumb/chest-muscle-icon-svg-download-png-7077023.png",
      "Back": "https://cdn.iconscout.com/icon/premium/png-256-thumb/back-muscle-icon-svg-download-png-7077031.png?f=webp",
      "Shoulders": "https://cdn.iconscout.com/icon/premium/png-256-thumb/shoulder-muscle-icon-svg-download-png-7077024.png",
      "Legs": "https://cdn.iconscout.com/icon/premium/png-256-thumb/lower-leg-muscle-icon-svg-download-png-7077035.png",
      "Abs": "https://cdn.iconscout.com/icon/premium/png-256-thumb/abdominals-icon-svg-download-png-7077028.png",
      "Cardio": "https://cdn-icons-png.flaticon.com/512/2548/2548537.png",
      "Whole Body": "https://cdn-icons-png.flaticon.com/512/3043/3043216.png",
    };

    return plan.schedule.map((day) {
       // Simple heuristic to pick image: check first muscle group
       String? imageUrl;
       for (var muscle in day.muscleGroups) {
         if (imageAssets.containsKey(muscle)) {
           imageUrl = imageAssets[muscle];
           break;
         }
       }
       // Fallback logic
       if (imageUrl == null) {
          if (day.name.contains("Upper")) imageUrl = imageAssets["Chest"];
          else if (day.name.contains("Lower")) imageUrl = imageAssets["Legs"];
          else if (day.name.contains("Full")) imageUrl = imageAssets["Whole Body"];
          else imageUrl = "https://cdn-icons-png.flaticon.com/512/3043/3043216.png";
       }

      return MenuItem(
        title: day.name,
        route: '/workout-detail',
        screenName: 'WorkoutDetailScreen',
        imageUrl: imageUrl,
        arguments: {
          'exercises': day.exercises,
          'exercisesCount': day.exercises.length,
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    final workoutProvider = context.watch<WorkoutProvider>();

    // Ensure we have a plan generated for current user goal
    if (user != null && workoutProvider.currentPlan == null) {
      workoutProvider.generatePlan(user.goal);
    }

    final plan = workoutProvider.currentPlan;
    final menuItems = plan != null ? _getMenuItems(plan) : <MenuItem>[];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Workout Categories", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: menuItems.map((item) {
          return GestureDetector(
            onTap: () {
              // Log the menu click
              debugPrint('''
Menu Item Clicked
Title: ${item.title}
Route: ${item.route}
Screen Name: ${item.screenName}
''');

              Navigator.pushNamed(
                context,
                item.route,
                arguments: item,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 22),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.blue.shade50],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade200.withOpacity(0.35),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Title and exercise count
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 18, 0, 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade700.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "${(item.arguments as Map)['exercisesCount']} Exercises",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue.shade700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              const Text(
                                "View Workout",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue.shade700),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Image on right side
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      item.imageUrl ?? "",
                      width: 125,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                        const Icon(Icons.image_not_supported, size: 40),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
