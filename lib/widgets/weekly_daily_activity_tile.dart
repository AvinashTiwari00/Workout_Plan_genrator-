import 'package:flutter/material.dart';

class WeeklyDailyActivityTile extends StatelessWidget {
  final String dayLabel;
  final int value;

  const WeeklyDailyActivityTile({
    super.key,
    required this.dayLabel,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = value == 1;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor:
                isCompleted ? Colors.green.shade100 : Colors.grey.shade200,
            child: Icon(
              isCompleted ? Icons.check : Icons.close,
              color:
                  isCompleted ? Colors.green.shade600 : Colors.red.shade400,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            dayLabel,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 150,
            child: LinearProgressIndicator(
              value: value.toDouble(),
              color: isCompleted ? Colors.green.shade600 : Colors.grey.shade400,
              backgroundColor: Colors.grey.shade200,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}

