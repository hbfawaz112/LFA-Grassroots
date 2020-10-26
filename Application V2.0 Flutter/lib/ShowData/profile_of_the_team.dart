import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



//hon badde es7ab lresult of matches min data base w 3rdon 
//hon sh8l aasync w future w hek :()
//lquery 7a tkus: SELECT FROM Results_matches table WHERE MU7AFZA=$MU7AFAZA AND MAWALID=$MAWALID :)


class profile_team extends StatelessWidget {
  String id;
  int idd ;
  profile_team(String id)
  {this.id=id;
  idd = int.parse(id);}
 // const profole_team({Key key}) : super(key: key);
 
  var themecolor=Color(0xFF112734);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: //ThemeData.dark(),
      new ThemeData(
        primaryColor: themecolor,
        accentColor: Colors.green,
        textTheme: TextTheme(body1: TextStyle(color: Colors.black)),
        backgroundColor: themecolor,

      ),

      // new ThemeData.dark(),

      home: Scaffold(
        appBar: AppBar(
          title:Text("Profile of the Academies"),
          centerTitle:true,
        ),
        body:profiles_of_the_team(idd)
      ),


    );
  }
}

 
class profiles_of_the_team extends StatelessWidget {
  
  
  int iddd;
profiles_of_the_team(int iddd){this.iddd=iddd;}
  
   Future<List> getData() async{
     var url = "http://192.168.1.113:8080/flutter_football/get_team_by_id.php?team_id=$iddd";
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
  
  Future<void> _launched;
  String _phone = '76722357';

    Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

    Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  String s = ".jpg";
  List list;
ItemList(List list){this.list=list;}
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children:<Widget>[
            // Center(child:Text("Profile of the academie",style:TextStyle(fontSize: 20,fontWeight:FontWeight.w900))),
             
            Expanded(child: 
            new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context,i){
               return 
         Padding(
//          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
           padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),

           child:SingleChildScrollView(
             scrollDirection:Axis.vertical,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'http://192.168.1.113:8080/flutter_football/profile_pictures/${list[i]['team_name']+s}',
                  ),
                  radius: 60.0,
                ),
              ),
             // Divider(height: 35.0,color: Colors.grey[600],),
              SizedBox(height: 30.0,),

              Text(
                'Academie NAME :',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                '${list[i]['team_name']}',
                style: TextStyle(
                  //color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0,),

              Text(
                'adminstrator :',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                '${list[i]['adminstrator']}',
                style: TextStyle(
                  //color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),


              SizedBox(height: 30.0,),
              Text(
                'Email :',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                '${list[i]['email']}',
                style: TextStyle(
               //   color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0,),

              Text(
                'Phone Number :',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0,),

              Row(
                children: <Widget>[
                  Text(
                    '${list[i]['phone']}',
                    style: TextStyle(
                     // color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("                                                       "),
                  IconButton(
                    icon: Icon(Icons.call) ,
                  onPressed: ()=>{_launched = _makePhoneCall('tel:'+'${list[i]['phone']}')}
                            )
                ],
              ),
              SizedBox(height: 30.0,),

              Text(
                'Location :',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),

              SizedBox(height: 10.0,),
              Row(
                children: <Widget>[
                  Text(
                    '${list[i]['location']} ',
                    style: TextStyle(
                     // color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("       "),
                  IconButton(icon:Icon(Icons.location_on),
                   onPressed:()=>{
                        _launched = _launchInBrowser('${list[i]['map_url']}')   
                        
                   })
                ],
              ),


            ],
          ),
           ),
        );
            
      }

    )

            )
      ]
    );
       }
}

