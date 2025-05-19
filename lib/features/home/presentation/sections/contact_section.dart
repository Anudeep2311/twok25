import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:online_profile/shared/widgets/custom_text.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 600),
      child: SlideAnimation(
        verticalOffset: 40,
        child: FadeInAnimation(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Contact',
                  size: 24,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 12),
                const Text(
                  "Have a project, question, or just want to connect? Drop me a message.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Enter your message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  maxLines: 5,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // You can later connect this to Firestore or EmailJS
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Thanks! Message sent.")),
                      );
                      controller.clear();
                    },
                    child: const Text('Send'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
