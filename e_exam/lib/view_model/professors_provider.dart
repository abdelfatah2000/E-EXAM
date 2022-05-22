import 'dart:convert';

import 'package:e_exam/model/professor.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfessorsProvider with ChangeNotifier{

  // all of professors
  final List<AllProfessors> _items=[];


  List<AllProfessors> get items{
    return [..._items];
  }

  Future<void> getAllProfessors()async {

    const url='https://ee-exam.herokuapp.com/api/user/get_professors/';
    final pref =await SharedPreferences.getInstance();
    final token=pref.getString('token');
    final response=await http.get(Uri.parse(url,),headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token' ,
      'Content-Type': 'application/json',
    });
    final extractedData=await json.decode(response.body);
    print(extractedData);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print('good');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

notifyListeners();
    // print(response.body);
    // print(response.statusCode);
  }


  // headers: {
  // Authorization: Cookies.get('access_token')
  // ? 'JWT ' + Cookies.get('access_token')
  //     : null,
  // 'Content-Type': 'application/json',
  // accept: 'application/json',
  // },

}