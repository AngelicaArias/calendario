import 'package:flutter/material.dart';
class TitleHeader extends StatelessWidget {
  
  String title;
  int icontitle;

  TitleHeader(this.title, this.icontitle);
  
  @override
  Widget build(BuildContext context) {
    final title_icon = Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 110.0,
                  left: 60.0,
                  right: 20.0
                ),

                child:Text(
                  title,
                  style: TextStyle(
                   fontSize: 40.0,
                   fontFamily: "SpecialElite",
                   fontWeight: FontWeight.bold,
                   color: Colors.black

                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 100.0,
                ),
                child: Icon(
                  Icons.date_range,
                  size: 40.0,

                ),
              )

            ],
          );

    return title_icon;
  }
}