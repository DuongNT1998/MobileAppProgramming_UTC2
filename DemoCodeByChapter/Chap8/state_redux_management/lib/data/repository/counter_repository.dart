import '../services/counter_service.dart';

class CounterRepository {
  final CounterService service;

  CounterRepository(this.service);

  int loadCounter() {
    return service.getInitialValue();
  }
}
