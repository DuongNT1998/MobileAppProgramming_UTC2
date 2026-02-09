import 'package:flutter/material.dart';
import '../../common/widgets/product_card.dart';

import '../home/home_screen.dart';
import '../product/product_by_subcategory_screen.dart';

class SubCategoryScreen extends StatelessWidget {
  final String categoryName;

  const SubCategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// b) CATEGORY IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://picsum.photos/200',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            /// c) SUB CATEGORY 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Best Seller',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProductBySubCategoryScreen(
                          subCategoryName: 'Best Seller',
                        ),
                      ),
                    );
                  },
                  child: const Text('View all'),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// d) PRODUCT GRID - SUB CATEGORY 1
            GridView.builder(
              itemCount: mockProducts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: mockProducts[index]);
              },
            ),

            const SizedBox(height: 24),

            /// e) SUB CATEGORY 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Best Seller',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProductBySubCategoryScreen(
                          subCategoryName: 'New Arrival',
                        ),
                      ),
                    );
                  },
                  child: const Text('View all'),
                ),
              ],
            ),
            const SizedBox(height: 12),

            /// f) PRODUCT GRID - SUB CATEGORY 2
            GridView.builder(
              itemCount: mockProducts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
