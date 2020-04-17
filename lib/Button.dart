import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  String buttonText;


  Button(this.buttonText);
 
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("El registro fue exitoso"),
          )
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 350.0,
          left: 150.0,
          right: 30.0
        ),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [
                Colors.pink,
                Colors.pinkAccent[100]
            ],
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1.0, 0.6),
            tileMode: TileMode.clamp
          )
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: "SpecialElite",
              fontWeight: FontWeight.bold 

            ),

          ),
        ),
      ),
      
    );
  }
}