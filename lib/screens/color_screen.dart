import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kutimo/models/rectangle.dart';
import 'package:kutimo/utils/custom_rect_drawer.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  int colorToInt(recColor) {
    var color;

    if (RecColor.BLACK == recColor) color = 0xFF000000;
    if (RecColor.PURPLE == recColor) color = 0xFF9C27B0;
    if (RecColor.RED == recColor) color = 0xFFF44336;
    if (RecColor.BLUE == recColor) color = 0xFF2196F3;
    if (RecColor.YELLOW == recColor) color = 0xFFFFEB3B;
    if (RecColor.WHITE == recColor) color = 0xFFFFFFFF;

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
                      Rectangle? currentRec = box.getAt(index);
                      return Center(
                        child: InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                        title:
                                            Text(dateFormat(currentRec?.createdDate)),
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
    );
  }
}
