import 'package:e_exam/model/student.dart';
import 'package:flutter/cupertino.dart';

class StudentsProvider with ChangeNotifier{

  //all of students

 final List<Student> _items=[];

  List<Student> get items{

    return [..._items];
  }


}