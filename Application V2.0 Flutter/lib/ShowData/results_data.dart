import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



//hon badde es7ab lresult of matches min data base w 3rdon 
//hon sh8l aasync w future w hek :()
//lquery 7a tkus: SELECT FROM Results_matches table WHERE MU7AFZA=$MU7AFAZA AND MAWALID=$MAWALID :)

 
class results_data extends StatelessWidget {

  String mu7afaza;
  int mawalid;
  results_data(String mu7afaza,int mawalid)
  {
    this.mu7afaza=mu7afaza;
    this.mawalid=mawalid;
  }
   Future<List> getData() async{
     var url="http://192.168.1.113:8080/flutter_football/get_results.php?region=$mu7afaza&&birth=$mawalid";
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
          backgroundColor: Colors.red,
          //value: 100,
        ),)
     
       
        ],
      );
        }
      ); 
    }
}
class ItemList extends StatelessWidget {
  String s = ".jpg" ;
  List list;
ItemList(List list){this.list=list;}
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children:<Widget>[
        Padding(padding: EdgeInsets.only(top: 20),),
             Center(child:Text("Results Of Matches    نتائج المباريات",style:TextStyle(fontSize: 20,fontWeight:FontWeight.w900))),
             
            Expanded(child: 
            new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context,i){
               return new Container(
                  margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
                  child:new Card(
                    
                    elevation: 10.0,
                    child:
                      InkWell(
                        onTap: () {
                        },
                        child:
                     new Container(

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
                                     /*Image(image: AssetImage('assets/fera2/${list[i]['first_team']+s}'),
                                   width: 44.0,
                                   height: 44.0,

                                   ),*/
                                new Text('  ${list[i]['first_team']}  ${list[i]['first_team_result']} - ${list[i]['second_team_result']}  ${list[i]['second_team']}',
                                     style: TextStyle(
                                       fontSize: 20.0,
                                       fontWeight: FontWeight.w900
                                     ),
                                ),
                                Expanded(child:
                                Image.network(
                                  'http://192.168.1.113:8080/flutter_football/profile_pictures/${list[i]['second_team']+s}',
                                  width: 44,
                                  height: 44,
                                ),
                                 /*Image(image: AssetImage('assets/fera2/${list[i]['second_team']+s}'),
                                   width: 44.0,
                                   height: 44.0,

                                   ),*/)
                                  
                                  ]),
                                // new Text('          '),
                               

                                  Row(
                                    children:<Widget>[
                                      new Text('                '),
                                       Icon(FontAwesomeIcons.calendar,color: Color(0xFF112734),),
                                       new Text('  '),
                                       
                                       new Text('Date: ${list[i]['match_date']} '),
                               
                                
                                    ]
                                  ),


                            ],
                          )
                    )
                  ), 
                  
                  )

              );
      }

    )

            )
      ]
    );
       }
}

