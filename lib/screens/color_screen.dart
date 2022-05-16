import 'package:flutter/material.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Screen'),
      ),
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
