import 'package:flutter/material.dart';
import 'package:online_profile/features/home/data/models/project_model.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel project;

  const ProjectTile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.title ?? '',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(project.description ?? '',
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 12),
                if ((project.imageUrl ?? '').isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(project.imageUrl!),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
