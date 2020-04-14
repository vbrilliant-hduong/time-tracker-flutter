import 'package:flutter/material.dart';
import 'package:timetrackerflutter/screens/sign_in_screen.dart';
import 'package:timetrackerflutter/services/auth.dart';
import 'home_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({@required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder <User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInScreen(
              auth: auth,
            );
          }
          return HomepageScreen(
            auth: auth,
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}