import 'package:flutter/material.dart';
import '../data/models/counter_model.dart';
import '../data/repository/counter_repository.dart';
import '../utils/app_constants.dart';

class CounterController extends StatefulWidget {
  final Widget child;

  CounterController({required this.child});

  static _CounterControllerState of(BuildContext context) {
    final _CounterInheritedWidget? inheritedWidget =
    context.dependOnInheritedWidgetOfExactType<_CounterInheritedWidget>();

    return inheritedWidget!.data;
  }

  @override
  _CounterControllerState createState() {
    return _CounterControllerState();
  }
}

class _CounterControllerState extends State<CounterController> {
  final CounterRepository _repository = CounterRepository();
  CounterModel counter = CounterModel(value: 0);

  void increment() {
    setState(() {
      counter.value = _repository.increment(counter.value);
    });
  }

  void decrement() {
    setState(() {
      counter.value = _repository.decrement(counter.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CounterInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class _CounterInheritedWidget extends InheritedWidget {
  final _CounterControllerState data;

  _CounterInheritedWidget({
    required Widget child,
    required this.data,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_CounterInheritedWidget oldWidget) {
    return true;
  }
}
