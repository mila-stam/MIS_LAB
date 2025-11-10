import 'package:flutter/material.dart';
import '../models/exam_model.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({required this.exam, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final isPassed = exam.dateTime.isBefore(DateTime.now());

    final gradientColors = isPassed
        ? [Colors.purple.shade100, Colors.purple.shade50]
        : [Colors.deepPurple.shade100, Colors.purple.shade50];

    final textColor = isPassed ? Colors.grey.shade800 : Colors.purple.shade900;

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.purple.withOpacity(0.4),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        splashColor: Colors.purpleAccent.withOpacity(0.3),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isPassed ? Icons.check_circle_outline : Icons.pending_actions,
                color: isPassed ? Colors.grey.shade700 : Colors.deepPurple,
                size: 26,
              ),
              SizedBox(height: 10),
              Text(
                exam.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                '${exam.dateTime.toLocal()}'.split(' ')[0],
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, size: 20, color: Colors.purple.shade700),
                  SizedBox(width: 6),
                  Text(
                    '${exam.examRooms.length} Location(s)',
                    style: TextStyle(
                      color: Colors.purple.shade700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
