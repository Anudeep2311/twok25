import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_profile/features/home/data/models/project_model.dart';
import 'package:online_profile/features/home/domain/fire_store_repo.dart';

final projectListProvider = FutureProvider<List<ProjectModel>>((ref) async {
  return await ProjectRepository().fetchProjects();
});
