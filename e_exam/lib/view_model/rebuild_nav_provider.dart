import 'package:flutter/cupertino.dart';

class NavigatorProvider with ChangeNotifier{

  int currentIndex = 0;

  void onTapItem(index) {

    currentIndex = index;
    notifyListeners();
  }



}