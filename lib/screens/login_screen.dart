import 'package:cpa_chatbot/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cpa_chatbot/components/round_button.dart';
import 'package:cpa_chatbot/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cpa_chatbot/screens/forgetPass_Screen.dart';

class LoginScreen extends StatefulWidget {
  static String id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override

  // final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  final textFieldController=TextEditingController();
  final passFieldController=TextEditingController();
  Color color=Color(0xB355B);

  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('image/bg1.png'),fit:BoxFit.fill
            )
        ),
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: [
                    Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: Container(
                          height: 100.0,
                          child: Image.asset('image/login.png'),
                        ),
                      ),
                    ),
                    AnimatedTextKit(animatedTexts:[
                      TypewriterAnimatedText(
                        'Login',
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
                SizedBox(
                  height: 40.0,
                ),
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    controller: textFieldController,
                    onChanged: (value) {
                      email=value;
                    },
                    decoration:kDecorationTextField.copyWith(hintText: 'Enter E-Mail')
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    controller: passFieldController,
                    onChanged: (value) {
                      password=value;
                    },
                    decoration: kDecorationTextField.copyWith(hintText: 'Password',
                        prefixIcon:Icon(Icons.lock) ),
                  
                ),
                Center(
                  child: Text('Invalid Username or Password',
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundButton(text: 'Log In',
                    onPressed: () async{
                      textFieldController.clear();
                      passFieldController.clear();
                      Navigator.pushNamed(context, HomeScreen.id);

                      setState((){
                        showSpinner=false;
                      });

                      // try{
                      //   final user= await _auth.signInWithEmailAndPassword(email: email, password: password);
                      //   print('$user');
                      //   if(user!=null){
                      //     // Navigator.pushNamed(context, ChatScreen.id);
                      //     setState((){
                      //       showSpinner=false;
                      //     });
                      //   }}catch(e){
                      //   setState((){
                      //     showSpinner=false;
                      //   });
                      //   color=Colors.red;
                        print('nothing');
                      }
                    ),
                GestureDetector(
                  child: Text('Forget Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, ForgetScreen.id);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}