import 'package:flutter/material.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint('ihihi');
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
