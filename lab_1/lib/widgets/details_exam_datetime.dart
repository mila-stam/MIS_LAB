import 'package:flutter/material.dart';

class ExamDateTime extends StatelessWidget {
  final DateTime dateTime;

  const ExamDateTime({super.key, required this.dateTime});

  String get formattedDateTime {
    return '${dateTime.year.toString().padLeft(4, '0')}-'
        '${dateTime.month.toString().padLeft(2, '0')}-'
        '${dateTime.day.toString().padLeft(2, '0')} '
        '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_month, color: Colors.deepPurple),
          const SizedBox(width: 10),
          Text(
            'Date & Time: $formattedDateTime',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
