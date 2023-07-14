import 'package:flutter/material.dart';
import 'package:quaiz_app/Screens/first_screen.dart';

class RootApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}