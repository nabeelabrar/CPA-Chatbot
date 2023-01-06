import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  RoundButton({required this.text, required this.onPressed});
  String text;

  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ Colors.blue,Color(0xFF10163F)]
            ),
          borderRadius:  BorderRadius.circular(10.0),
        ),
        child: Material(
          elevation: 5.0,
          color: Color(0x00FFFFFF),
          child: MaterialButton(
            onPressed: ()=>{
              onPressed()
            },
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              text,
              style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),

            ),
          ),
        ),
      ),
    );
  }
}