import 'package:redux/redux.dart';
import '../controllers/app_state.dart';
import '../controllers/counter_reducer.dart';

Store<AppState> createStore() {
  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
  );
}
