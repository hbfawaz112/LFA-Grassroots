import 'package:flutter/material.dart';
import 'package:scorefoot/Governorates/Gov_rank.dart';

class rank extends StatefulWidget {
  @override
  _rankState createState() => _rankState();
}

class _rankState extends State<rank> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child:Gov_rank(),
    );

  }
}