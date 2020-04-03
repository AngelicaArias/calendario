import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {

  String title = "Calendario";
  double height = 0.0;

  GradientBack(this.title, this.height);

  @override
  Widget build(BuildContext context) {
  
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4268D3),
            Color(0xFF4268D3)
          ],
        begin: FractionalOffset(0.2, 0.0),
        end: FractionalOffset(1.0, 0.6),
             stops: [0.0, 0.6],
             tileMode: TileMode.clamp
        )
      ),


      child: Text(
        title,
        style: TextStyle(
          color: Colors.amber,
          fontSize: 30.0
        ),
      ),
    );
  }
}