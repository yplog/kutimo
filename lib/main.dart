import 'package:flutter/material.dart';
import 'package:kutimo/screens/add_color_screen.dart';
import 'dart:async';
import 'package:kutimo/utils/custom_rect_drawer.dart';

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
    var result;
    await Future.delayed(const Duration(seconds: 3)).then((_) {
      print('Deneme');
      result = true;
    });
    return result;
  }

  @override
  void initState() {
    super.initState();
    print('init state');
    print('Done');
    deneme().then((bool result) {
      print('result $result');
      if (result) {
        print('if');
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ColorScreen()));
      } else {
        print('else');
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