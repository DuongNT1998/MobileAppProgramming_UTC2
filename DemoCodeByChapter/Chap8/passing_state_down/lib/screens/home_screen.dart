import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';
import '../common/widgets/counter_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
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
        title: Text('Passing State Down'),
      ),
      body: Center(
        child: CounterWidget(
          counterValue: _counterController.counterModel.value,
          onIncrease: _handleIncrease,
          onDecrease: _handleDecrease,
        ),
      ),
    );
  }
}
