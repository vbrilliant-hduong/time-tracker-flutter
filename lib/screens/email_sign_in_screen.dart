import 'package:flutter/material.dart';
import 'package:timetrackerflutter/components/email_sign_in_form.dart';
import 'package:timetrackerflutter/services/auth.dart';

class EmailSignInScreen extends StatelessWidget {
  EmailSignInScreen({@required this.auth});
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInForm (
              auth: auth,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
