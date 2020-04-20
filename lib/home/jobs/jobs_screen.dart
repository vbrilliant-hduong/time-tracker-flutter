import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:timetrackerflutter/common_widgets/platform_alert_dialog.dart';
import 'package:timetrackerflutter/common_widgets/platform_exception_alert_dialog.dart';
import 'package:timetrackerflutter/home/jobs/edit_job_screen.dart';
import 'package:timetrackerflutter/home/jobs/job_list_tile.dart';
import 'package:timetrackerflutter/home/jobs/list_items_builder.dart';
import 'package:timetrackerflutter/home/models/job.dart';
import 'package:timetrackerflutter/services/auth.dart';
import 'package:timetrackerflutter/services/database.dart';

class JobsScreen extends StatelessWidget {
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

  Future<void> _delete(BuildContext context, Job job) async {
    try {
      final db = Provider.of<Database>(context, listen: false);
      await db.deleteJob(job);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Operation failed',
        exception: e,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
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
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => EditJobScreen.show(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final db = Provider.of<Database>(context);
    return StreamBuilder<List<Job>>(
      stream: db.jobStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<Job>(
            snapshot: snapshot,
            itemBuilder: (context, job) => Dismissible(
                  key: Key('job-${job.id}'),
                  background: Container(color: Colors.red),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) => _delete(context, job),
                  child: JobListTile(
                    job: job,
                    onTap: () => EditJobScreen.show(context, job: job),
                  ),
                ));
      },
    );
  }
}
