import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scorefoot/Widgets/Drawer.dart';


 class FirstClass extends StatefulWidget {
   FirstClass({Key key}) : super(key: key);
 
   @override
   _FirstClassState createState() => _FirstClassState();
 }
 
 class _FirstClassState extends State<FirstClass> {
   
   @override
   Widget build(BuildContext context) {
     return WillPopScope(
        onWillPop: ()
        {
            Navigator.of(context).pop(true);
        },
        child:
        Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed:()=>Navigator.pop(context)),
          
        title:Text("First Class",style: TextStyle(fontWeight:FontWeight.w900),),centerTitle: true),

      drawer: getDrawer(),
       
        body: Center(
          child:Text("Comming soon :)"),
        ),
      

      
    )
     );
   }

   
 }