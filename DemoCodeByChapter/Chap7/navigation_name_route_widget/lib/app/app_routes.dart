import 'package:flutter/material.dart';
import '../utils/route_names.dart';
import '../views/home_view.dart';
import '../views/detail_view.dart';
import '../views/profile_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      RouteNames.home: (BuildContext context) {
        return HomeView();
      },
      RouteNames.detail: (BuildContext context) {
        return DetailView();
      },
      RouteNames.profile: (BuildContext context) {
        return ProfileView();
      },
    };
  }
}
