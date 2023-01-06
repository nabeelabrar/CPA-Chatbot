import 'package:flutter/material.dart';
import 'package:cpa_chatbot/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpa_chatbot/screens/report_screen.dart';

class ChatScreen extends StatefulWidget {
  static String id='chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}
class Messages{
  String message;
  bool isMe;
  Messages({required this.message,required this.isMe});
}
List<Messages> chatMessage=[
  Messages(message: 'Hello', isMe: false),
  Messages(message: 'Whats Up?', isMe: false),
];
class _ChatScreenState extends State<ChatScreen> {
  late String messageText;
  final messageController=TextEditingController();

  int i=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pushNamed(context,ReportScreen.id);
              }),
        ],
        title: Center(child: Text('Chat',
          style: TextStyle(
              fontFamily: 'Pacifico',
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold),
        ),),
        backgroundColor:  Color(0x912373AA),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('image/bg1.png'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessageStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white
                        ),
                        controller: messageController,
                        onChanged: (value) {
                          messageText=value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        messageController.clear();
                        chatMessage.insert(i, Messages(message: messageText, isMe: true));
                        i+=2;
                        print(i);
                        setState((){
                          MessageStream();
                        });
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MessageStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        builder: (context, snapshot) {
          List<MessageBubble> messageBubbles=[];

          for(var message in chatMessage) {
            final messageText =message.message;
            //   final currentUser=loggedInUser.email;
              final messageBubble=MessageBubble(
                message: messageText,
                isMe: message.isMe,
              );
              messageBubbles.add(messageBubble);
            }
            // print('!!!!!!!!!!!!!!!!!!!!!!!!!!!$check!!!!!!!!!!!!!!!!!!!!');

            return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                children: messageBubbles,
              ),
            );
          },);
  }
  }




class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  MessageBubble({required this.message,required this.isMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [

          Material(
            elevation: 5.0,
            borderRadius:isMe? BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)):BorderRadius.only(bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),topRight: Radius.circular(30.0)),
            color: isMe?Colors.lightBlueAccent:Colors.blueGrey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
              child: Text(message,
                style: TextStyle(
                    fontSize:15.0,
                    color: Colors.white
                ),),
            ),
          ),
        ],
      ),
    );           ;
  }
}
