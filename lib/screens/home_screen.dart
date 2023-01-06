import 'package:flutter/material.dart';
import 'package:cpa_chatbot/screens/login_screen.dart';
import 'package:cpa_chatbot/components/round_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:cpa_chatbot/screens/chatbot_screen.dart';
import 'package:cpa_chatbot/screens/history_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> age = ['1', '2', '3', '4', '5'];
String? selectedItem = '3';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(
            child: Text(
          'Hello!!',
          style: TextStyle(
              fontFamily: 'Pacifico',
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold),
        )),
        backgroundColor: Color(0x912373AA),
        elevation: 0.0,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xD62D6086),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              onTap: (){
                Navigator.pushNamed(context,HistroyScreen.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.manage_accounts),
              title: Text('Account'),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('image/bg1.png'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Image(
                    image: AssetImage('image/logo1.png'),
                    width: 250.0,
                    height: 250.0,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 50.0),
                  decoration: BoxDecoration(
                    color: Color(0x30FFFFFF),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0)),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex:1,
                        fit: FlexFit.loose,
                        child:
                      Center(
                        child: Text('Select Age',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                      ),),
                      Flexible(
                        flex: 3,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            buttonHeight: 50.0,
                            isExpanded: true,
                            hint: Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Select Item',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: age
                                .map((age) => DropdownMenuItem<String>(
                                      value: age,
                                      child: Text(
                                        age,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: selectedItem,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value as String;
                              });
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            iconSize: 20,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.grey,
                            buttonPadding:
                                const EdgeInsets.only(left: 120, right: 120),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              gradient: LinearGradient(
                                  colors: [Colors.blue, Color(0xFF10163F)]),
                            ),
                            buttonElevation: 2,
                            itemHeight: 40,
                            itemPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            dropdownMaxHeight: 200,
                            dropdownWidth: 200,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: LinearGradient(
                                  colors: [Colors.blue, Color(0xFF10163F)]),
                            ),
                            dropdownElevation: 10,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(-20, 0),
                          ),
                        ),
                      ),

                      Flexible(
  flex: 3,
                        child: RoundButton(
                          text: 'Start Chat',
                          onPressed: () {
                            Navigator.pushNamed(context,ChatScreen.id);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
