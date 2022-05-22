import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthProvider with ChangeNotifier{

late String? _token;
late String? _refreshToken;
  Map _refreshData={};

static Map<String,dynamic>? tryParseJwt(String refresh){
  if(refresh.isEmpty)return null;
     final parts=refresh.split('.');
  if(parts.length !=3){
    return null;
  }
  final payload= parts[1];
  var normalized = base64Url.normalize(payload);
  var resp = utf8.decode(base64Url.decode(normalized));
  final payloadMap = json.decode(resp);
  if (payloadMap is! Map<String, dynamic>) {
    return null;
  }
  return payloadMap;

}


  Future<void> signUp(String firstName,String lastName,String phone,String email,String password,String level)async{

    if(level=='1'){
      level='F';
    }
    else if(level=='2'){
      level='S';
    }
    else if(level=='3'){
      level='T';
    }

const url='https://ee-exam.herokuapp.com/api/user/student/';
final response=await http.post(Uri.parse(url,),body: json.encode(<String,dynamic>{
  'user':{
    'first_name':firstName,
    'last_name':lastName,
    'phone':phone,
    'email':email,
    'password':password,
  },
  'level':level,
},),headers: {'Content-Type':'application/json'});

print('everything is here :${jsonDecode(response.body)}',);
print('status code: ${response.statusCode}');

notifyListeners();
  }
 late SharedPreferences pref;

  Future<void> login(String email,String password)async{


    const url='https://ee-exam.herokuapp.com/api/auth/jwt/create';
    final response=await http.post(Uri.parse(url,),body: json.encode(<String,String>{

      'email':email,
      'password':password,

    }),headers: {'Content-Type':'application/json'});
    List data = [
     await jsonDecode(response.body)
    ];
    _token=data[0]['access'] ;
    _refreshToken=data[0]['refresh'];
    pref=await SharedPreferences.getInstance();
    pref.setString('token', _token!);
    pref.setString('refresh', _refreshToken!);

    print('everything is here :${await jsonDecode(response.body)}',);
    print('status code: ${response.statusCode}');

     _refreshData= tryParseJwt(_refreshToken!)!;



    notifyListeners();
  }

String? get token{
  if(_refreshData['exp'] !=null&&_refreshData['exp']<DateTime.now().millisecondsSinceEpoch&& _token !=null) {
    return _token;
  }
return null;
}
bool get isAuth{
    return token !=null;
}

bool isLoggedIn = false;

void autoLogIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userToken = prefs.getString('token');

  if (userToken != null)
    isLoggedIn = true;

  notifyListeners();

  }
  Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    isLoggedIn = false;
    notifyListeners();
  }
}
