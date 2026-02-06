import 'package:flutter/material.dart';
import '../../common/widgets/home_banner_slider.dart';
import '../../common/widgets/category_item.dart';
import '../../common/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //    String firstName = 'Guest';
    //  String lastName = 'User';
    return Scaffold(
      body: Column(
        children: [
          /// TOP BLUE HEADER
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Good day for shopping',
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Guest User',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            right: 6,
                            top: 6,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search in store',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Popular category',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CategoryItem(icon: Icons.book, title: 'Novel'),
                        CategoryItem(icon: Icons.menu_book, title: 'Education'),
                        CategoryItem(icon: Icons.auto_stories, title: 'Comics'),
                        CategoryItem(icon: Icons.child_care, title: 'Kids'),
                        CategoryItem(icon: Icons.house, title: 'House'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeBannerSlider(),

                  const SizedBox(height: 24),

                  Row(
                    children: const [
                      Text(
                        'Popular Product',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text('View all', style: TextStyle(color: Colors.blue)),
                    ],
                  ),

                  const SizedBox(height: 16),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                    children: const [
                      ProductCard(),
                      ProductCard(),
                      ProductCard(),
                      ProductCard(),
                      ProductCard(),
                      ProductCard(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
