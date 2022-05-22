import 'package:e_exam/model/exam.dart';
import 'package:flutter/cupertino.dart';
class ExamProvider with ChangeNotifier {
  final List<Exam> _exams=[
  ];

  List<Exam> get exams{
    return [..._exams];
  }



}