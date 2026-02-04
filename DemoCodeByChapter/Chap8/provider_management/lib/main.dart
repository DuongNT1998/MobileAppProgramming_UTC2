import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/my_app.dart';
import 'controllers/counter_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterController>(
          create: (BuildContext context) {
            return CounterController();
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}
