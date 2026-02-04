import '../data/models/counter_model.dart';

class CounterController {
  final CounterModel _counterModel = CounterModel(value: 0);

  int getCounterValue() {
    return _counterModel.value;
  }

  void increase() {
    _counterModel.value = _counterModel.value + 1;
  }

  void decrease() {
    _counterModel.value = _counterModel.value - 1;
  }
}
