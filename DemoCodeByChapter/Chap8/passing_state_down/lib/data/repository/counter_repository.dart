import '../services/counter_service.dart';

class CounterRepository {
  final CounterService _counterService = CounterService();

  int increaseCounter(int currentValue) {
    return _counterService.increase(currentValue);
  }

  int decreaseCounter(int currentValue) {
    return _counterService.decrease(currentValue);
  }
}
