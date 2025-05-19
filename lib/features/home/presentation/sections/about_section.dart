import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:online_profile/shared/widgets/custom_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimationConfiguration.synchronized(
      duration: Duration(milliseconds: 600),
      child: SlideAnimation(
        verticalOffset: 40,
        child: FadeInAnimation(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'About Me',
                  size: 24,
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 12),
                Text(
                  "Hey, I'm Anudeep — a passionate Flutter developer with a knack for crafting stunning UIs and smooth experiences. I specialize in building high-quality mobile and web apps using Flutter, Firebase, and clean architecture. Whether it's performance, design, or seamless functionality, I care about delivering top-notch software.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
