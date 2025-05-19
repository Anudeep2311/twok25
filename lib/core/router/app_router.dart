import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_profile/features/home/presentation/home_page.dart';
import 'package:online_profile/features/home/presentation/sections/about_section.dart';
import 'package:online_profile/features/home/presentation/sections/contact_section.dart';
import 'package:online_profile/features/home/presentation/sections/project_section.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => const AboutSection(),
      ),
      GoRoute(
        path: '/projects',
        builder: (context, state) => const ProjectsSection(),
      ),
      GoRoute(
        path: '/contact',
        builder: (context, state) => const ContactSection(),
      ),
    ],
  );
}
