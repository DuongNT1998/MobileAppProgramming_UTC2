import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'app/app.dart';
import 'app/store.dart';
import 'controllers/app_state.dart';

void main() {
  Store<AppState> store = createStore();

  runApp(
    StoreProvider<AppState>(
      store: store,
      child: const MyApp(),
    ),
  );
}
