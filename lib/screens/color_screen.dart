import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              debugPrint('ihihi');
            },
            child: const Text('Go back!'),
          ),
        ),
      ),
    );
  }
}

