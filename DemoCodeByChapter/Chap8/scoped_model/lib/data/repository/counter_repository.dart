import '../models/counter_model.dart';

class CounterRepository {

  CounterModel getInitialCounter() {
    return CounterModel(value: 0);
  }

  CounterModel increase(CounterModel model) {
    model.value = model.value + 1;
    return model;
  }

  CounterModel decrease(CounterModel model) {
    model.value = model.value - 1;
    return model;
  }
}
