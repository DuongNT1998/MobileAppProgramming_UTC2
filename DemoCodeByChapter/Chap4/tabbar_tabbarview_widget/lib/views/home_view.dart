import 'package:flutter/material.dart';
import 'package:tabbar_tabbarview_widget/views/tab_three_view.dart';
import '../widgets/custom_tab_bar.dart';
import 'tab_one_view.dart';
import 'tab_two_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Demo'),
          bottom: const CustomTabBar(),
        ),
        body: const TabBarView(
          children: [
            TabOneView(),
            TabTwoView(),
            TabThreeView(),
          ],
        ),
      ),
    );
  }
}
