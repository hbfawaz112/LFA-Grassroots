import 'package:flutter/material.dart';
import 'package:scorefoot/TabsForGouvernorates/results_tabs.dart';

class Gov_results extends StatelessWidget {
  const Gov_results({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return select_mu7afaza_results();

  }
}


class select_mu7afaza_results extends StatefulWidget {
  select_mu7afaza_results({Key key}) : super(key: key);

  @override
  _select_mu7afaza_resultsState createState() => _select_mu7afaza_resultsState();
}

class _select_mu7afaza_resultsState extends State<select_mu7afaza_results> {
  @override
  Widget build(BuildContext context) {
    return getListviewcardgovresults(context);
  }
}

Widget getListviewcardgovresults(BuildContext context)
{
var listviewcardmatchesgov = ListView(
  children:<Widget>[
//     ListTile(
//        title:Center(child:Text(" Result نتائج",style: TextStyle(fontSize:25,fontWeight:FontWeight.w900,color : Colors.lightGreen),))
//     ),


    Container(
        margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
        child:new Card(
          elevation: 10.0,
          child: Image.asset("assets/res5.jpg"),
        )

    ),
      Container(
        margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
        child:new Card(
          elevation: 10.0,
          child:InkWell(
            onTap:(){
               Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => results_tabs("beirut"),
                              ));
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("Beiruth Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.lightGreen),)),
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
                              builder: (context) => results_tabs("mont"),
                              ));
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("Mont Lebanon Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.lightGreen))),
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
                              builder: (context) => results_tabs("south"),
                              ));
           
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("South Lebanon Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.lightGreen))),
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
                              builder: (context) => results_tabs("north"),
                              ));
           
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("North Lebanon Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.lightGreen))),
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




//Widget getListview_results(BuildContext context){
//
//
//  var listview=ListView(
//
//      children:<Widget>[
//        ListTile(
//          title: Text("       Governorates Results",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900),),
//        ),
//        ListTile(
//          title: Text("      ",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900),),
//        ),
//        ListTile(
//
//          // leading: Image.asset('assets/mu7afazat/Beirut.png'),
//            onTap:(){
//              String b="Beiruth";
//              // debugPrint('ok');
//              //Futures_matchesClass();
//              Navigator.push(context, new MaterialPageRoute(
//                  builder: (context) =>results_tabs(b)
//                //new Result_of_matchesClass(b),
//              )
//              );
//            },
//            title: Text("                   Beiruth",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900),),
//            trailing: Icon(Icons.arrow_forward_ios )
//        ),
//        ListTile(
//          title: Text("  ",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900),),
//        ),
//
//        ListTile(
//
//            onTap:(){
//
//              //debugPrint('ok');
//              Navigator.push(context, new MaterialPageRoute(
//                  builder: (context) =>results_tabs("North Lebanon")
//                //new Result_of_matchesClass("North Lebanon"),
//              )
//              );
//
//            },
//            title: Text("             North Lebanon",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900),),
//            trailing: Icon(Icons.arrow_forward_ios )
//
//        ),
//        ListTile(
//          title: Text(" ",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900),),
//        ),
//
//        ListTile(
//
//            onTap:(){
//              //debugPrint('ok');
//              Navigator.push(context, new MaterialPageRoute(
//                  builder: (context) =>results_tabs("South Lebanon")
//                //new Result_of_matchesClass("South Lebanon"),
//              )
//              );
//            },
//            title: Text("             South Lebanon",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900),),
//            trailing: Icon(Icons.arrow_forward_ios )
//        ),
//        ListTile(
//          title: Text(" ",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900),),
//        ),
//
//        ListTile(
//
//            onTap:(){
//              //debugPrint('ok');
//              Navigator.push(context, new MaterialPageRoute(
//                  builder: (context) =>results_tabs("Mont Lebanon")
//                //new Result_of_matchesClass("Mont Leabnon"),
//              )
//              );
//            },
//            title: Text("             Mont Lebanon",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900),),
//            trailing: Icon(Icons.arrow_forward_ios )
//        ),
//        ListTile(
//          title: Text(" ",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900),),
//        ),
//
//
//
//
//      ]
//  );
//
//  return listview;
//}
