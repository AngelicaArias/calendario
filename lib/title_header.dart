import 'package:flutter/material.dart';
class TitleHeader extends StatelessWidget {
  
  String title ="";

  TitleHeader({Key key, @required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontFamily: "SpecialElite",
        fontWeight: FontWeight.bold
      ),
      
    );
  }
}