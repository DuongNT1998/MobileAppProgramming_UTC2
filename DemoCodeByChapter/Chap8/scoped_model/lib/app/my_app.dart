import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../controllers/counter_controller.dart';
import '../screens/home_screen.dart';

class MyApp extends StatelessWidget {

  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterController>(
      model: counterController,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ScopedModel Demo',
        home: HomeScreen(),
      ),
    );
  }
}
