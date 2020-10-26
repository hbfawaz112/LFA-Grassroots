import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scorefoot/Widgets/Drawer.dart';


 class  TheirdClass extends StatefulWidget {
   TheirdClass({Key key}) : super(key: key);
 
   @override
   _TheirdClassState createState() => _TheirdClassState();
 }
 
 class _TheirdClassState extends State<TheirdClass> {
   
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
          
        title:Text("Theird Class",style: TextStyle(fontWeight:FontWeight.w900),),centerTitle: true),

      drawer: getDrawer(),
       
        body: Center(
          child:Text("Comming soon :)"),
        ),
      

      
    )
     );
   }

   
 }