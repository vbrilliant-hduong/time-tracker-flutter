import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:timetrackerflutter/screens/landing_screen.dart';
import 'package:timetrackerflutter/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(TimeTracker());

class TimeTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        title: 'Time Tracker',
        theme: ThemeData(
          primarySwatch: kPrimaryColor,
        ),
        home: LandingScreen(),
      ),
    );
  }
}
