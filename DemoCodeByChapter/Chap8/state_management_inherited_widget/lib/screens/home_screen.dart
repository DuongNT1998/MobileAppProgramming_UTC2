import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';
import '../common/styles/app_text_styles.dart';
import '../common/widgets/counter_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterController = CounterController.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counterController.counter.value.toString(),
              style: AppTextStyles.counterText,
            ),
            SizedBox(height: 20),
            CounterButton(
              label: 'Increase',
              onPressed: () {
                counterController.increment();
              },
            ),
            SizedBox(height: 10),
            CounterButton(
              label: 'Decrease',
              onPressed: () {
                counterController.decrement();
              },
            ),
          ],
        ),
      ),
    );
  }
}
