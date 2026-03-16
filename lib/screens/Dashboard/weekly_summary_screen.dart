import 'package:flutter/material.dart';
import 'package:college_project/models/user_models.dart';

class WeeklySummaryScreen extends StatelessWidget {
  final User user;
  const WeeklySummaryScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    int completedDays = user.weeklyProgress.values.where((e) => e == 1).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text("Weekly Summary"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Text(
                    "$completedDays / 7 Days Completed",
                    style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Consistency builds strength — keep going! 🔥",
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Icon(Icons.emoji_events, size: 100, color: Colors.amber.shade600),
            const SizedBox(height: 10),
            Text(
              completedDays >= 4
                  ? "🏆 You earned this week's achievement!"
                  : "✨ Keep working — achievement unlocks at 4 days!",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
