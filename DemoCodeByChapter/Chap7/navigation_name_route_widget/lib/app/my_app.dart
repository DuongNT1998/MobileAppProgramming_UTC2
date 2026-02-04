import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../utils/route_names.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',

      initialRoute: RouteNames.home,

      routes: AppRoutes.getRoutes(),

      debugShowCheckedModeBanner: false,
    );
  }
}
