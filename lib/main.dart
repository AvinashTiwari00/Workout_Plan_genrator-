import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/user_input_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/workout_categories_screen.dart';
import 'screens/workoutDetail_screen.dart';
import 'models/menu_item.dart';
import 'utils/route_logger.dart';

void main() {
  runApp(const WorkoutApp());
}

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [RouteLogger()],
      debugShowCheckedModeBanner: false,
      title: "Workout Plan Generator",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/user-input': (context) => const UserInputScreen(),
        '/categories': (context) => const WorkoutCategoriesScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/dashboard') {
           final args = settings.arguments;
           // Handle case where args might be null or not a User object if navigated incorrectly, 
           // though in this flow it should be passed. 
           // For simplicity in this refactor, if args is null we might need a fallback or let it error if strict.
           // However, DashboardScreen requires a user. 
           // Let's assume correct usage for now or check type.
           if (args != null) {
              // We need to import User model to cast, or just dynamic. 
              // DashboardScreen takes a User. 
              // Since we didn't import User here, let's defer casting to the builder or assume dynamic works 
              // but implicit casting might fail in Dart 2.12+.
              // Ideally imports should be clean.
              return MaterialPageRoute(
                builder: (context) => DashboardScreen(user: args as dynamic),
                settings: settings,
              );
           }
        } else if (settings.name == '/workout-detail') {
          final args = settings.arguments as MenuItem;
          return MaterialPageRoute(
            builder: (context) => WorkoutDetailScreen(
              workoutName: args.title,
              exercises: (args.arguments as Map<String, dynamic>)['exercises'],
              exercisesCount: (args.arguments as Map<String, dynamic>)['exercisesCount'],
            ),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}
