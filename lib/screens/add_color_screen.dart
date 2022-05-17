import 'package:flutter/material.dart';

class AddColorScreen extends StatefulWidget {
  const AddColorScreen({Key? key}) : super(key: key);

  @override
  State<AddColorScreen> createState() => _AddColorScreenState();
}

class _AddColorScreenState extends State<AddColorScreen> {
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Color Screen'),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Container(margin: const EdgeInsets.all(20), child: Center(
        child: TextField(
          textAlign: TextAlign.start,
          maxLength: 40,
          controller: noteController,
          decoration: const InputDecoration(
              hintText: 'Enter your note',
          ),
        ),
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(noteController.text);
        },
        tooltip: 'Add new color',
        splashColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
