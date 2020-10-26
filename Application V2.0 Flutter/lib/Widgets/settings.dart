import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themecolor=Color(0xFF112734);

    return MaterialApp(
      theme:
      new ThemeData(
        primaryColor: themecolor,
        accentColor: Colors.green,
        textTheme: TextTheme(body1: TextStyle(color: Colors.black)),
        backgroundColor: themecolor,

      ),
      debugShowCheckedModeBanner: false,
      title: "settings" ,
      home: SwitchExample(),

    );
  }
}


class SwitchExampleState extends State {
  bool switchOn = false;

  void _onSwitchChangedtheme(bool value) {
    switchOn = true;
    themetoast();
  }
  void _onSwitchChangednoti(bool value) {
    switchOn = false;
    notitoast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(
          //  icon: Icon(Icons.arrow_back), onPressed:()=>Navigator.pop(context)),
        title: Text('Settings'),
        centerTitle: true,
      ),
      body:
          Column(
            children: <Widget>[
              Text(""),
              Text(""),

              Row(
                children: <Widget>[
                  Text("Choose your theme  (Dark or Light): ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Transform.scale(
                    scale: 1.0,
                    child: Switch(
                      onChanged: _onSwitchChangedtheme,
                      value: switchOn,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Notification: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Transform.scale(
                    scale: 1.0,
                    child: Switch(
                      onChanged: _onSwitchChangednoti,
                      value: switchOn,
                    ),
                  ),
                ],
              ),


            ],
          )



    );
  }
}

class SwitchExample extends StatefulWidget {
  @override
  SwitchExampleState createState() => new SwitchExampleState();
}

void themetoast() {

  Fluttertoast.showToast(
    msg: "Dark theme selectd! :)",
    toastLength: Toast.LENGTH_SHORT,
    webBgColor: "#e74c3c",
    timeInSecForIosWeb: 4,
  );
}
void notitoast() {

  Fluttertoast.showToast(
    msg: "Notification is off",
    toastLength: Toast.LENGTH_SHORT,
    webBgColor: "#e74c3c",
    timeInSecForIosWeb: 4,
  );
}


