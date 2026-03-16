import 'package:flutter/material.dart';
import 'package:college_project/models/user_models.dart';

class WeeklyProgressScreen extends StatelessWidget {
  final User user;
  const WeeklyProgressScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    int completedDays = user.weeklyProgress.values.where((v) => v == 1).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text("Weekly Progress"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // --------------------------------- HEADER SUMMARY CARD ---------------------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade600, Colors.blue.shade900],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade200.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "This Week's Score",
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "$completedDays / 7 Days Completed 🎯",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: completedDays / 7,
                    backgroundColor: Colors.white24,
                    color: Colors.white,
                    minHeight: 9,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --------------------------------- PROGRESS LIST ---------------------------------
            const Text(
              "Daily Activity",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            ...user.weeklyProgress.entries.map((e) {
              final bool isCompleted = e.value == 1;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: isCompleted ? Colors.green.shade100 : Colors.grey.shade200,
                      child: Icon(
                        isCompleted ? Icons.check : Icons.close,
                        color: isCompleted ? Colors.green.shade600 : Colors.red.shade400,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      e.key,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      child: LinearProgressIndicator(
                        value: e.value.toDouble(),
                        color: isCompleted ? Colors.green.shade600 : Colors.grey.shade400,
                        backgroundColor: Colors.grey.shade200,
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),

            const SizedBox(height: 30),

            // --------------------------------- MOTIVATIONAL CARD ---------------------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.amber.shade600,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.shade200.withOpacity(0.6),
                    blurRadius: 12,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  "🔥 Amazing consistency this week — Keep grinding!",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
