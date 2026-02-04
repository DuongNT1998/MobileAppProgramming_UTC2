import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';
import '../common/widgets/counter_display_widget.dart';
import '../common/widgets/increment_button_widget.dart';
import '../common/widgets/decrement_button_widget.dart';

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
    int currentCounterValue = _counterController.getCounterValue();

    return Scaffold(
      appBar: AppBar(
        title: Text('Combining Passing & Lifting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // PASSING STATE DOWN
            CounterDisplayWidget(
              counterValue: currentCounterValue,
            ),

            SizedBox(height: 20),

            // LIFTING EVENT UP
            IncrementButtonWidget(
              onIncrease: _handleIncrease,
            ),

            SizedBox(height: 10),

            DecrementButtonWidget(
              onDecrease: _handleDecrease,
            ),
          ],
        ),
      ),
    );
  }
}
