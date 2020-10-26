import 'package:flutter/material.dart';
import 'package:scorefoot/TabsForGouvernorates/matches_tabs.dart';

class Gov_matches extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return select_mu7afaza_mathces(); /*Scaffold(
     /* appBar: AppBar(title:Text("Governorates(المحافظات)",style: TextStyle(fontWeight:FontWeight.w900),),centerTitle: true),
 drawer: getDrawer(),
     */
        body:select_mu7afaza_mathces(),
    );*/
  }
}
class select_mu7afaza_mathces extends StatefulWidget {
  
  @override
  _select_mu7afaza_mathcesState createState() => _select_mu7afaza_mathcesState();
}

class _select_mu7afaza_mathcesState extends State<select_mu7afaza_mathces> {
  @override
  Widget build(BuildContext context) {
    return
        
        getListviewcardgovmatch(context);
      
   // getListview();
  }
}


Widget getListviewcardgovmatch(BuildContext context)
{
var listviewcardmatchesgov = ListView(
  children:<Widget>[
//     ListTile(
//        title:Center(child:Text(" Matches مباريات",style: TextStyle(fontSize:25,fontWeight:FontWeight.w900),))
//     ),

    Container(
        margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
        child:new Card(
            elevation: 10.0,
            child: Image.asset("assets/chalenge0.jpg"),
                    )

       ),
      Container(
        margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
        child:new Card(
          elevation: 10.0,
          child:InkWell(
            onTap:(){
               Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => matches_tabs("beirut"),
                              ));
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("Beiruth Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.cyan),)),
                   
                   Center(child:Text("محافظة بيروت",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900))),
                    
                  ]         
               )
                         
            )
          )
        )
      ),

      Container(
        margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
        child:new Card(
          elevation: 10.0,
          child:InkWell(
            onTap:(){
               Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => matches_tabs("mont"),
                              ));
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("Mont Lebanon Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.cyan))),
                   Center(child:Text("محافظة جبل لبنان",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900))),
                    
                  ]         
               )
                         
            )
          )
        )
      ),
      Container(
        margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
        child:new Card(
          elevation: 10.0,
          child:InkWell(
            onTap:(){

              Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => matches_tabs("south"),
                              ));
           
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("South Lebanon Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.cyan))),
                    Center(child:Text("محافظة الجنوب",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900))),
                    
                  ]         
               )
                         
            )
          )
        )
      ),
      Container(
        margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
        child:new Card(
          elevation: 10.0,
          child:InkWell(
            onTap:(){
              Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => matches_tabs("north"),
                              ));
           
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("North Lebanon Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.cyan))),
                   Center(child:Text("محافظة الشمال",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900))),
                    
                  ]         
               )
                         
            )
          )
        )
      ),
      

  ],
);

return listviewcardmatchesgov;
}
