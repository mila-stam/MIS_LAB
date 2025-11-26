import 'package:flutter/material.dart';

import '../models/exam_model.dart';
import 'exam_card.dart';


class ExamGrid extends StatelessWidget{
  final List<Exam> exams;
  final void Function(Exam) onExamTap;

  ExamGrid({required this.exams, required this.onExamTap});

  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2 / 2
      ),
      itemCount: exams.length,
      itemBuilder: (context, index){
        final exam = exams[index];
        return ExamCard(
          exam: exam,
          onTap: () => onExamTap(exam),
        );
      },
    );

  }


}