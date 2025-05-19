import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_profile/features/home/data/models/project_model.dart';

class ProjectRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<ProjectModel>> fetchProjects() async {
    final snapshot = await _db.collection('projects').get();
    return snapshot.docs.map((doc) => ProjectModel.fromFirestore(doc)).toList();
  }
}
