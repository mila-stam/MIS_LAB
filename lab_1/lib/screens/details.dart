import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/details_exam_datetime.dart';
import '../widgets/details_exam_name.dart';
import '../widgets/details_exam_remaining.dart';
import '../widgets/details_exam_rooms.dart';

class DetailsScreen extends StatelessWidget {
  final Exam exam;

  const DetailsScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        elevation: 8,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            const Icon(Icons.menu_book_rounded, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                exam.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExamName(name: exam.name),
            const SizedBox(height: 16),
            ExamDateTime(dateTime: exam.dateTime),
            const SizedBox(height: 24),
            ExamRooms(rooms: exam.examRooms),
            const SizedBox(height: 24),
            ExamRemainingTime(examDateTime: exam.dateTime),
          ],
        ),
      ),
    );
  }
}
