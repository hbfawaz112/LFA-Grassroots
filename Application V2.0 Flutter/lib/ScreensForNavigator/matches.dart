import 'package:flutter/material.dart';
import 'package:scorefoot/Governorates/Gov_matches.dart';


class matches extends StatefulWidget {
  String matcheee;
  matches({this.matcheee});

  @override
  _matchesState createState() => _matchesState();
}

class _matchesState extends State<matches> {

  @override
  Widget build(BuildContext context) {
    return Container(
       child:Gov_matches(),
       //getlistviewmatches(),
    );
  }
}