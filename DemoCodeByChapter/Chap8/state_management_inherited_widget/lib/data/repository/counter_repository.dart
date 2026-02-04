import '../services/counter_service.dart';

class CounterRepository {
  final CounterService _service = CounterService();

  int increment(int value) {
    return _service.increase(value);
  }

  int decrement(int value) {
    return _service.decrease(value);
  }
}
