import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';
import 'package:scorefoot/ShowData/profile_of_the_team.dart';

class Team {
  String team_id;
  String team_name;
  String region;
  String image;

  Team({this.team_id, this.team_name, this.region,this.image});
 
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      team_id: json["team_id"] as String,
      team_name: json["team_name"] as String,
      region: json["region"] as String,
      image: json["team_name"] as String,
    );
  }
}
class filtred_teams extends StatefulWidget {
  filtred_teams({Key key}) : super(key: key);

  @override
  _filtred_teamsState createState() => _filtred_teamsState();
}
class _filtred_teamsState extends State<filtred_teams> {
   Future<List<Team>> getData() async{
     var url="http://192.168.1.113:8080/flutter_football/get_teams.php";
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
    //return  jsonDecode(response.body);
    /*print(json.encode(response.body));
    return json.decode(response.body);*/
  
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
      if(filteredteams.length==0){return
        new Center(
            child:new CircularProgressIndicator(
              backgroundColor: Color(0xFF112734),
              //value: 100,
            ));
       /* Column(
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
      );*/
      }
     
      return 
      Column(
       
        children:<Widget>
        
        [
          Padding(padding: EdgeInsets.only(top: 20),),
          Center(child:Text("All teams ",style:TextStyle(fontSize: 22,fontWeight:FontWeight.w900))),
          Padding(padding: EdgeInsets.only(top: 20),),
       
              TextField(
              style: TextStyle( fontWeight:FontWeight.w900),
            decoration: InputDecoration(

              contentPadding: EdgeInsets.all(15.0),
              hintText: '       Filter By  Name  Or Goubernorates',
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
                    borderSide: new BorderSide(
                      color: Theme.of(context).primaryColor
                    )
                  ),
                   prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor
                  )
            ),

     onChanged: (string) {

                setState( () {
                  filteredteams = teams
                      .where((u) => (u.team_name
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                          u.region.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });

            },

           ),
           
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
                              builder: (context) => profile_team(filteredteams[index].team_id)

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
                                    Image.network(
                                      'http://192.168.1.113:8080/flutter_football/profile_pictures/'+filteredteams[index].team_name+'.jpg''',
                                      width: 70,
                                      height: 70,
                                    ),

                                new Text(
                                  '     '+filteredteams[index].team_name,
                                     style: TextStyle(
                                       fontSize: 20.0,
                                       fontWeight: FontWeight.w900,
                                       color:Colors.black
                                     ),
                                ),]
                                ),
                              
                                new Text(
                                   '                  '+filteredteams[index].region,
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


