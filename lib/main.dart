import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';


void main() {
  runApp( MyApp());
}
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
    theme: ThemeData(

      primarySwatch: Colors.deepPurple,
    ),
      initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' :(context) => Home(),
      '/location' :(context) => ChooseLocation()
    },
  );
  }
}

