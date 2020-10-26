import 'package:flutter/material.dart';
import 'package:scorefoot/Governorates/Gov_results.dart';

class results extends StatefulWidget {
  results({Key key}) : super(key: key);

  @override
  _resultsState createState() => _resultsState();
}

class _resultsState extends State<results> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Gov_results(),
    );
  }
}