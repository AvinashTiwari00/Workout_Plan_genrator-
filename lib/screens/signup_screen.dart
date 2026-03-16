import 'package:college_project/database/database_helper.dart';
import 'package:college_project/models/user_models.dart';
import 'package:college_project/models/workout_plan.dart';
import 'package:college_project/providers/user_provider.dart';
import 'package:college_project/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();
  final _heightCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _goalCtrl = TextEditingController();
  final _experienceCtrl = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _passwordCtrl.dispose();
    _ageCtrl.dispose();
    _heightCtrl.dispose();
    _weightCtrl.dispose();
    _goalCtrl.dispose();
    _experienceCtrl.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final userMap = {
      'name': _nameCtrl.text.trim(),
      'password': _passwordCtrl.text.trim(),
      'age': int.tryParse(_ageCtrl.text.trim()) ?? 0,
      'height': double.tryParse(_heightCtrl.text.trim()) ?? 0.0,
      'weight': double.tryParse(_weightCtrl.text.trim()) ?? 0.0,
      'goal': _goalCtrl.text.trim(),
      'experience_level': _experienceCtrl.text.trim(),
    };

    await DatabaseHelper.instance.createUser(userMap);

    setState(() => _isLoading = false);

    // Map into existing User model for dashboard
    final user = User(
      name: userMap['name'] as String,
      weight: userMap['weight'].toString(),
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
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordCtrl,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter a password' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ageCtrl,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _heightCtrl,
                decoration: const InputDecoration(labelText: 'Height'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _weightCtrl,
                decoration: const InputDecoration(labelText: 'Weight'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _goalCtrl,
                decoration: const InputDecoration(labelText: 'Goal'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _experienceCtrl,
                decoration:
                    const InputDecoration(labelText: 'Experience Level'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _signup,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

