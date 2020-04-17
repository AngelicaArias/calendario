import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
 

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  void _handleNewDate(date){
    setState(() {
          _selectedDay = date;
          _selectedEvents = _events[_selectedDay] ?? [];
        });
        print(_selectedEvents);
  }

   List _selectedEvents;
   DateTime _selectedDay;
  
   final Map _events = {
     DateTime(2020, 4, 1): [
      {'name': 'Event A', 'isDone': true},
    ],
    DateTime(2020, 4, 4): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2020, 4, 5): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2020, 4, 13): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2020, 4, 15): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2020, 4, 26): [
      {'name': 'Event A', 'isDone': false},
    ],
    
   };
  @override
  void initState(){
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(
      //  backgroundColor: Theme.of(context).hintColor,
        //title: Text("Calendario"),
      //),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Calendar(
                events: _events,
                onRangeSelected: (range) =>
                   print("Range is ${range.from}, ${range.to}"),
                onDateSelected: (date) => _handleNewDate(date),
                isExpandable: true,
                showArrows: true,
                eventDoneColor: Colors.pinkAccent,
                eventColor: Colors.pinkAccent[100]),
              ),
              _buildEventList()
          ],
        ),
      ),
     ); 
    
  }
  Widget _buildEventList(){
     return Expanded(
       child: ListView.builder(
         itemBuilder: (BuildContext context, int index) => Container(
           decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(width: 1.5, color: Colors.black12),
             ),
           ),
           padding:
               const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
            child: ListTile(
              title: Text(_selectedEvents[index]['name'].toString()),
              onTap: (){},
              ),
         ),
        itemCount: _selectedEvents.length,
       ),
    );
  }
}  