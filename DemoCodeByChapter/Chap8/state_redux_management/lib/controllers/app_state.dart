import '../data/models/counter_state.dart';

class AppState {
  final CounterState counterState;

  AppState({
    required this.counterState,
  });

  factory AppState.initial() {
    return AppState(
      counterState: CounterState.initial(),
    );
  }

  AppState copyWith({
    CounterState? counterState,
  }) {
    return AppState(
      counterState: counterState ?? this.counterState,
    );
  }
}
