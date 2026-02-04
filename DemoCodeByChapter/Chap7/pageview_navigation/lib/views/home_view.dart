import 'package:flutter/material.dart';
import '../widgets/navigation_button.dart';
import 'page_one_view.dart';
import 'page_two_view.dart';
import 'page_three_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {

  // 1️⃣ Khởi tạo PageController
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // 2️⃣ Hàm điều hướng bằng animateToPage
  void navigateToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Navigation'),
      ),
      body: Column(
        children: [

          // 3️⃣ Các nút điều hướng
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavigationButton(
                title: 'Page 1',
                onPressed: () {
                  navigateToPage(0);
                },
              ),
              NavigationButton(
                title: 'Page 2',
                onPressed: () {
                  navigateToPage(1);
                },
              ),
              NavigationButton(
                title: 'Page 3',
                onPressed: () {
                  navigateToPage(2);
                },
              ),
            ],
          ),

          // 4️⃣ PageView gắn với PageController
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                PageOneView(),
                PageTwoView(),
                PageThreeView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
