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
            Color(0xFF00C853),
            Color(0xFF69F0AE)
          ],
        begin: FractionalOffset(0.2, 0.0),
        end: FractionalOffset(1.0, 0.6),
             stops: [0.0, 0.6],
             tileMode: TileMode.clamp
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
