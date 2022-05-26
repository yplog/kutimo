import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kutimo/models/rectangle.dart';
import 'package:kutimo/screens/add_color_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void removeAllData() {
    Box<Rectangle> rectanglesBox = Hive.box<Rectangle>('rectangles');
    rectanglesBox.deleteAll(rectanglesBox.keys);

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AddColorScreen()));
  }
  
  
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              style: style,
              onPressed: () {
                removeAllData();
              },
              child: const Text('Clear All Data'),
            )
          ),
        ],
      ),
    );
  }
}
