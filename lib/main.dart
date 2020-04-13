import 'package:flutter/material.dart';
import 'package:timetrackerflutter/screens/landing_screen.dart';
import 'constants.dart';

void main() => runApp(TimeTracker());

class TimeTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      home: LandingScreen(),
    );
  }
}
