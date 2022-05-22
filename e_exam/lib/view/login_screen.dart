import 'dart:async';

import 'package:e_exam/view/app_start_screen.dart';
import 'package:e_exam/view/signup_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isLoading=false;
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    Map<String, dynamic> authData = {

      'email': _emailController.text,
      'password': _passwordController.text,
    };
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Image.asset(
                  'assest/login.jpg',
                  filterQuality: FilterQuality.low,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: deviceSize.height * .02,
              ),

              Column(
                children: [
                  CircleAvatar(
                    radius: deviceSize.height * .05,
                    backgroundImage: const AssetImage(
                      'assest/men5.png',
                    ),
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    height: deviceSize.height * .01,
                  ),

                  Text(
                    'E-EXAM',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: deviceSize.height * .03,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: deviceSize.height * .01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: deviceSize.width * .05,
                ),
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        width: deviceSize.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'E-mail',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: deviceSize.height * .022,
                              ),
                            ),
                            SizedBox(
                              height: deviceSize.height * .012,
                            ),
                            TextFormField(
                              controller: _emailController,
                              enableSuggestions: true,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Example@address.com',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    4,
                                  ),
                                ),
                              ),
                              validator: (email){
                                email != null && !EmailValidator.validate(email)?
                                'Enter a valid email' : null;
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: deviceSize.height * .03,
                      ),
                      SizedBox(
                        width: deviceSize.width,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: deviceSize.height * .022,
                              ),
                            ),
                            SizedBox(
                              height: deviceSize.height * .012,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    4,
                                  ),
                                ),
                              ),
                              validator: (pass){
                                if(pass !=null&& pass.length<7){
                                  return 'Enter min. 7 characters';
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: deviceSize.height * .04,
                      ),
                      SizedBox(
                        width: deviceSize.width*.9,
                        height: deviceSize.height * .055,
                        child:_isLoading? Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary,)): ElevatedButton(
                            onPressed: (){

                              final isValidForm=formKey.currentState!.validate();

                              if (isValidForm){
                                authProvider.login(
                                  authData['email'].toString(),
                                  authData['password'].toString(),
                                );
                                Timer(Duration(seconds: 5), () {
                                  if( authProvider.isAuth){

                                    Navigator.pushReplacement(context,PageTransition(child:  AppStartScreen(), type: PageTransitionType.rightToLeft),);
                                  }else
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something wrong has happened'),),);

                                });

                                // Navigator.of(context).pushReplacementNamed(authProvider.isAuth?AppStartScreen.routeName :LoginScreen.routeName );
                              }

                            },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceSize.height * .018,
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4,),),),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: deviceSize.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: deviceSize.width * .05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                            onPressed: null,
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: deviceSize.height * .015,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: deviceSize.height * .015,
                      letterSpacing: 1
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: deviceSize.height * .017,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
