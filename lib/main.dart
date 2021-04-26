import 'package:flutter/material.dart';
import 'package:travel_guide/view/screens/entry_screen.dart';
import 'package:travel_guide/view/screens/home_screen.dart';
import 'package:travel_guide/view/screens/place_attraction.dart';

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EntryPage(),
      navigatorKey: navigatorKey,
    );
  }
}