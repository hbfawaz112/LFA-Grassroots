import 'package:scorefoot/Leagues/AcademiesClass.dart';
import 'package:scorefoot/Leagues/FirstClass.dart';
import 'package:scorefoot/Leagues/SecondClass.dart';
import 'package:scorefoot/Leagues/TheirdClass.dart';
import 'package:scorefoot/Widgets/feedback.dart';
import 'package:scorefoot/Widgets/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:share/share.dart';



import 'dart:async';

class getDrawer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    share(BuildContext context) {
      final RenderBox box = context.findRenderObject();
      Share.share("Dowlnload our app from : https....",
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
      );
    }

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

    
    return Drawer(
        child: new ListView(
            children: <Widget>[

      // Text(""),
              
              Row(
                children:<Widget>[
                Text("                   ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900),),
              // Icon(Icons.home)

                ],
              ),
              

              new ListTile(
                  title:Text("All lebanese Leagues ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                onTap:(){ Navigator.pop(context);},
           ),
              //new Divider(),

                     new ListTile(
                       title:Text("First Class  الدرجة الاولى",style: TextStyle(fontSize: 15,)),
                       trailing:new Icon(Icons.keyboard_arrow_right),
                       leading:   Image.asset('assets/firstclass.png',width: 40,height: 40),
                       onTap:(){
                         //debugPrint('ok');
                         Navigator.push(context, new MaterialPageRoute(
                             builder: (context) =>
                             new FirstClass())
                         );

                         },

                       //trailing:new Icon(Icons.settings)
                     ),
              new ListTile(
                title:Text("Second Class   الدرجة الثاني",style: TextStyle(fontSize: 15,)),
                trailing:new Icon(Icons.keyboard_arrow_right),
                leading: Image.asset('assets/leuague2.jpg',width: 40,height: 40),
                onTap:(){
                  //debugPrint('ok');
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) =>
                      new SecondClass())
                  );
                },

                //trailing:new Icon(Icons.settings)
              ),
              new ListTile(
                title:Text("Theird Class   الدرجة الثالثة",style: TextStyle(fontSize: 15,)),
                trailing:new Icon(Icons.keyboard_arrow_right),
                leading: Image.asset('assets/leuague2.jpg',width: 40,height: 40),
                onTap:(){
                  //debugPrint('ok');
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) =>
                      new TheirdClass())
                  );
                },
                //trailing:new Icon(Icons.settings)
              ),
              new ListTile(
                title:Text("Academies براعم",style: TextStyle(fontSize: 15,)),
                trailing:new Icon(Icons.keyboard_arrow_right),
                leading: Image.asset('assets/academies.jpg',width: 40,height: 40),
                onTap:(){
                  //debugPrint('ok');
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) =>
                      new AcademiesClass())
                  );
                },

                //trailing:new Icon(Icons.settings)
              ),
              new Divider(),
             // new Divider(),
              new ListTile(
                  title:Text("Settings"),
                  trailing:new Icon(Icons.settings),
                  onTap:(){
        //debugPrint('ok');
        Navigator.push(context, new MaterialPageRoute(
        builder: (context) =>
        new setting())
          );
        },
          ),
              new ListTile(
                title:Text("Share"),
                trailing:new Icon(Icons.share),
                onTap:(){
                  share(context);
                },
              ),


              new ListTile(
                       title:Text("Send us Feedback"),
                       trailing:new Icon(Icons.message),
                  onTap:(){
        //debugPrint('ok');
        Navigator.push(context, new MaterialPageRoute(
        builder: (context) =>
        new feedback())
    );
  },
                     ),
                      new ListTile(
                       title:Text("Rait us "),
                       trailing:ImageIcon(
               AssetImage("assets/icons/like.png"),
                    color: Color(0xFF112734),
                    size: 25,

               ),
                  onTap:(){ },
                     ),
                     
              //new Divider(),

              new Divider(),

                       new ListTile(
                         //leading:new Icon(Icons.copyright),
                          //isThreeLine: true,
                          title: Text("Developers :                                           Hussein B.Fawaz && abbas sherkawi ",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),),
                     ),


              Row(
                       children: <Widget>[
                        Text("     "),
                         SignInButton(
                           Buttons.Facebook,
                           mini: true,
                           onPressed: () {
                             _launched = _launchInBrowser("https://www.facebook.com/profile.php?id=100011177776172");

                           },

                         ),
                         Text(" "),

                         Text(" "),
                         SignInButton(
                           Buttons.GitHub,
                           mini: true,
                           onPressed: () {
                             _launched = _launchInBrowser("https://github.com/hbfawaz112");

                           },

                         ),
                         Text(" "),

                         Text(" "),
                         SignInButton(
                           Buttons.Twitter,
                           mini: true,
                           onPressed: () {
                             _launched = _launchInBrowser("https://twitter.com/hussfwz");

                           },

                         ),
                         Text(" "),
                         Text(" "),

                        // Text(" "),
                         SignInButton(
                           Buttons.Email,
                           mini: true,
                           onPressed: () {},

                         ),
                         Text(" "),
                         Text(" "),
                      IconButton(icon: Icon(Icons.call),
                          onPressed:(){
                            _launched = _makePhoneCall('tel:$_phone');
                          },

                      )



                       ],
                     )

                        
//Navigator.of(context).pushNamed('/signup')


            ],

        )
      );
  }
}
