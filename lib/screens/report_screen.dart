import 'package:flutter/material.dart';
import 'package:cpa_chatbot/components/round_button.dart';
import 'package:cpa_chatbot/screens/welcome_screen.dart';
class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);
  static String id = 'report_screen';

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/bg1.png'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                child: Image(
                  image: AssetImage('image/logo1.png'),
                  width: 250.0,
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment. start,

                    children: [
                      Center(
                        child: Text(
                          'Report',
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Sans Source Pro',
                            fontWeight: FontWeight.w900,
                          ) ,
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        height: 40.0,
                      ),
                      Text('Over All result is ........',
                        style:TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),),
                      Text('Your Child is weak in......',
                        style:TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),),
                      Text('Suggestions:',style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                      ),
                      Text('You neeed to do this......',style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),)
                    ],
                  ),
                ) ,
            ),

            Expanded(child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              RoundButton(text: 'Save Report', onPressed: (){
                print('Saved');
              }),
                RoundButton(text: 'Go Back', onPressed: (){
                  Navigator.pushNamed(context, WelcomeScreen.id);
                })

              ],
            )
            )
          ],
        ),);

  }
}
