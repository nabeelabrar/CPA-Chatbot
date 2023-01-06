import 'package:flutter/material.dart';
import 'package:cpa_chatbot/components/round_button.dart';
import 'package:cpa_chatbot/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chatbot_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cpa_chatbot/screens/home_screen.dart';
class RegistrationScreen extends StatefulWidget {
  static String id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  bool spin=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/bg1.png'),fit:BoxFit.fill
          ),
        ),
        child: ModalProgressHUD(
          inAsyncCall: spin,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: [
                      Hero(
                        tag: 'logo',
                        child: Container(
                          height: 100.0,
                          child: Image.asset('image/signup.png'),
                        ),
                      ),
                      AnimatedTextKit(animatedTexts:[
                        TypewriterAnimatedText(
                          'Sign Up',
                          textStyle: TextStyle(
                            fontSize: 45.0,
                            fontFamily:'Sans Source Pro',
                            fontWeight: FontWeight.w900,
                            color:Color(0xff021A43),
                            fontStyle: FontStyle.italic,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password=value;
                    },
                    decoration:kDecorationTextField.copyWith(hintText: 'Enter Full Name',
                        prefixIcon: Icon(Icons.abc),
                    )
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(

                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email=value;
                    },
                    decoration: kDecorationTextField.copyWith(hintText: 'Enter Email')
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password=value;
                    },
                    decoration:kDecorationTextField.copyWith(hintText: 'Password',
                    prefixIcon: Icon(Icons.lock)
                    )
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password=value;
                    },
                    decoration:kDecorationTextField.copyWith(hintText: ' Confirm Password',
                        prefixIcon: Icon(Icons.lock)
                    )
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundButton(text: 'Register',
                  onPressed: ()async{
                    Navigator.pushNamed(context, HomeScreen.id);

                    setState((){
                      spin=false;
                    });
                  },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}