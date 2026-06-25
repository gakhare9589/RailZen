import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const ProfilePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text("Dark Mode"),
            value: isDarkMode,
            onChanged: onThemeChanged,
          ),
        ),
      ),
    );
  }
}