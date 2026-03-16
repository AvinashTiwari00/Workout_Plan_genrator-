import 'package:college_project/models/user_models.dart';
import 'package:college_project/models/workout_plan.dart';
import 'package:flutter/material.dart';

class UserInputScreen extends StatefulWidget {
  const UserInputScreen({super.key});

  @override
  State<UserInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final weightCtrl = TextEditingController();
  final heightCtrl = TextEditingController();

  String gender = "Male";
  String goal = "Muscle Gain";
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    // Add listeners to validate form on input change
    nameCtrl.addListener(_validateForm);
    ageCtrl.addListener(_validateForm);
    weightCtrl.addListener(_validateForm);
    heightCtrl.addListener(_validateForm);
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    ageCtrl.dispose();
    weightCtrl.dispose();
    heightCtrl.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isFormValid = nameCtrl.text.isNotEmpty &&
          ageCtrl.text.isNotEmpty &&
          weightCtrl.text.isNotEmpty &&
          heightCtrl.text.isNotEmpty;
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newUser = User(
        name: nameCtrl.text,
        weight: weightCtrl.text,
        thisWeek: 0,
        completed: 0,
        todayWorkout: "Chest Day",
        exercisesCount: 5,
        exercises: [
          "Barbell Bench Press",
          "Incline Dumbbell Press",
          "Decline Bench Press",
          "Chest Fly Machine",
          "Push-Ups",
        ],
        weeklyProgress: {
          "Mon": 0, "Tue": 0, "Wed": 0, "Thu": 0, "Fri": 0, "Sat": 0, "Sun": 0,
        },
        goal: _getGoal(goal),
      );
      Navigator.pushNamed(context, '/dashboard', arguments: newUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FC),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWeb = constraints.maxWidth > 600;
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                children: [
                  _buildHeader(isWeb),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: isWeb ? 30 : 20, 
                        vertical: 20
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle("Personal Information"),
                            const SizedBox(height: 15),
                            _buildPersonalInfoCard(isWeb),
                            const SizedBox(height: 30),
                            
                            _buildSectionTitle("Gender"),
                            const SizedBox(height: 15),
                            _buildGenderSelection(),
                            const SizedBox(height: 30),

                            _buildSectionTitle("Goal"),
                            const Text(
                              "Choose what you want to focus on",
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            const SizedBox(height: 15),
                            _buildGoalSelection(),
                            
                            const SizedBox(height: 40),
                            // On web, we put button here. On mobile, it's sticky.
                            if (isWeb) _buildContinueButton(),
                            if (isWeb) const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // On mobile, sticky button at bottom
                  if (!isWeb)
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, -4),
                          )
                        ],
                      ),
                      child: SafeArea(child: _buildContinueButton()),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(bool isWeb) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        22, 
        isWeb ? 30 : 60, // Less top padding on web/desktop if centered, or adjusted for status bar on mobile
        22, 
        25
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade900],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Step 1 of 3 • Personal Details", 
            style: TextStyle(
              color: Colors.white70, 
              fontSize: 12, 
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Let’s Get Started", 
            style: TextStyle(
              fontSize: 26, 
              fontWeight: FontWeight.w800, 
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18, 
        fontWeight: FontWeight.bold, 
        color: Colors.black87
      ),
    );
  }

  Widget _buildPersonalInfoCard(bool isWeb) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          _buildInput("Full Name", nameCtrl, Icons.person),
          const SizedBox(height: 16),
          if (isWeb)
            Row(
              children: [
                Expanded(child: _buildInput("Age", ageCtrl, Icons.cake, type: TextInputType.number)),
                const SizedBox(width: 12),
                Expanded(child: _buildInput("Weight (kg)", weightCtrl, Icons.monitor_weight, type: TextInputType.number)),
                const SizedBox(width: 12),
                Expanded(child: _buildInput("Height (cm)", heightCtrl, Icons.height, type: TextInputType.number)),
              ],
            )
          else 
            Column(
              children: [
                 _buildInput("Age", ageCtrl, Icons.cake, type: TextInputType.number),
                 const SizedBox(height: 16),
                 Row(
                   children: [
                     Expanded(child: _buildInput("Weight (kg)", weightCtrl, Icons.monitor_weight, type: TextInputType.number)),
                     const SizedBox(width: 12),
                     Expanded(child: _buildInput("Height (cm)", heightCtrl, Icons.height, type: TextInputType.number)),
                   ],
                 )
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController ctrl, IconData icon, {TextInputType type = TextInputType.text}) {
    return TextFormField(
      controller: ctrl,
      keyboardType: type,
      validator: (v) => v!.isEmpty ? "Required" : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue.shade700, size: 20),
        filled: true,
        fillColor: const Color(0xFFF8F9FD),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), 
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), 
          borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), 
          borderSide: BorderSide(color: Colors.red.shade400),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), 
          borderSide: BorderSide(color: Colors.red.shade400, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: ["Male", "Female", "Other"].map((g) {
          final isSelected = gender == g;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => gender = g),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.shade700 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    g,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGoalSelection() {
    return Column(
      children: [
        _buildGoalOption("Muscle Gain", "Build stronger muscles", "💪"),
        const SizedBox(height: 12),
        _buildGoalOption("Fat Loss", "Burn fat and get lean", "🔥"),
        const SizedBox(height: 12),
        _buildGoalOption("Stay Fit", "Maintain current weight", "⚖️"),
      ],
    );
  }

  Widget _buildGoalOption(String title, String subtitle, String icon) {
    bool isSelected = goal == title;
    return GestureDetector(
      onTap: () => setState(() => goal = title),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.blue.shade700 : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
             BoxShadow(
              color: isSelected ? Colors.blue.shade100.withOpacity(0.5) : Colors.grey.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 50, width: 50,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue.shade50 : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text(icon, style: const TextStyle(fontSize: 24))),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.blue.shade700 : Colors.black87
                  )),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(
                    color: Colors.grey, 
                    fontSize: 13
                  )),
                ],
              ),
            ),
            if (isSelected) 
              Icon(Icons.check_circle, color: Colors.blue.shade700)
            else
              Icon(Icons.circle_outlined, color: Colors.grey.shade300),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _isFormValid ? _submit : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade800,
          disabledBackgroundColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: _isFormValid ? 8 : 0,
        ),
        child: const Text(
          "Continue",
          style: TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  UserGoal _getGoal(String selection) {
    switch (selection) {
      case "Muscle Gain": return UserGoal.muscleGain;
      case "Fat Loss": return UserGoal.fatLoss;
      case "Stay Fit": return UserGoal.maintenance;
      default: return UserGoal.muscleGain;
    }
  }
}
