import 'package:flutter/material.dart';

class top10data extends StatelessWidget {
  const top10data({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getListViewTop10(context);
  }
}




Widget getListViewTop10(BuildContext context){


var listview=ListView(
  children:<Widget>[
      
        ListTile(
      title:Center(child:Text("Top 10 Scores",style: TextStyle(fontWeight:FontWeight.w900,fontSize:23)),),
        
      ),
        ListTile(
      title:Center(child:Text("جدول ترتيب الهدافين",style: TextStyle(fontWeight:FontWeight.w900,fontSize:23)),),
        
      ),
      

      ListTile(
        leading:Icon(Icons.person),
        title:Text("Player1"),
        subtitle: Text("Sportivo Academies,Janoub"),
      ),
      
      ListTile(
        leading:Icon(Icons.person),
        title:Text("Player2"),
        subtitle: Text("Classico Academies,Beiuth"),
      ),
      ListTile(
        leading:Icon(Icons.person),
        title:Text("Player3"),
        subtitle: Text("Sportivo Academies,Janoub"),
      ),
      ListTile(
        leading:Icon(Icons.person),
        title:Text("Player4"),
        subtitle: Text("mab3rf Academies,Mont Lebanon"),
      ),
      ListTile(
        leading:Icon(Icons.person),
        title:Text("Player5"),
        subtitle: Text("Sportivo Academies,Janoub"),
      ),
      ListTile(
        leading:Icon(Icons.person),
        title:Text("Player6"),
        subtitle: Text("Sportivo Academies,Janoub"),
      ),
      ListTile(
        leading:Icon(Icons.person),
        title:Text("Player7"),
        subtitle: Text("Sportivo Academies,Janoub"),
      ),
      
       ListTile(
        leading:Icon(Icons.person),
        title:Text("Player8"),
        subtitle: Text("Sportivo Academies,Janoub"),
      ),
      ListTile(
        leading:Icon(Icons.person),
        title:Text("Player9"),
        subtitle: Text("Sportivo Academies,Janoub"),
      ),
      ListTile(
        leading:Icon(Icons.person),
        title:Text("Player10"),
        subtitle: Text("Sportivo Academies,Janoub"),
      ),
      
  ],
);

return listview;

}
