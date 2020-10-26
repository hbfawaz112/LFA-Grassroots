import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';


//hon badde es7ab lRank min data base w 3rdon 
//lquery 7a tkus: SELECT FROM Rank WHERE MU7AFZA=$MU7AFAZA AND MAWALID=$MAWALID :)



class rank_data extends StatelessWidget {

  String mu7afaza;
  int mawalid;
  rank_data(String mu7afaza,int mawalid)
  {
    this.mu7afaza=mu7afaza;
    this.mawalid=mawalid;
  }

    Future<List> getData() async{
      var url="http://192.168.1.113:8080/flutter_football/get_ranking.php?region=$mu7afaza&&birth=$mawalid";
    http.Response response= await http.get(url);
    //return  jsonDecode(response.body);
    print(json.encode(response.body));

    return json.decode(response.body);
  } 

  

    @override
    Widget build(BuildContext context) {
      return FutureBuilder<List>(
        future: getData(), 
        builder: (context,snapshot){
          if(snapshot.hasError){print(snapshot.error);}

          return snapshot.hasData 
           ?
          new ItemList(snapshot.data) 
          :
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
              Text("Check Your Internet Connection... ",
              style: TextStyle(fontWeight:FontWeight.w900,fontSize: 20), ),
              Text(" Or The Server Is Down",
              style: TextStyle(fontWeight:FontWeight.w900,fontSize: 20), ),
              //Image.asset("assets/nonet.jpg"),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
       
                children:<Widget>[

              Icon(Icons.cloud_off,color: Color(0xFF112734),size: 130,),
              Icon(Icons.sentiment_very_dissatisfied ,color: Color(0xFF112734),size: 130,),
              
                ]
              ),
               new Center(
        child:new CircularProgressIndicator(
          backgroundColor:  Color(0xFF112734),
          //value: 100,
        ),)
     
       
        ],
      );
        }
      ); 
    }
}

class ItemList extends StatelessWidget {
    String s= ".jpg";
  List list ;
  var i=0;
ItemList(List list){this.list=list;}
final double columnSpacing=35;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children:<Widget>[
             Center(child:Text("  Rank الترتيب العام  ",style:TextStyle(fontSize: 20,fontWeight:FontWeight.w900))),
        
    Expanded(child:  SingleChildScrollView(
      scrollDirection:Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection:Axis.horizontal,
        child: DataTable(
          columnSpacing:35 ,
          columns:[ 
            DataColumn(label: Text("  Team",style: TextStyle(fontSize:16,fontWeight: FontWeight.w800),)),
            DataColumn(label: Text("Play",style: TextStyle(fontSize:16,fontWeight: FontWeight.w800),)),
            DataColumn(label: Text("GF:GA",style: TextStyle(fontSize:16,fontWeight: FontWeight.w500),)),
            DataColumn(label: Text("pts",style: TextStyle(fontSize:16,fontWeight: FontWeight.w800),)),
            ],
          rows: list.map( 
            (Rank)=>DataRow(cells: 
          [ DataCell(
              Row(children:<Widget>[

                  // image from server
              
              Image.network(
                 'http://192.168.1.113:8080/flutter_football/profile_pictures/${Rank['team_name']+s}',
                                    width: 44,
                                    height: 44,
                                  ),
              
              Text(" "),Text(Rank["team_name"]),
               ] )),
            DataCell(
              Text(Rank["play"]),
            ),
            DataCell(
              Text(Rank["gf"]+":"+Rank["ga"]),
            ),

            DataCell(
              Text(Rank["points"]),
            ),
          ]
            )//DATA ROW
          ).toList(),
          
          
          )

      ),
    ))

      ]
    );
      }
}

