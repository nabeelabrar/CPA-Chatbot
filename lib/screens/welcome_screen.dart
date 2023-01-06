import 'dart:ui';

import 'package:cpa_chatbot/screens/login_screen.dart';
import 'package:cpa_chatbot/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cpa_chatbot/components/round_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    controller.forward();
    controller.addListener(() {
      setState((){});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: animation.value,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('image/bg1.png'),fit:BoxFit.fill
            )
        ),
        child: Padding(

          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Container(
                  child: Text('CPA',
                  style: TextStyle(
                    color: Color(0xff021A43),
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Chatbot',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30.0,
                    letterSpacing: 3.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff021A43),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: SizedBox(
                  height: 20.0,
                  width: 200.0,
                  child: Divider(
                      color: Color(0xff021A43),
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),
              Center(
                child: AnimatedTextKit(animatedTexts:[
                  TypewriterAnimatedText(
                    'Welcome',
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontFamily:'Sans Source Pro',
                      fontWeight: FontWeight.w900,
                      color: Colors.lightBlue,
                      fontStyle: FontStyle.italic,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundButton(text: 'Login',onPressed:(){
                Navigator.pushNamed(context, LoginScreen.id);}),
              RoundButton(text: 'Registration',onPressed: (){
                Navigator.pushNamed(context, RegistrationScreen.id);},),
            ],
          ),
        ),
      ),
    );
  }
}
