import '../models/counter_model.dart';
import '../services/counter_service.dart';

class CounterRepository {
  final CounterService _service = CounterService();

  CounterModel increase(CounterModel model) {
    int newValue = _service.increase(model.value);
    return CounterModel(value: newValue);
  }

  CounterModel decrease(CounterModel model) {
    int newValue = _service.decrease(model.value);
    return CounterModel(value: newValue);
  }
}

