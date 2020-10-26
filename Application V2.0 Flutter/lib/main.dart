import 'package:splashscreen/splashscreen.dart';


import 'package:flutter/material.dart';
import 'Leagues/leagues_grid_layout.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  var testtheme=new ThemeData.dark();
    
  @override
  Widget build(BuildContext context) {
    var themecolor=Color(0xFF112734);

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
       
      home:new Theme(
          data: new ThemeData(
            primaryColor: themecolor,
            accentColor: Colors.green,
            textTheme: TextTheme(body1: TextStyle(color: Colors.black)),
            backgroundColor: themecolor,
          )
          ,
       child: 

       SplashScreen(
            seconds: 6,
            navigateAfterSeconds: new  leagues_grid(),
            title:
            new Text('LFA APP Welcome!! :) ',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),
            ),
            image: Image.asset("assets/new_eti7ad.png"),
            //backgroundGradient: new LinearGradient(colors: [Colors.cyan, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
            backgroundColor: Colors.transparent,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 120.0,
            onClick: ()=>print("Flutter Egypt"),
            loaderColor: Colors.red,
          ),
          
     
      
    )
    );
  }
}
