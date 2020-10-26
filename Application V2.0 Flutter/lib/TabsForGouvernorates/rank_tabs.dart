import 'package:flutter/material.dart';
import 'package:scorefoot/ShowData/rank_data.dart';


class rank_tabs extends StatelessWidget {
  String mu7afaza;
  rank_tabs(String mu7afaza) //: super(key: this.mu7afaza);
   {
     this.mu7afaza=mu7afaza;
   }
  @override
  Widget build(BuildContext context) {
    var themecolor=Color(0xFF112734);

    return MaterialApp(
        debugShowCheckedModeBanner: false,


        theme:new ThemeData(
        primaryColor: themecolor,
        accentColor: Colors.green,
        textTheme: TextTheme(body1: TextStyle(color: Colors.black)),
        backgroundColor: themecolor,
        //new ThemeData.dark(),
        ),
        home:DefaultTabController(
        length:4 
       , child: Scaffold(
         appBar:AppBar(
           centerTitle: true,
           leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed:()=>Navigator.pop(context)),
         
           title:Text("$mu7afaza"),
           bottom: TabBar(
             tabs:[
                Tab(child:Text("2008")),
                Tab(child:Text("2009")),
                Tab(child:Text("2010")),
                Tab(child:Text("2011")),
                  

             ],
            ),
           ),
           body: TabBarView(children: [

              rank_data("$mu7afaza",2008),
              rank_data("$mu7afaza",2009),
              rank_data("$mu7afaza",2010),
              rank_data("$mu7afaza",2011),
              

           ])   ,
       )
       
       )
    );
  }
}