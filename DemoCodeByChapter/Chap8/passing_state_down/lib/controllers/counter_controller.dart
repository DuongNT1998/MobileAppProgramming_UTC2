import '../data/models/counter_model.dart';
import '../data/repository/counter_repository.dart';

class CounterController {
  final CounterRepository _counterRepository = CounterRepository();

  CounterModel counterModel = CounterModel(value: 0);

  void increase() {
    counterModel.value =
        _counterRepository.increaseCounter(counterModel.value);
  }

  void decrease() {
    counterModel.value =
        _counterRepository.decreaseCounter(counterModel.value);
  }
}
