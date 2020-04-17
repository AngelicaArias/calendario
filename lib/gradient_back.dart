import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  
  double height = 0.0;
  String title = "Calendario";

  GradientBack({Key key, this.height, this.title});

  @override
  Widget build(BuildContext context) {
  
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidht = MediaQuery.of(context).size.width;
       
       if (height == null){
         height = screenHeight;
       }

    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.cyan[900],
            Colors.greenAccent
          ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.5, 2.5),
             stops: [0.0, 0.5],

        )
      ),
        /* child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold
        ),
      ),*/
          //alignment: Alignment(-0.9, -0.6),
    );
  }
}
