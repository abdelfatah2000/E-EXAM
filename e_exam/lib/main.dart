import 'package:e_exam/view/all_exams_screen.dart';
import 'package:e_exam/view/all_prof_screen.dart';
import 'package:e_exam/view/dummy.dart';
import 'package:e_exam/view/exam_result_screen.dart';
import 'package:e_exam/view/exam_screen.dart';
import 'package:e_exam/view/app_start_screen.dart';
import 'package:e_exam/view/home_screen.dart';
import 'package:e_exam/view/intro_screen.dart';
import 'package:e_exam/view/login_screen.dart';
import 'package:e_exam/view/prof_detail_screen.dart';
import 'package:e_exam/view/profile_screen.dart';
import 'package:e_exam/view/signup_screen.dart';
import 'package:e_exam/view/verification_screen.dart';
import 'package:e_exam/view_model/auth_provider.dart';
import 'package:e_exam/view_model/professors_provider.dart';
import 'package:e_exam/view_model/rebuild_nav_provider.dart';
import 'package:e_exam/view_model/students_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,

   ));
  runApp(const MyApp());

  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ProfessorsProvider(),),
        ChangeNotifierProvider(create: (_)=>StudentsProvider(),),
        ChangeNotifierProvider(create: (_)=>NavigatorProvider(),),
        ChangeNotifierProvider(create: (_)=>AuthProvider(),),


      ],
      child: MaterialApp(
        title: 'E-exam',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary:  HexColor('02783F'),

          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home:  const Intro(),
        debugShowCheckedModeBanner: false,


        routes: {
          LoginScreen.routeName:(context)=>const LoginScreen(),
          VerificationScreen.routeName:(context)=>const VerificationScreen(),
          SignupScreen.routeName :(context)=>const SignupScreen(),
          AppStartScreen.routeName :(context)=>const AppStartScreen(),
          Intro.routeName:(context)=>const Intro(),
          HomeScreen.routeName:(context)=>const HomeScreen(),
          AllProfScreen.routeName :(context)=>const AllProfScreen(),
          ProfDetailScreen.routeName:(context)=>const ProfDetailScreen(),
          ExamScreen.routeName:(context)=>const ExamScreen(),
          ProfileScreen.routeName:(context)=>const ProfileScreen(),
          AllExamsScreen.routeName:(context)=>const AllExamsScreen(),
          ExamResultScreen.routeName:(context)=>const ExamResultScreen(),
          Dummy.routeName:(context)=>const Dummy(),



        },
      ),
    );
  }
}
