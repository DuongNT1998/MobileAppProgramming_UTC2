import 'package:flutter/material.dart';
import '../data/models/counter_model.dart';
import '../data/repository/counter_repository.dart';

class CounterController extends ChangeNotifier {
  final CounterRepository _repository = CounterRepository();

  CounterModel _counter = CounterModel(value: 0);

  int get counterValue {
    return _counter.value;
  }

  void increaseCounter() {
    _counter = _repository.increase(_counter);
    notifyListeners();
  }

  void decreaseCounter() {
    _counter = _repository.decrease(_counter);
    notifyListeners();
  }
}
