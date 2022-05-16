import 'package:flutter/material.dart';
import 'dart:async';
import 'package:kutimo/screens/add_color_screen.dart';
import 'package:path/path.dart' as Path;
import 'package:sqflite/sqflite.dart';

import 'screens/color_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0x00000000)
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool> deneme() async {
    bool result = false;
    await Future.delayed(const Duration(seconds: 3)).then((_) {
      result = true;
    });
    return result;
  }

  @override
  void initState() {
    super.initState();
    deneme().then((bool result) {
      if (result) {
        // Color Screen
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ColorScreen()));
      } else {
        // Add Color Screen
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AddColorScreen()));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/kutimo.png')
          ],
        ),
      ),
    );
  }
}