import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetrackerflutter/common_widgets/platform_alert_dialog.dart';
import 'package:timetrackerflutter/services/auth.dart';

class HomepageScreen extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure you want to Logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);

    if (didRequestSignOut) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
    );
  }
}
