import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class feedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themecolor=Color(0xFF112734);

    return MaterialApp
      (
      theme:
      new ThemeData(
        primaryColor: themecolor,
        accentColor: Colors.green,
        textTheme: TextTheme(body1: TextStyle(color: Colors.black)),
        backgroundColor: themecolor,

      ),
      title:"Feedback",
    home: feedbackpage(),
    );

  }
}


class feedbackpage extends StatelessWidget {
  var themecolor=Color(0xFF112734);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
       // leading: IconButton(
         //   icon: Icon(Icons.arrow_back), onPressed:()=>Navigator.pop(context)),
        title: Text("Send Us A Feedback"),
      centerTitle: true,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
Row(children: <Widget>[
 // Text("Enter your email : "),
  Expanded(child:  TextField(

    //obscureText: true,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      labelText: 'Email',
    ),
  )),
],),

          SizedBox(height: 45.0),
Row(children: <Widget>[
  //Text("Enter your FeedBack: "),
  Expanded(child: TextField(
    //obscureText: true,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      labelText: 'FeddBack',
    ),
  )
  ),
],),
          SizedBox(height: 45.0),

          RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: themecolor)),
            onPressed: () {
              showWebColoredToast();
              //Navigator.pop(context);
            },
            color: Colors.white,
            textColor: Colors.black,
            child: Text("Submit your feedback ".toUpperCase(),
                style: TextStyle(fontSize: 14)),
          ),
        ],
      )

    );
  }
}
void showWebColoredToast() {

  Fluttertoast.showToast(
    msg: "Thanks For Your Feedback :)",
    toastLength: Toast.LENGTH_SHORT,
    webBgColor: "#e74c3c",
    timeInSecForIosWeb: 4,
  );
}



