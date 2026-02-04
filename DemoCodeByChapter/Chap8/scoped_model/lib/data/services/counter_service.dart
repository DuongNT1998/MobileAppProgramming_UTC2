import '../models/counter_model.dart';
import '../repository/counter_repository.dart';

class CounterService {

  final CounterRepository repository = CounterRepository();

  CounterModel createCounter() {
    return repository.getInitialCounter();
  }

  CounterModel increaseCounter(CounterModel model) {
    return repository.increase(model);
  }

  CounterModel decreaseCounter(CounterModel model) {
    return repository.decrease(model);
  }
}
