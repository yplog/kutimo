import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dart:async';
import 'package:kutimo/screens/add_color_screen.dart';

import 'models/rectangle.dart';
import 'screens/color_screen.dart';

Future<void> main() async {
  await Hive.initFlutter('kutimo');
  Hive.registerAdapter(RectangleAdapter());
  Hive.registerAdapter(RecColorAdapter());
  await Hive.openBox<Rectangle>('rectangles');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0x00000000)),
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
  Future<bool> boxOperations() async {
    bool result = true;

    var box = Hive.box<Rectangle>('rectangles');

    if (box.isEmpty) {
      result = false;
    }

    if (box.length > 0) {
      DateTime today = DateTime.now();
      Rectangle? lastRec = box.getAt(box.length - 1);

      if (today.year == lastRec?.createdDate.year && today.month == lastRec?.createdDate.month && today.day == lastRec?.createdDate.day) {
        result = true; // TODO: screen change true
      } else {
        result = false;
      }
    }

    print('box size: ${box.isEmpty}, ${box.length}, result: $result');

    return result;
  }

  @override
  void initState() {
    super.initState();

    boxOperations().then((bool result) {
      if (result) {
        // Color Screen
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ColorScreen()));
      } else {
        // Add Color Screen
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const AddColorScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Image.asset('assets/images/kutimo.png')],
        ),
      ),
    );
  }
}
