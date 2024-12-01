import 'package:flutter/material.dart';

import '../widgets/animated_background.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Stack(
        children: [
             CustomPaint(
          painter: SpaceBackgroundPainter2(),
          size: Size.infinite,
        ),
          ListView(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: _darkMode,
                onChanged: (value) {
                  setState(() {
                    _darkMode = value;
                  });
                  // Implement dark mode logic
                },
              ),
              SwitchListTile(
                title: const Text('Notifications'),
                value: _notifications,
                onChanged: (value) {
                  setState(() {
                    _notifications = value;
                  });
                  // Implement notifications logic
                },
              ),
              ListTile(
                title: const Text('Language'),
                trailing: DropdownButton<String>(
                  value: 'English',
                  onChanged: (String? newValue) {
                    // Implement language change logic
                  },
                  items: <String>['English', 'Spanish', 'French', 'German']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to Privacy Policy page
                },
              ),
              ListTile(
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to Terms of Service page
                },
              ),
              const ListTile(
                title: Text('App Version'),
                subtitle: Text('1.0.0'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}