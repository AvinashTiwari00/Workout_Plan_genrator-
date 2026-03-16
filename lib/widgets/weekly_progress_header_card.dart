import 'package:flutter/material.dart';

class WeeklyProgressHeaderCard extends StatelessWidget {
  final int completedDays;

  const WeeklyProgressHeaderCard({
    super.key,
    required this.completedDays,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

