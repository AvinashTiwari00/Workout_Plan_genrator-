import 'package:flutter/material.dart';
import 'package:college_project/models/user_models.dart';
import 'package:college_project/widgets/weekly_progress_header_card.dart';
import 'package:college_project/widgets/weekly_daily_activity_tile.dart';

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
            WeeklyProgressHeaderCard(completedDays: completedDays),

            const SizedBox(height: 30),

            // --------------------------------- PROGRESS LIST ---------------------------------
            const Text(
              "Daily Activity",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            ...user.weeklyProgress.entries.map((e) {
              return WeeklyDailyActivityTile(
                dayLabel: e.key,
                value: e.value,
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
