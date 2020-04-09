import 'package:flutter/material.dart';
import 'gradient_back.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
} 

class _CalendarScreenState extends State<CalendarScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: null,),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child:Icon(
                  Icons.mood,
                  color: Colors.amber,
                  size: 45,
                  ),
              )
            ],
          )
        ],
      ),
    );
  }
}