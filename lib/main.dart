import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:cpa_chatbot/screens/chatbot_screen.dart';
import 'package:cpa_chatbot/screens/registration_screen.dart';
import 'package:cpa_chatbot/screens/welcome_screen.dart';
import 'package:cpa_chatbot/screens/login_screen.dart';
import 'package:cpa_chatbot/screens/home_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:cpa_chatbot/screens/report_screen.dart';
import 'package:cpa_chatbot/screens/history_screen.dart';
import 'package:cpa_chatbot/screens/forgetPass_Screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter( initialization);

  runApp(MyApp());
}
Future initialization(BuildContext? context) async{
  await Future.delayed(Duration(milliseconds: 500));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        ChatScreen.id:(context)=>ChatScreen(),
        HomeScreen.id:(context)=>HomeScreen(),
        ReportScreen.id:(context)=>ReportScreen(),
        HistroyScreen.id:(context)=>HistroyScreen(),
        ForgetScreen.id:(context)=>ForgetScreen(),
      },
    );
  }
}

