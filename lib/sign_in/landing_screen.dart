import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetrackerflutter/services/database.dart';
import 'package:timetrackerflutter/sign_in/sign_in_screen.dart';
import 'package:timetrackerflutter/services/auth.dart';
import '../home/jobs/jobs_screen.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInScreen.create(context);
          }
          return Provider<Database>(
              create: (_) => FirestoreDatabase(uid: user.uid),
              child: JobsScreen());
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
