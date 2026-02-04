import 'package:flutter/material.dart';
import '../views/home_view.dart';
import '../views/search_view.dart';
import '../views/profile_view.dart';
import '../utils/app_colors.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({Key? key}) : super(key: key);

  @override
  State<TabNavigation> createState() {
    return _TabNavigationState();
  }
}

class _TabNavigationState extends State<TabNavigation>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text('Tab Navigation'),

          bottom: TabBar(
            controller: _tabController,

            tabs: const <Tab>[
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              ),
            ],
          ),
        ),

        body: TabBarView(
          controller: _tabController,

          children: const <Widget>[
            HomeView(),
            SearchView(),
            ProfileView(),
          ],
        ),
      ),
    );
  }
}
