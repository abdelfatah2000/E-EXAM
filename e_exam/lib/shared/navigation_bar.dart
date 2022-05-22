import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/rebuild_nav_provider.dart';

class CustomNavigationBar extends StatelessWidget {
   const CustomNavigationBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final deviceSize =MediaQuery.of(context).size;
    final navProvider=Provider.of<NavigatorProvider>(context,);

    return  CurvedNavigationBar(
      items:  [
        Icon(Icons.home_filled),
        Icon(Icons.explore_outlined,),
        Icon(Icons.document_scanner_outlined),
        Icon(Icons.access_time_rounded),
        Icon(Icons.account_circle_outlined),
      ],
      buttonBackgroundColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primary,
      index: navProvider.currentIndex,
      animationDuration: const Duration(milliseconds: 500),
      animationCurve: Curves.easeInBack,
      onTap: (index) => navProvider.onTapItem(index),
    );
  }
}
