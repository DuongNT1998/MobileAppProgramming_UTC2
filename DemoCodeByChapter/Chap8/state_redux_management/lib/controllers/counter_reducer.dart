import 'package:redux/redux.dart';

import 'app_state.dart';
import 'counter_actions.dart';
import '../data/models/counter_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    counterState: counterReducer(state.counterState, action),
  );
}

final counterReducer = combineReducers<CounterState>([
  TypedReducer<CounterState, IncrementAction>(_increment),
  TypedReducer<CounterState, DecrementAction>(_decrement),
]);

CounterState _increment(CounterState state, IncrementAction action) {
  return state.copyWith(
    value: state.value + 1,
  );
}

CounterState _decrement(CounterState state, DecrementAction action) {
  return state.copyWith(
    value: state.value - 1,
  );
}
