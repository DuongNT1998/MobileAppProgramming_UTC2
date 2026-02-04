import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';
import '../common/widgets/increment_button.dart';
import '../common/widgets/decrement_button.dart';
import '../common/styles/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final CounterController _counterController = CounterController();

  void _handleIncrease() {
    setState(() {
      _counterController.increase();
    });
  }

  void _handleDecrease() {
    setState(() {
      _counterController.decrease();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lifting State Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              _counterController.counterValue.toString(),
              style: AppTextStyles.counterTextStyle(),
            ),

            SizedBox(height: 20),

            IncrementButton(
              onPressed: _handleIncrease,
            ),

            SizedBox(height: 10),

            DecrementButton(
              onPressed: _handleDecrease,
            ),
          ],
        ),
      ),
    );
  }
}
