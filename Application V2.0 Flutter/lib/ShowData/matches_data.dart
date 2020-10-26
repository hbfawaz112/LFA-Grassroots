import 'package:flutter/material.dart';

import 'package:http/http.dart'  as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//hon badde es7ab lfuture matches min data base w 3rdon 
//lquery 7a tkus: SELECT FROM FURURE_MARCHES WHERE MU7AFZA=$MU7AFAZA AND MAWALID=$MAWALID :)




class matches_data extends StatelessWidget {

  String mu7afaza;
  int mawalid;
  matches_data(String mu7afaza,int mawalid)
  {
    this.mu7afaza=mu7afaza;
    this.mawalid=mawalid;
  }

    Future<List> getData() async{
      var url="http://192.168.1.113:8080/flutter_football/get_matches.php?region=$mu7afaza&&birth=$mawalid";
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
  List list;
ItemList(List list){this.list=list;}
  @override
  Widget build(BuildContext context) {

    return  
    Column(

      children:<Widget>[
        Padding(padding: EdgeInsets.only(top: 20),),

        Center(child:Text("Next Matches     المباريات القادمة",style:TextStyle(fontSize: 20,fontWeight:FontWeight.w900))),
   
       // Center(child:Text("",style:TextStyle(fontSize: 20,fontWeight:FontWeight.w900))),
        
        Expanded(child:
        
    new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context,i){
         return new Container(
                  margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
                  child:new Card(
                    elevation: 10.0,
                    child:new Container(
                       padding:new EdgeInsets.all(12.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                    Image.network(
                                      'http://192.168.1.113:8080/flutter_football/profile_pictures/${list[i]['first_team']+s}',
                                    width: 44,
                                      height: 44,
                                    ),

                                new Text('  ${list[i]['first_team']}  VS  ${list[i]['second_team']}',
                                     style: TextStyle(
                                       fontSize: 19.0,
                                       fontWeight: FontWeight.w900
                                     ),
                                   ),
                                  Expanded(child:
                                  Image.network(
                                    'http://192.168.1.113:8080/flutter_football/profile_pictures/${list[i]['second_team']+s}',
                                    width: 44,
                                    height: 44,
                                  ),),
                                 ],
                                ),
                                 Row(
                                    children:<Widget>[
                                      new Text('                    '),
                                       Icon(FontAwesomeIcons.calendar,color: Color(0xFF112734),),
                                       new Text('  '),
                                       new Text(' Date : ',style: TextStyle(fontWeight:FontWeight.w900),),
                                       
                                       new Text(' ${list[i]['match_date']} '),
                               
                                
                                    ]
                                  ),
                                  
                                  Row(
                                    children:<Widget>[
                                      new Text('                    '),
                                      Icon(Icons.timer),
                                      new Text('  '),
                                      new Text(' Time : ',style: TextStyle(fontWeight:FontWeight.w900),),
                                       
                                       new Text('${list[i]['match_time']} '),
                               
                                
                                    ]
                                  ),
                                  Row(
                                    children:<Widget>[
                                      new Text('                    '),
                                      ImageIcon(
                                      AssetImage("assets/icons/staduim.png"),
                                            color: Color(0xFF112734),
                                            size: 25,

                                      ),
                                      new Text('  '),
                                       new Text(' Staduim : ',style: TextStyle(fontWeight:FontWeight.w900),),
                                       
                                       new Text(' ${list[i]['staduim']} '),

                                
                                    ]
                                  ),

                            ],
                          )
                    ) 
                  )
               );
            }
          )

        ),
      ]
    );
          }
}


