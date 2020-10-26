import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scorefoot/Widgets/Drawer.dart';
import 'package:scorefoot/Leagues/AcademiesClass.dart';
import 'package:scorefoot/Leagues/SecondClass.dart';
import 'package:scorefoot/Leagues/TheirdClass.dart';
import 'package:scorefoot/Leagues/FirstClass.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';






class leagues_grid extends StatelessWidget {
  var themecolor=Color(0xFF112734);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
    theme: //ThemeData.dark(),
      new ThemeData(
        primaryColor: themecolor,
        accentColor: Colors.green,
        textTheme: TextTheme(body1: TextStyle(color: Colors.black)),
        backgroundColor: themecolor,
      ),

      // new ThemeData.dark(),

      home: Myact1(),


    );

  }
}

class Myact1 extends StatefulWidget {
  @override
  _act1State createState() => _act1State();
}

class _act1State extends State<Myact1> {
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();


  void initState() {
    super.initState();


//    /*  FOR THE NOTIFICCATION : */

    firebaseMessaging.configure(

        onLaunch: (Map<String , dynamic> msg){
          print(" onLaunch called");
        },

        onResume: (Map<String , dynamic> msg){
          print(" onResume called");
        },

       onMessage: (Map<String , dynamic> msg){
          print("onMessage called");
        }
    );

    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(

          sound: true,
          alert: true,
          badge: true,
        )
    );
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings) {
      print('IOS Setting registrred');
    });

   firebaseMessaging.getToken().then((token) => print(token));

  }


  var themecolor=Color(0xFF112734);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title:Text("Leagues"),centerTitle: true,
          actions: <Widget>[
          // action button
          IconButton(
          icon: Icon(Icons.list),
      onPressed: () {

        /*Navigator.push(context, new MaterialPageRoute(
            builder: (context) =>
            new leagues()
        ));*/
      },
       ),
       ],
      ),

      drawer:getDrawer(),

      //backgroundColor:themecolor,

      body:
      DoubleBackToCloseApp(
        child:_getgridview(context),
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
       ),
    );
  }
}



Widget _getgridview(BuildContext context)
{
  var colorr=Color(0xFF112734);

  singleCard(imagepath,title1,title2,navigatepage){
    return Card(
      child:InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagepath,width: 90,height: 90,),
            Center(child:Text(title1,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w900),)),
            Center(child:Text(title2,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w900),)),

          ],
        ),
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) =>
               navigatepage)
          );
        },
      )

    );
  }
  return/* SingleChildScrollView(
      scrollDirection:Axis.vertical,
      child:*/
    Column(
    children: <Widget>[
      Text("",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900),),

      Text("Choose A League (Classes)",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900),),
      Text("",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900),),

      Text("",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900),),

      GridView.count(
        padding: const EdgeInsets.all(10),

        mainAxisSpacing: 10,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: <Widget>[
          singleCard('assets/firstclass.png'," First Class","الدرجة الاولى",FirstClass()),
          singleCard('assets/leuague2.jpg',"Second Class","الدرجة الثاني"   ,SecondClass()),

          singleCard('assets/leuague2.jpg',"Theird Class"," الدرجة الثالثة",TheirdClass()),
          singleCard('assets/academies.jpg',"Academies","براعم",AcademiesClass()),
          

          ],
          ),
     

  ],
  );
  //);

}


Widget getListview(BuildContext context){
  var themecolor=Color(0xFF112734);


  var listview=ListView(

      children:<Widget>[

        ListTile(
          title: Text("      ",style: TextStyle(fontSize:20.0,fontWeight: FontWeight.w900),),
        ),

        ListTile(
            onTap:(){
              //debugPrint('ok');
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) =>
                  new FirstClass())
              );
            },
            //leading:Icon(Icons.access_alarm),
            leading:   Image.asset('assets/firstclass.png'),
            title: Text("First Class  الدرجة الاولى   ",style: TextStyle(fontSize:19.0,fontWeight: FontWeight.w900),),
            trailing: Icon(Icons.arrow_forward_ios )

        ),


        ListTile(
          title: Text("      ",style: TextStyle(fontSize:20.0,fontWeight: FontWeight.w900),),
        ),

        ListTile(
            onTap:(){
              //debugPrint('ok');
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) =>
                  new SecondClass())
              );
            },
            //leading:Icon(Icons.access_alarm),
            leading: Image.asset('assets/leuague2.jpg'),
            title: Text("Second Classالدرجة الثانية",style: TextStyle(fontSize:19.0,fontWeight: FontWeight.w900),),
            trailing: Icon(Icons.arrow_forward_ios )

        ),



        ListTile(
          title: Text("      ",style: TextStyle(fontSize:20.0,fontWeight: FontWeight.w900),),
        ),


        ListTile(
            onTap:(){
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) =>
                  new TheirdClass())
              );
            },
            //leading:Icon(Icons.access_alarm),
            leading: Image.asset('assets/leuague2.jpg'),
            title: Text("Theird Class الدرجة الثالثة ",style: TextStyle(fontSize:19.0,fontWeight: FontWeight.w900),),
            trailing: Icon(Icons.arrow_forward_ios )

        ),


        ListTile(
          title: Text("      ",style: TextStyle(fontSize:20,fontWeight: FontWeight.w900),),
        ),

        ListTile(
            onTap:(){
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) =>
                  new AcademiesClass())
              );
            },
            //leading:Icon(Icons.access_alarm),
            leading: Image.asset('assets/academies.jpg'),
            title: Text("     Academies    براعم  ",style: TextStyle(fontSize:20.0,fontWeight: FontWeight.w900),),
            trailing: Icon(Icons.arrow_forward_ios )

        ),



      ]
  );

  return listview;
}

