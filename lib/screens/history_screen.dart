import 'package:flutter/material.dart';

class HistroyScreen extends StatefulWidget {
  static String id='history_screen';

  @override
  State<HistroyScreen> createState() => _HistroyScreenState();
}

class _HistroyScreenState extends State<HistroyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x912373AA),
        title: Text('History',
        style: TextStyle(
          fontFamily: 'Pacifico'
        ),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/bg1.png'), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.image,color: Colors.white,),
              title: Text("Report 1",
              style: TextStyle(
                color: Colors.white,
              ),
              ),
              onTap: (){
                print('Report 1');
              },
            ),
            Divider(
              color: Color(0xFFC3C2C2),
            ),
            ListTile(
              leading: Icon(Icons.image,color: Colors.white),
              title: Text("Report 2",
                style:TextStyle(
                  color: Colors.white,
                ) ,),
              onTap: (){
                print('Report 2');
              },
            )
          ],
        ),
      ),
    );
  }
}
