import 'package:flutter/material.dart';
import 'package:scorefoot/TabsForGouvernorates/rank_tabs.dart';


class Gov_rank extends StatelessWidget {
  const Gov_rank({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return select_mu7afaza_rank();
  }
}


class select_mu7afaza_rank extends StatefulWidget {
  select_mu7afaza_rank({Key key}) : super(key: key);

  @override
  _select_mu7afaza_rankState createState() => _select_mu7afaza_rankState();
}

class _select_mu7afaza_rankState extends State<select_mu7afaza_rank> {
  @override
  Widget build(BuildContext context) {
    return getListviewcardgovrank(context);
  }
}

Widget getListviewcardgovrank(BuildContext context)
{
var listviewcardmatchesgov = ListView(
  children:<Widget>[


    Container(
        margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
        child:new Card(
          elevation: 10.0,
          child: Image.asset("assets/rank6.jpg"),
        )

    ),
     
      Container(
        margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
        child:new Card(
          elevation: 10.0,
          child:InkWell(
            onTap:(){
               Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => rank_tabs("beirut"),
                              ));
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("Beiruth Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.red),)),
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
                              builder: (context) => rank_tabs("mont"),
                              ));
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("Mont Lebanon Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.red))),
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
                              builder: (context) => rank_tabs("south"),
                              ));
           
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("South Lebanon Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.red))),
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
                              builder: (context) => rank_tabs("north"),
                              ));
           
            },
            child:Container(
               padding:new EdgeInsets.all(12.0),
               child:new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                   Center(child:Text("North Lebanon Gouvernement",style: TextStyle(fontSize:22,fontWeight:FontWeight.w900,color : Colors.red))),
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


//Widget getListview_mu7afazat_rank(BuildContext context){
//
//
//  var listview=ListView(
//
//      children:<Widget>[
//        ListTile(
//          title: Text("       the Ranking league   ",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900,color : Colors.red),),
//        ),
//        ListTile(
//            leading :
//            Image(image: AssetImage('assets/rank3.JPG'),
//              width: 300.0,
//              height: 300.0,
//            )
//        ),
//
//        ListTile(
//
//          // leading: Image.asset('assets/mu7afazat/Beirut.png'),
//            onTap:(){
//
//              // debugPrint('ok');
//              //Futures_matchesClass();
//              Navigator.push(context, new MaterialPageRoute(
//                  builder: (context) =>rank_tabs("beirut")
//                //new rank_mawalid(b),
//              )
//              );
//            },
//            title: Text("                   Beiruth",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900,color : Colors.red),),
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
//                  builder: (context) =>rank_tabs("north")
//                //new rank_mawalid("North Lebanon"),
//              )
//              );
//
//            },
//            title: Text("             North Lebanon",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900,color : Colors.red),),
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
//                  builder: (context) => rank_tabs("south")
//                //new rank_mawalid("South Lebanon"),
//              )
//              );
//            },
//            title: Text("             South Lebanon",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900,color : Colors.red),),
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
//                  builder: (context) => rank_tabs("mont")
//                //new rank_mawalid("Mont Lebanon"),
//              )
//              );
//            },
//            title: Text("             Mont Lebanon",style: TextStyle(fontSize:25.0,fontWeight:FontWeight.w900,color : Colors.red),),
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
