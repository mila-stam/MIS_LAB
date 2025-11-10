import 'package:flutter/material.dart';
import 'package:lab_1/screens/details.dart';
import 'package:lab_1/widgets/exam_grid.dart';
import '../models/exam_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Exam> exams = [
    Exam(
      name: 'Introduction to Programming',
      dateTime: DateTime(2025, 10, 15, 9, 0),
      examRooms: ['Room IP101'],
    ),
    Exam(
      name: 'Mathematics Fundamentals',
      dateTime: DateTime(2025, 10, 20, 13, 30),
      examRooms: ['Room MTH101', 'Room MTH102'],
    ),
    Exam(
      name: 'Machine Learning',
      dateTime: DateTime(2025, 12, 15, 10, 0),
      examRooms: ['Room ML101', 'Room ML102'],
    ),
    Exam(
      name: 'Basics of Web Design',
      dateTime: DateTime(2025, 12, 23, 17, 0),
      examRooms: ['Room BW101'],
    ),
    Exam(
      name: 'Artificial Intelligence',
      dateTime: DateTime(2025, 12, 13, 14, 30),
      examRooms: ['Room AI201'],
    ),
    Exam(
      name: 'Cybersecurity',
      dateTime: DateTime(2025, 12, 21, 18, 30),
      examRooms: ['Room CY101'],
    ),
    Exam(
      name: 'Database Systems',
      dateTime: DateTime(2025, 11, 1, 11, 0),
      examRooms: ['Room DB101'],
    ),
    Exam(
      name: 'Operating Systems',
      dateTime: DateTime(2025, 11, 5, 15, 0),
      examRooms: ['Room CS301', 'Room CS302'],
    ),
    Exam(
      name: 'Compiler Design',
      dateTime: DateTime(2025, 12, 17, 9, 30),
      examRooms: ['Room CD301'],
    ),
    Exam(
      name: 'Software Engineering',
      dateTime: DateTime(2025, 12, 11, 11, 0),
      examRooms: ['Room SE101'],
    ),
    Exam(
      name: 'Algorithms',
      dateTime: DateTime(2025, 12, 3, 14, 0),
      examRooms: ['Room CS201'],
    ),
    Exam(
      name: 'Advanced Web Design',
      dateTime: DateTime(2025, 12, 19, 13, 30),
      examRooms: ['Room AW101'],
    ),
    Exam(
      name: 'Computer Networks',
      dateTime: DateTime(2025, 12, 9, 9, 0),
      examRooms: ['Room CN201', 'Room CN202'],
    ),
    Exam(
      name: 'Data Structures',
      dateTime: DateTime(2025, 12, 1, 9, 0),
      examRooms: ['Room CS101', 'Room CS102'],
    ),
  ];

  late final sortedExams = List<Exam>.from(exams)
    ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        elevation: 8,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Icon(Icons.school_rounded, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Exam Schedule - 223057',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: ExamGrid(
                  exams: sortedExams,
                  onExamTap: (exam) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailsScreen(exam: exam)),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month, color: Colors.white, size: 22),
            SizedBox(width: 8),
            Text(
              'Total exams: ',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Text(
                exams.length.toString(),
                style: TextStyle(
                  color: Colors.purple.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
