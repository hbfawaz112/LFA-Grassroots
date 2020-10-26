import 'package:flutter/material.dart';
import 'package:scorefoot/ShowData/filtred_teams.dart';


class teams extends StatefulWidget {
  teams({Key key}) : super(key: key);

  @override
  _teamsState createState() => _teamsState();
}

class _teamsState extends State<teams> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: filtred_teams()
       //Gov_teams(),
    );
  }
}