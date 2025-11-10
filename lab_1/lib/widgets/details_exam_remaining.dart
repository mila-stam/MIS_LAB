import 'package:flutter/material.dart';

class ExamRemainingTime extends StatelessWidget {
  final DateTime examDateTime;

  const ExamRemainingTime({super.key, required this.examDateTime});

  String get remainingTime {
    final now = DateTime.now();
    final difference = examDateTime.difference(now);

    if (difference.isNegative) return "Exam has passed";

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;

    String result = '';
    if (days > 0) result += '$days day${days > 1 ? 's' : ''} ';
    if (hours > 0) result += '$hours hour${hours > 1 ? 's' : ''} ';
    result += '$minutes minute${minutes > 1 ? 's' : ''} left';

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepPurpleAccent, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.schedule, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              remainingTime,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
