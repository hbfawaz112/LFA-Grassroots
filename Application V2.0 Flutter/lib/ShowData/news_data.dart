import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';
import 'package:scorefoot/ShowData/news_pdf.dart';

class Team {
  String new_id;
  String new_name;
  String new_date;


  Team({this.new_id, this.new_name,this.new_date});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      new_id: json["new_id"] as String,
      new_name: json["new_name"] as String,
      new_date: json["new_date"] as String,

    );
  }
}
class news_data extends StatefulWidget {
  news_data({Key key}) : super(key: key);

  @override
  _newsdata_teamsState createState() => _newsdata_teamsState();
}
class _newsdata_teamsState extends State<news_data> {
  Future<List<Team>> getData() async{
    var url="http://192.168.1.113:8080/flutter_football/get_news.php";
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Team> list = parseTeams(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static List<Team> parseTeams(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Team>((json) => Team.fromJson(json)).toList();
  }

  List<Team> teams = List();
  List<Team> filteredteams = List();

  @override
  void initState() {
    super.initState();
    getData().then((teamsFromServer) {
      setState(() {
        teams = teamsFromServer;
        filteredteams=teams;

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    if(filteredteams.length==0){return Column(
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
              //    Icon(Icons.sentiment_very_dissatisfied ,color: Color(0xFF112734),size: 130,),

            ]
        ),
        new Center(
          child:new CircularProgressIndicator(
            backgroundColor: Color(0xFF112734),
            //value: 100,
          ),)


      ],
    );
    }

    return
      Column(

          children:<Widget>

          [
            Center(child:Text("All news ",style:TextStyle(fontSize: 22,fontWeight:FontWeight.w900))),
            new Expanded(child:  ListView.builder(
                itemCount:  filteredteams.length,
                itemBuilder: (context,index){
                  return new Container(
                    //margin:new EdgeInsets.symmetric(vertical:2.0,horizontal:8.0),
                      child:new Card(

                        elevation: 15.0,
                        child:
                        InkWell(
                            onTap: () {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => news_pdf(filteredteams[index].new_name)

                                //new Futures_matchesClass(b),
                              )
                              );
                            },
                            child:
                            new Container(

                                padding:new EdgeInsets.all(12.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Row(
                                        children: <Widget>[
                                          Image(image: AssetImage('assets/eti7ad.jpg',),
                                            width: 70.0,
                                            height: 70.0,

                                          ),
                                          Expanded(
                                             child: new Text(
                                              '     '+filteredteams[index].new_name,
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w900,
                                                  color:Colors.black
                                              ),
                                            ),
                                          ),]
                                    ),

                                    new Text(
                                      '                  '+filteredteams[index].new_date,
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w900,
                                          color:Colors.grey
                                      ),
                                    ),




                                  ],
                                )
                            )
                        ),

                      )

                  );
                }

            )
            ),
          ]
      );
    /* FutureBuilder<List>(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasError){print(snapshot.error);}

          return snapshot.hasData
           ?
          new ItemList(snapshot.data)
          :circularProgressIndicator(),);
        }
      ); */
  }

/* List teams_initial=List();
    List teams_filtred=List();
    */



}


