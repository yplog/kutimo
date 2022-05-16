import 'package:flutter/material.dart';

class AddColorScreen extends StatelessWidget {
  const AddColorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Color Screen'),
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
