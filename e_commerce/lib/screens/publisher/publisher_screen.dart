import 'package:flutter/material.dart';
import 'all_publisher_screen.dart';
import '../../common/widgets/product_card.dart';
import '../../data/models/product_model.dart';

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

class PublisherScreen extends StatefulWidget {
  const PublisherScreen({super.key});

  @override
  State<PublisherScreen> createState() => _PublisherScreenState();
}

class _PublisherScreenState extends State<PublisherScreen>
    with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;

  final List<String> categories = [
    'All',
    'Fiction',
    'Business',
    'Education',
    'Science',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchBox(),
              _buildFeaturePublisher(),
              _buildPublisherGrid(),
              _buildCategoryTabs(),
              _buildPublisherByCategory(),
              _buildYouMightLike(),
              _buildProductGrid(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Row(
        children: [
          const Text(
            'Publisher',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
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
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= SEARCH =================
  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search in publisher',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // ================= FEATURE LABEL =================
  Widget _buildFeaturePublisher() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Row(
        children: [
          const Text(
            'Feature Publisher',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AllBrandScreen()),
              );
            },
            child: const Text('View all'),
          ),
        ],
      ),
    );
  }

  // ================= FEATURE PUBLISHER GRID =================
  Widget _buildPublisherGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Expanded(
                  child: Icon(Icons.business, size: 60, color: Colors.blue),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'NXB Trẻ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.verified, size: 16, color: Colors.blue),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  '120 Products',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ================= CATEGORY TAB =================
  Widget _buildCategoryTabs() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 0, 12),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final bool isSelected = index == _selectedCategoryIndex;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ================= PUBLISHER BY CATEGORY =================
  Widget _buildPublisherByCategory() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.store, size: 60, color: Colors.blue),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'NXB Kim Đồng',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Best books in Fiction',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ================= YOU MIGHT LIKE =================
  Widget _buildYouMightLike() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Row(
        children: [
          const Text(
            'You might like',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          TextButton(onPressed: () {}, child: const Text('View all')),
        ],
      ),
    );
  }

  // ================= PRODUCT GRID =================
  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
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
    );
  }
}
