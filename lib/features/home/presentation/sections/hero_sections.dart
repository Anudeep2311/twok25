import 'dart:ui';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final void Function(String section) scrollToSection;

  const HeroSection({super.key, required this.scrollToSection});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background
        Container(
          width: double.infinity,
          height: 400,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF818CF8), Color(0xFF3B82F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        // Background image with blur
        Positioned.fill(
          child: Opacity(
            opacity: 0.2,
            child: Image.network(
              'https://images.unsplash.com/photo-1557682250-33bd709cbe85?fit=crop&w=1400&q=80',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.transparent),
          ),
        ),

        // Text + button
        const Positioned.fill(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hi, I’m Anudeep 👋',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Flutter Developer | UI Specialist | Firebase Enthusiast',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),

        // Explore Projects Button
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton(
              onPressed: () => scrollToSection("projects"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text("Explore Projects"),
            ),
          ),
        ),
      ],
    );
  }
}
