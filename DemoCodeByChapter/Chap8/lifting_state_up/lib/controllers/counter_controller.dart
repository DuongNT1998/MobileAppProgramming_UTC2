import '../data/models/counter_model.dart';
import '../data/repository/counter_repository.dart';

class CounterController {
  final CounterRepository _repository = CounterRepository();
  final CounterModel _counterModel = CounterModel(value: 0);

  int get counterValue {
    return _counterModel.value;
  }

  void increase() {
    _counterModel.value =
        _repository.increaseCounter(_counterModel.value);
  }

  void decrease() {
    _counterModel.value =
        _repository.decreaseCounter(_counterModel.value);
  }
}
