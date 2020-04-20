import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CalendarScreen extends StatefulWidget {
  @override
  
  _CalendarScreenState createState() => _CalendarScreenState();
} 

class _CalendarScreenState extends State<CalendarScreen> {
   CalendarController _controller;
   Map<DateTime,List<dynamic>> _events;
   List<dynamic> _selectedEvents;
   TextEditingController _eventController;
   SharedPreferences prefs;

   @override
     void initState(){
       super.initState();
       _controller = CalendarController();
       _eventController = TextEditingController();
       _events = {};
       _selectedEvents = [];
       initPrefs();
     }
     initPrefs() async{
       prefs = await SharedPreferences.getInstance();
       setState(() {
         _events = Map<DateTime,List<dynamic>>.from(decodeMap(json.decode(prefs.getString
         ("events") ?? "{}")));
              });
     }
       Map<String,dynamic> encodeMap(Map<DateTime,dynamic> map){
         Map<String,dynamic> newMap = {};
         map.forEach((key, value){
           newMap[key.toString()] = map[key];
         });
         return newMap;
       }
       Map<DateTime,dynamic> decodeMap(Map<String,dynamic>map){
         Map<DateTime,dynamic> newMap = {};
         map.forEach((key, value){
           newMap[DateTime.parse(key)] = map[key];
         });
         return newMap;
       }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              calendarStyle: CalendarStyle(
                //Quita los dias de la semna
                renderDaysOfWeek: true, 
                //Margenes
                contentPadding: EdgeInsets.only(
                  top: 5.0,
                  left: 50.0,
                  right: 50.0
                ),
                //Dias del mes
                weekdayStyle: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 18.0,
                  color: Colors.black
                ),
                 // Fines de semana
                weekendStyle: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 18.0,
                  color: Colors.tealAccent[700]
                ),
                //fines de semana fuera del mes actual
                outsideWeekendStyle: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 18.0,
                  color: Colors.tealAccent[700].withOpacity(0.3)
                ),
              ),
              //fines de semana
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(
                  fontFamily: "Lato",
                  color: Colors.tealAccent[700]
                ),
                //dias de la semana
                weekdayStyle:TextStyle(
                  fontFamily: "Lato",
                  color: Colors.black
                )
              ),
             headerStyle: HeaderStyle(
               //Boton eliminado
               formatButtonVisible: false,
               //Titulo centrado
               centerHeaderTitle: true,
               //Merhenes del heder
                headerMargin: EdgeInsets.only(
                  top: 200.0,
                  left: 60.0,
                  right: 60.0
                ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal[700],
                      Colors.greenAccent[400]
                    ],
                    begin: FractionalOffset(0.2, 0.0),
                    end: FractionalOffset(1.0, 0.6),
                    tileMode: TileMode.clamp
                  )
                ), 
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 25.0,
                  ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 25.0,
                ),
                titleTextStyle: TextStyle(   
                  fontSize: 20.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  color: Colors.white           
                ),
              
             ),
             onDaySelected:(date, events){
               setState(() {
                 _selectedEvents = events;                  
              });
             }, 
             builders: CalendarBuilders(
                 selectedDayBuilder: (context,date, events)=>
                 Container(
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                      gradient: LinearGradient(
                       colors: [
                            Colors.teal,
                            Colors.greenAccent[400]
                         ],
                             begin: FractionalOffset(0.2, 0.0),
                             end: FractionalOffset(1.0, 0.6),
                             tileMode: TileMode.clamp
                  )
                   ),
                   child: Text(
                     date.day.toString(), 
                     style: TextStyle(
                     color: Colors.white
                   ),
                   ),
                 ),
                 todayDayBuilder: (context,date, events) =>
                 Container(
                  alignment: Alignment.center,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                      gradient: LinearGradient(
                       colors: [
                            Colors.teal,
                            Colors.greenAccent[400]
                         ],
                             begin: FractionalOffset(0.2, 0.0),
                             end: FractionalOffset(1.0, 0.6),
                             tileMode: TileMode.clamp
                  )
                   ),
                   child: Text(
                     date.day.toString(), 
                     style: TextStyle(
                     color: Colors.white
                   ),
                   ),
                 )
               ),

              calendarController: _controller,
              
            ),
             ... _selectedEvents.map((event) => ListTile(
              title: Text(event),
              ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }
  _showAddDialog(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _eventController,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Guardar"),
            onPressed: (){
              if(_eventController.text.isEmpty) return;
              setState(() {
                 if(_events[_controller.selectedDay] != null){
                 _events[_controller.selectedDay].add(_eventController.text);
                }else{
                 _events[_controller.selectedDay] = [_eventController.text];
               }
               prefs.setString("events", json.encode(encodeMap(_events)));
               _eventController.clear();
               Navigator.pop(context);
              });
            },
            )
        ],
      )
    );
  }
}

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.teal,
            Colors.greenAccent
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
          stops: [0.0, 1.0]
        )
      ),
      child: Row(
        children: <Widget>[
          Container(
             margin: EdgeInsets.only(
                  top: 50.0,
                  left: 60.0,
                  right: 20.0
                ),
                child: Text(
                  "GELYFUN",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 40.0,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.left,
                ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 50.0,
            ),
            child: Icon(Icons.date_range, size: 40.0,),
          )
        ],
      ),
    );
  }
}