import 'package:scoped_model/scoped_model.dart';

import '../data/models/counter_model.dart';
import '../data/services/counter_service.dart';

class CounterController extends Model {

  final CounterService _counterService = CounterService();

  late CounterModel _counter;

  CounterController() {
    _counter = _counterService.createCounter();
  }

  int get counterValue {
    return _counter.value;
  }

  void increase() {
    _counter = _counterService.increaseCounter(_counter);
    notifyListeners();
  }

  void decrease() {
    _counter = _counterService.decreaseCounter(_counter);
    notifyListeners();
  }
}
