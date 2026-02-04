import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import '../common/widgets/custom_button.dart';
import '../utils/app_constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = HomeController();
  final TextEditingController textController = TextEditingController();

  int counter = 0;

  void increaseCounter() {
    setState(() {
      counter = counter + 1;
    });
  }

  void addNote() {
    if (textController.text.isNotEmpty) {
      setState(() {
        controller.addNewNote(textController.text);
        textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// COUNTER
            Text(
              'Counter: $counter',
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            SizedBox(height: 10),

            CustomButton(
              title: 'Increase Counter',
              onPressed: increaseCounter,
            ),

            Divider(height: 30),

            /// ADD NOTE
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter note',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            CustomButton(
              title: 'Add Note',
              onPressed: addNote,
            ),

            SizedBox(height: 20),

            /// NOTE LIST
            Text(
              'Notes:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: controller.getAllNotes().length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      controller.getAllNotes()[index].content,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
