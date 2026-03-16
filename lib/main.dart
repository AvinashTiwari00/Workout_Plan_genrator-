import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/user_input_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/workout_categories_screen.dart';
import 'screens/workoutDetail_screen.dart';
import 'models/menu_item.dart';
import 'models/user_models.dart';
import 'providers/user_provider.dart';
import 'providers/workout_provider.dart';
import 'utils/route_logger.dart';

void main() {
  runApp(const WorkoutApp());
}

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
      ],
      child: MaterialApp(
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
            return MaterialPageRoute(
              builder: (context) {
                final user = context.read<UserProvider>().user;
                if (user == null) {
                  // If somehow we reach dashboard without a user, send back to input
                  return const UserInputScreen();
                }
                return DashboardScreen(user: user);
              },
              settings: settings,
            );
          } else if (settings.name == '/workout-detail') {
            final args = settings.arguments as MenuItem;
            return MaterialPageRoute(
              builder: (context) => WorkoutDetailScreen(
                workoutName: args.title,
                exercises: (args.arguments as Map<String, dynamic>)['exercises'],
                exercisesCount:
                    (args.arguments as Map<String, dynamic>)['exercisesCount'],
              ),
              settings: settings,
            );
          }
          return null;
        },
      ),
    );
  }
}

