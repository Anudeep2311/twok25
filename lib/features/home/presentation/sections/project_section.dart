import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_profile/shared/widgets/custom_text.dart';

import '../home_view_model.dart';
import '../widgets/project_tile.dart';

class ProjectsSection extends HookConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectListProvider);

    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AnimationConfiguration.synchronized(
            duration: Duration(milliseconds: 600),
            child: SlideAnimation(
              verticalOffset: 40,
              child: FadeInAnimation(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomText(
                    text: 'Projects',
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          projectsAsync.when(
            data: (projects) => LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 800;
                final crossAxisCount = isWide ? 2 : 1;

                return Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 20,
                  children: List.generate(projects.length, (index) {
                    final project = projects[index];

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: SizedBox(
                            width: isWide
                                ? constraints.maxWidth / 2 - 32
                                : constraints.maxWidth - 32,
                            child: ProjectTile(project: project),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
          ),
        ],
      ),
    );
  }
}
