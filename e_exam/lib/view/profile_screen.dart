
import 'package:e_exam/view/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static String routeName = 'profile';


  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final bodyHeight = deviceSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final bodyWidth = deviceSize.width;
    final textSize = MediaQuery.of(context).textScaleFactor;
    final authProvider = Provider.of<AuthProvider>(context,);


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: deviceSize.height * .1,

        elevation: .05,
        shadowColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: textSize*23,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: bodyWidth*.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: bodyHeight * .15,
                color: Colors.white,
                child: Column(
                  children: [

                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assest/prof.png',
                          ),
                          radius: 35,
                        ),
                        SizedBox(width: bodyWidth * .05),
                        Text(
                          'Jonathan doe',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: textSize * 17,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    dense:true,

                    horizontalTitleGap: 0,
                    leading: Icon(
                      Icons.local_phone_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text('Phone',style: TextStyle(color: Colors.grey,fontSize: textSize*14),),
                    subtitle: Text('01286241234',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,letterSpacing: .5,fontSize: textSize*15,),),
                  ),
                  ListTile(
                    dense:true,

                    horizontalTitleGap: 0,
                    leading: Icon(
                      Icons.email_rounded,
                      color: Theme.of(context).colorScheme.primary,

                    ),
                    title: Text('Mail',style: TextStyle(color: Colors.grey,fontSize: textSize*14),),
                    subtitle: Text('zamalek.545r5@gmail.com',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,letterSpacing: .5,fontSize: textSize*15,),),
                  ),
                  ListTile(
                    dense:true,
                    horizontalTitleGap: 0,
                    leading: Icon(
                      Icons.set_meal_sharp,
                      color: Theme.of(context).colorScheme.primary,

                    ),
                    title: Text('Level',style: TextStyle(color: Colors.grey,fontSize: textSize*14),),
                    subtitle: Text('A',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,letterSpacing: .5,fontSize: textSize*15,),),
                  ),
                  ListTile(
                    dense:true,

                    horizontalTitleGap: 0,
                    leading: Icon(

                      Icons.view_sidebar,
                      color: Theme.of(context).colorScheme.primary,

                    ),
                    title: Text('ID',style: TextStyle(color: Colors.grey,fontSize: textSize*14),),
                    subtitle: Text('123465',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,letterSpacing: .5,fontSize: textSize*15,),),
                  ),
                  SizedBox(
                    height: bodyHeight*.04,
                  ),
                  SizedBox(
                    width: bodyWidth*.92,
                      height: bodyHeight*.06,
                      child: ElevatedButton(onPressed: (){
                        authProvider.logout();
                        Navigator.of(context).pushReplacement(PageTransition(child: Intro(), type: PageTransitionType.rightToLeft ),);
                      }, child:const Text('Log out',), ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
