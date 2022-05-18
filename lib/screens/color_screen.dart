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
        child: GridView.count(
          crossAxisCount: 10,
          children: List.generate(100, (index) {
            return Center(
              child: InkWell(
                onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            title: Text('$index'),
                            content: const Text('Desc'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ])),
                child: Text('$index'),
              ),
            );
          }),
        ),
      ),
    );
  }
}
