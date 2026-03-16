import 'package:college_project/database/database_helper.dart';
import 'package:college_project/models/user_models.dart';
import 'package:college_project/models/workout_plan.dart';
import 'package:college_project/providers/user_provider.dart';
import 'package:college_project/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final data = await DatabaseHelper.instance.loginUser(
      _nameCtrl.text.trim(),
      _passwordCtrl.text.trim(),
    );

    setState(() => _isLoading = false);

    if (data == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials')),
      );
      return;
    }

    // Map DB user row into existing User model with defaults where needed
    final user = User(
      name: data['name'] as String? ?? '',
      weight: (data['weight'] ?? '').toString(),
      thisWeek: 0,
      completed: 0,
      todayWorkout: "Chest Day",
      exercisesCount: 5,
      exercises: const [
        "Barbell Bench Press",
        "Incline Dumbbell Press",
        "Decline Bench Press",
        "Chest Fly Machine",
        "Push-Ups",
      ],
      weeklyProgress: const {
        "Mon": 0,
        "Tue": 0,
        "Wed": 0,
        "Thu": 0,
        "Fri": 0,
        "Sat": 0,
        "Sun": 0,
      },
      goal: UserGoal.muscleGain,
    );

    if (!mounted) return;

    context.read<UserProvider>().setUser(user);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => DashboardScreen(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter your name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordCtrl,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter your password' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Login'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
                  );
                },
                child: const Text('Create account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

