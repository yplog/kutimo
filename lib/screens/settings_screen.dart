import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text(
          'This is the settings screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
