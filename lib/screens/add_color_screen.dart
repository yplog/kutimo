import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kutimo/screens/color_screen.dart';

import '../models/rectangle.dart';

class AddColorScreen extends StatefulWidget {
  const AddColorScreen({Key? key}) : super(key: key);

  @override
  State<AddColorScreen> createState() => _AddColorScreenState();
}

class _AddColorScreenState extends State<AddColorScreen> {
  TextEditingController noteController = TextEditingController();
  bool _isRed = false;
  bool _isBlue = false;
  bool _isYellow = false;
  bool _isGreen = false;
  bool _isPurple = false;
  bool _isBlack = false;

  void addColor(note, RecColor color) {
    Box<Rectangle> rectanglesBox = Hive.box<Rectangle>('rectangles');
    rectanglesBox
        .add(Rectangle(rectanglesBox.length, note, color, DateTime.now()));

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ColorScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: TextField(
                  maxLength: 40,
                  controller: noteController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your note',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isBlue = !_isBlue;
                          _isRed = false;
                          _isYellow = false;
                          _isGreen = false;
                          _isPurple = false;
                          _isBlack = false;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _isBlue
                              ? const Icon(
                                  Icons.check,
                                  size: 30.0,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.check_box_outline_blank,
                                  size: 30.0,
                                  color: Colors.blue,
                                ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isRed = !_isRed;
                          _isBlue = false;
                          _isYellow = false;
                          _isGreen = false;
                          _isPurple = false;
                          _isBlack = false;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _isRed
                              ? const Icon(
                                  Icons.check,
                                  size: 30.0,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.check_box_outline_blank,
                                  size: 30.0,
                                  color: Colors.red,
                                ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isYellow = !_isYellow;
                          _isRed = false;
                          _isBlue = false;
                          _isGreen = false;
                          _isPurple = false;
                          _isBlack = false;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.yellow),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _isYellow
                              ? const Icon(
                                  Icons.check,
                                  size: 30.0,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.check_box_outline_blank,
                                  size: 30.0,
                                  color: Colors.yellow,
                                ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isGreen = !_isGreen;
                          _isYellow = false;
                          _isRed = false;
                          _isBlue = false;
                          _isPurple = false;
                          _isBlack = false;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.green),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _isGreen
                              ? const Icon(
                                  Icons.check,
                                  size: 30.0,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.check_box_outline_blank,
                                  size: 30.0,
                                  color: Colors.green,
                                ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isPurple = !_isPurple;
                          _isGreen = false;
                          _isYellow = false;
                          _isRed = false;
                          _isBlue = false;
                          _isBlack = false;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.purple),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _isPurple
                              ? const Icon(
                                  Icons.check,
                                  size: 30.0,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.check_box_outline_blank,
                                  size: 30.0,
                                  color: Colors.purple,
                                ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isBlack = !_isBlack;
                          _isGreen = false;
                          _isYellow = false;
                          _isRed = false;
                          _isBlue = false;
                          _isPurple = false;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle, color: Colors.black),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _isBlack
                              ? const Icon(
                                  Icons.check,
                                  size: 30.0,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.check_box_outline_blank,
                                  size: 30.0,
                                  color: Colors.black,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var color;
          if (_isBlack) color = RecColor.BLACK;
          if (_isPurple) color = RecColor.PURPLE;
          if (_isGreen) color = RecColor.GREEN;
          if (_isRed) color = RecColor.RED;
          if (_isBlue) color = RecColor.BLUE;
          if (_isYellow) color = RecColor.YELLOW;

          addColor(noteController.text, color);
        },
        tooltip: 'Add new color',
        splashColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
