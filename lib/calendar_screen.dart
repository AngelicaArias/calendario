import 'package:flutter/material.dart';
import 'gradient_back.dart';
import 'title_header.dart';
import 'Button.dart';
import 'calendario.dart';

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
            ListView(
            children: <Widget>[
              TitleHeader("GELYFUN", 1),
              Button("Guardar"),
              Calendario()
            ],
          ),
        ],
      ),
    );
  }
}