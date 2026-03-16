import 'package:flutter/foundation.dart';
import 'package:college_project/models/workout_plan.dart';
import 'package:college_project/services/workout_plan_service.dart';

class WorkoutProvider extends ChangeNotifier {
  WorkoutPlan? _currentPlan;
  final WorkoutPlanService _service = WorkoutPlanService();

  WorkoutPlan? get currentPlan => _currentPlan;

  void generatePlan(UserGoal goal) {
    _currentPlan = _service.generatePlan(goal);
    notifyListeners();
  }

  void clearPlan() {
    _currentPlan = null;
    notifyListeners();
  }
}

