import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:online_profile/features/home/presentation/sections/about_section.dart';
import 'package:online_profile/features/home/presentation/sections/contact_section.dart';
import 'package:online_profile/features/home/presentation/sections/footer_section.dart';
import 'package:online_profile/features/home/presentation/sections/hero_sections.dart';
import 'package:online_profile/features/home/presentation/sections/project_section.dart';
import 'package:online_profile/features/home/presentation/widgets/section_seperator.dart';
import 'package:online_profile/shared/providers/theme_provider.dart';
import 'package:online_profile/shared/widgets/custom_drawer.dart';

final aboutKey = GlobalKey();
final projectsKey = GlobalKey();
final contactKey = GlobalKey();
final scrollController = ScrollController();

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void scrollToSection(String section) {
      final keyMap = {
        'about': aboutKey,
        'projects': projectsKey,
        'contact': contactKey,
      };

      final key = keyMap[section];
      if (key?.currentContext != null) {
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    }

    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      drawer: CustomDrawer(
        onSectionSelected: (section) {
          Navigator.pop(context); // Close drawer

          Future.delayed(const Duration(milliseconds: 300), () {
            final contextMap = {
              "about": aboutKey,
              "projects": projectsKey,
              "contact": contactKey,
            };
            final key = contextMap[section];
            if (key?.currentContext != null) {
              Scrollable.ensureVisible(
                key!.currentContext!,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
            } else {
              scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut);
            }
          });
        },
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroSection(
              scrollToSection: scrollToSection,
            ),
            const SectionSeparator(color: Color(0xFFF5F7FA)),
            Container(key: aboutKey, child: const AboutSection()),
            const SectionSeparator(color: Color(0xFF0F172A)),
            Container(key: projectsKey, child: const ProjectsSection()),
            const SizedBox(height: 30),
            Container(key: contactKey, child: const ContactSection()),
           const FooterSection(),
          ],
        ),
      ),
    );
  }
}
