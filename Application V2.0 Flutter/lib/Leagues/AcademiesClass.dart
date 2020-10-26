
import 'package:flutter/material.dart';
import 'package:scorefoot/Widgets/Drawer.dart';
import 'package:scorefoot/ScreensForNavigator/news.dart';
import 'package:scorefoot/ScreensForNavigator/matches.dart';
import 'package:scorefoot/ScreensForNavigator/results.dart';
import 'package:scorefoot/ScreensForNavigator/rank.dart';
import 'package:scorefoot/ScreensForNavigator/teams.dart';
import 'package:scorefoot/ScreensForNavigator/top10.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 class AcademiesClass extends StatefulWidget {

   AcademiesClass({Key key}) : super(key: key);
 
   @override
   _AcademiesClassState createState() => _AcademiesClassState();
 }
 
 class _AcademiesClassState extends State<AcademiesClass> {
   final tabs = [

    news(),
    matches(),
    results(),
    rank(),
    teams(),
    //top10(),

  ];
   int _currentIndex = 0; 
   
   @override
   Widget build(BuildContext context) {
     return 

     Scaffold(

       appBar: AppBar(
  leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed:()=>Navigator.pop(context)),
          
  title:Text("Acedemies  League ",style: TextStyle(fontWeight:FontWeight.w900),),centerTitle: true),
      drawer: getDrawer(),
      
      bottomNavigationBar:BottomNavigationBar(
        elevation: 30.0,
      currentIndex: _currentIndex,
      type:BottomNavigationBarType.fixed,
      selectedFontSize: 15,
      unselectedFontSize: 10,
      items: [
          BottomNavigationBarItem(
           
            //icon: Icon(Icons.chrome_reader_mode),
            icon: Icon(FontAwesomeIcons.newspaper,color: Color(0xFF112734),),
           
            title:Text("News"),
            backgroundColor: Colors.blue
            
            ),

            BottomNavigationBarItem(
             icon: ImageIcon(
               AssetImage("assets/icons/staduim.png"),
                    color: Color(0xFF112734),
                    size: 25,

               ),
             //Icon(Icons.insert_invitation,color: Color(0xFF112734)),
               // icon: Icon(FontAwesomeIcons.ember),

                title:Text("Matches"),
            backgroundColor: Colors.blue
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check,color: Color(0xFF112734)),
                //icon: Icon(FontAwesomeIcons.fileM),
          
                title:Text("Results"),
            backgroundColor: Colors.blue
            
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered,color: Color(0xFF112734)),
            title:Text("Rank"),
            backgroundColor: Colors.blue
            
            ),
            BottomNavigationBarItem(
           icon: ImageIcon(
               AssetImage("assets/icons/team.png"),
                    color: Color(0xFF112734),
                    size: 25,

               ),
            title:Text("Teams"),
            backgroundColor: Colors.blue
            
            ),

            /*BottomNavigationBarItem(
              //icon:Icon(Icons.grade,color: Color(0xFF112734)),
              icon: ImageIcon(
               AssetImage("assets/icons/top100_32.png"),
                    color: Color(0xFF112734),
                    size: 25,

               ),
              
              title:Text("Top10"),
              backgroundColor: Colors.blue

              )
*/


      ],
      onTap: (index){
          setState(() {
            _currentIndex=index; 
          });
      },
      
      ), //,
      
       
        body: tabs[_currentIndex],
      

      
    );
   }
 }