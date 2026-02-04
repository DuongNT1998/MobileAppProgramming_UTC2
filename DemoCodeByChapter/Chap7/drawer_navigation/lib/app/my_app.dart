import 'package:flutter/material.dart';
import '../utils/app_routes.dart';
import '../views/home_view.dart';
import '../views/settings_view.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Drawer Navigation Demo',

      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.home,

      routes: <String, WidgetBuilder>{
        AppRoutes.home: (BuildContext context) {
          return HomeView();
        },
        AppRoutes.settings: (BuildContext context) {
          return SettingsView();
        },
      },
    );
  }
}
