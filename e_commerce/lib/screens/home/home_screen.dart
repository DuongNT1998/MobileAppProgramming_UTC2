import 'package:flutter/material.dart';
import '../../common/widgets/home_banner_slider.dart';
import '../../common/widgets/category_item.dart';
import '../../common/widgets/product_card.dart';
import '../../data/models/product_model.dart';
import '../category/sub_category_screen.dart';
import '../cart/cart_overview_screen.dart';
import '../product/popular_product_screen.dart';

final List<ProductModel> mockProducts = List.generate(
  6,
  (index) => ProductModel(
    id: 'p$index',
    name: 'Book Name $index',
    publisher: 'NXB ABC',
    price: 20 + index.toDouble(),
    rating: 4.8,
    reviewCount: 1234,
    images: const [
      'https://via.placeholder.com/400',
      'https://via.placeholder.com/401',
      'https://via.placeholder.com/402',
      'https://via.placeholder.com/403',
    ],
  ),
);

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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CartOverviewScreen(),
                                ),
                              );
                            },
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
                      children: [
                        CategoryItem(
                          icon: Icons.book,
                          title: 'Novel',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SubCategoryScreen(
                                  categoryName: 'Novel',
                                ),
                              ),
                            );
                          },
                        ),
                        CategoryItem(
                          icon: Icons.menu_book,
                          title: 'Education',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SubCategoryScreen(
                                  categoryName: 'Education',
                                ),
                              ),
                            );
                          },
                        ),
                        CategoryItem(
                          icon: Icons.auto_stories,
                          title: 'Comics',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SubCategoryScreen(
                                  categoryName: 'Comics',
                                ),
                              ),
                            );
                          },
                        ),
                        CategoryItem(
                          icon: Icons.auto_stories,
                          title: 'Business',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SubCategoryScreen(
                                  categoryName: 'Business',
                                ),
                              ),
                            );
                          },
                        ),
                        CategoryItem(
                          icon: Icons.auto_stories,
                          title: 'Health',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SubCategoryScreen(
                                  categoryName: 'Health',
                                ),
                              ),
                            );
                          },
                        ),
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
                    children: [
                      const Text(
                        'Popular Product',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PopularProductScreen(),
                            ),
                          );
                        },
                        child: const Text('View all'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  GridView.builder(
                    itemCount: mockProducts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.65,
                        ),
                    itemBuilder: (context, index) {
                      return ProductCard(product: mockProducts[index]);
                    },
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
