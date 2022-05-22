import 'package:e_exam/shared/button.dart';
import 'package:e_exam/view/app_start_screen.dart';
import 'package:e_exam/view/login_screen.dart';
import 'package:e_exam/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_provider.dart';



class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);
  static const routeName = 'intro';

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AuthProvider>(context,listen: false).autoLogIn();
    });

  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context,);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: deviceSize.width * .05,
                top: deviceSize.height * .05,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: deviceSize.height * .1,
                      child: Image.asset(
                        'assest/logo.webp',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              'assest/start.jpg',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
            ),
            SizedBox(
              height: deviceSize.height * .025,
            ),
            Text(
              'Hello !',
              style: TextStyle(
                fontSize: deviceSize.height * .04,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: deviceSize.height * .022,
            ),

            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: deviceSize.width * .04),
              child: RichText(
                textScaleFactor: 1.1,

                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Online examination tests provide ',
                      style: TextStyle(letterSpacing: 1,
                        height: deviceSize.height*.0018,
                        color: Colors.black,
                        fontSize: deviceSize.height * .018,
                      ),
                    ),
                    TextSpan(
                      text: 'flexibility ',
                      style: TextStyle(
                        height: deviceSize.height*.0015,

                        letterSpacing: 1,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: deviceSize.height * .018,
                      ),
                    ),
                    TextSpan(
                      text: 'to educational institutes to ',
                      style: TextStyle(
                        height: deviceSize.height*.0015,

                        letterSpacing: 1,
                        color: Colors.black,
                        fontSize: deviceSize.height * .018,
                      ),
                    ),
                    TextSpan(
                      text: 'create',
                      style: TextStyle(
                        height: deviceSize.height*.0015,

                        letterSpacing: 1,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: deviceSize.height * .018,
                      ),
                    ),
                    TextSpan(
                      text: ', ',
                      style: TextStyle(
                        height: deviceSize.height*.0015,

                        letterSpacing: 1,
                        color: Colors.black,
                        fontSize: deviceSize.height * .018,
                      ),
                    ),
                    TextSpan(
                      text: 'manage ',
                      style: TextStyle(
                        height: deviceSize.height*.0015,

                        letterSpacing: 1,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: deviceSize.height * .018,
                      ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        height: deviceSize.height*.0015,

                        letterSpacing: 1,
                        color: Colors.black,
                        fontSize: deviceSize.height * .018,
                      ),
                    ),
                    TextSpan(
                      text: ' evaluate ',
                      style: TextStyle(
                        height: deviceSize.height*.0015,

                        letterSpacing: 1,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: deviceSize.height * .018,
                      ),
                    ),
                    TextSpan(
                      text: 'examinees effortlessly',
                      style: TextStyle(
                        height: deviceSize.height*.0015,

                        letterSpacing: 1,
                        color: Colors.black,
                        fontSize: deviceSize.height * .018,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * .05,
            ),
            CustomButton(
              name: 'LOGIN',
              fontSize: deviceSize.height * .03,
              buttonHeight: deviceSize.height * .07,
              buttonWidth: deviceSize.width * .7,
              buttonColor: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
              page2: authProvider.isLoggedIn? AppStartScreen(): LoginScreen(),
              page1: Intro(),

            ),
            SizedBox(
              height: deviceSize.height * .02,
            ),
            CustomButton(
              name: 'SIGNUP',
              fontSize: deviceSize.height * .03,
              buttonHeight: deviceSize.height * .07,
              buttonWidth: deviceSize.width * .7,
              buttonColor: Colors.white,
              textColor: Colors.black,
              page2: SignupScreen(),
              page1: Intro(),
            ),
          ],
        ),
      ),
    );
  }
}
