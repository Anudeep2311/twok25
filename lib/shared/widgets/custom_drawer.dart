import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final void Function(String section) onSectionSelected;

  const CustomDrawer({super.key, required this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    final bgColor = Theme.of(context).drawerTheme.backgroundColor ??
        Theme.of(context).scaffoldBackgroundColor;

    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: isDark ? const Color(0xFF2C2A4A) : Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text("Home", style: TextStyle(color: textColor)),
            onTap: () => onSectionSelected("home"),
          ),
          ListTile(
            title: Text("Projects", style: TextStyle(color: textColor)),
            onTap: () => onSectionSelected("projects"),
          ),
          ListTile(
            title: Text("About", style: TextStyle(color: textColor)),
            onTap: () => onSectionSelected("about"),
          ),
          ListTile(
            title: Text("Contact", style: TextStyle(color: textColor)),
            onTap: () => onSectionSelected("contact"),
          ),
        ],
      ),
    );
  }
}
