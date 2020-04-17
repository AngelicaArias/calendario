import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'calendario.dart';
//import 'gradient_back.dart';
//import 'calendar_screen.dart';
//import 'title_header.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:[
        const Locale('en'), // Inglés
        const Locale('es'), // Español
        const Locale.fromSubtags(languageCode: 'zh'),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
        
    //home: CalendarScreen(),
    //home: MyHomePage(title: 'Flutter Demo Home Page'),
    home: Calendario()
    //home: GradientBack(height: null), 3
    /*home: Scaffold(
       appBar: AppBar(
         title: Text("GELYFUN"),
       ),
       body: new TitleHeader("GELYFUN", 1),
    ),*/
    );
  }
}



