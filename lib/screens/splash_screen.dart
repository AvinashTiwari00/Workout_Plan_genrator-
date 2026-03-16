import 'package:flutter/material.dart';
import 'package:college_project/database/database_helper.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _checked = false;

  @override
  void initState() {
    super.initState();
    _startCheck();
  }

  Future<void> _startCheck() async {
    if (_checked) return;
    _checked = true;

    // Small delay so navigation happens after first frame
    await Future.delayed(const Duration(seconds: 1));

    try {
      final exists = await DatabaseHelper.instance.userExists();

      if (!mounted) return;

      if (exists) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignupScreen()),
        );
      }
    } catch (e) {
      debugPrint('Splash auth error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.fitness_center,
              size: 72,
              color: Colors.blue,
            ),
            SizedBox(height: 16),
            Text(
              "Workout Plan Generator",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

