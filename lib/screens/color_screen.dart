import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kutimo/models/rectangle.dart';
import 'package:kutimo/screens/settings_screen.dart';
import 'package:kutimo/utils/custom_rect_drawer.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  int colorToInt(recColor) {
    var color;

    if (RecColor.black == recColor) color = 0xFF000000;
    if (RecColor.purple == recColor) color = 0xFF9C27B0;
    if (RecColor.red == recColor) color = 0xFFF44336;
    if (RecColor.blue == recColor) color = 0xFF2196F3;
    if (RecColor.yellow == recColor) color = 0xFFFFEB3B;
    if (RecColor.white == recColor) color = 0xFFFFFFFF;
    if (RecColor.green == recColor) color = 0xFF4CAF50;

    return color;
  }

  String dateFormat(date) {
    return '${date.year}/${date.month}/${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: Hive.box<Rectangle>('rectangles').listenable(),
              builder: (context, Box<Rectangle> box, _) {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 30,
                            childAspectRatio: 1,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      var reversedBox = List.from(box.values).reversed;
                      Rectangle? currentRec = reversedBox.elementAt(index);
                      return Center(
                        child: InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                        title: Text(dateFormat(
                                            currentRec?.createdDate)),
                                        content: Text('${currentRec?.note}'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ])),
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CustomPaint(
                                painter: CustomRectDrawer(
                                    30, colorToInt(currentRec?.color)),
                              ),
                            )),
                      );
                    });
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
        },
        tooltip: 'Settings',
        splashColor: Colors.deepPurple,
        child: const Icon(Icons.settings),
      ),
    );
  }
}
