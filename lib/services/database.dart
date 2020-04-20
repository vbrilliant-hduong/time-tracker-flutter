import 'package:meta/meta.dart';
import 'package:timetrackerflutter/home/models/job.dart';
import 'package:timetrackerflutter/services/api_path.dart';
import 'package:timetrackerflutter/services/firestore_service.dart';

abstract class Database {
  Future<void> setJob(Job job);

  Future<void> deleteJob(Job job);

  Stream<List<Job>> jobStream();
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<void> setJob(Job job) async => await _service.setData(
        path: APIPath.job(uid, job.id),
        data: job.toMap(),
      );

  @override
  Future<void> deleteJob(Job job) async => await _service.deleteData(
        path: APIPath.job(uid, job.id),
      );

  Stream<List<Job>> jobStream() => _service.collectionStream(
        path: APIPath.jobs(uid),
        builder: (data, documentId) => Job.fromMap(data, documentId),
      );
}
