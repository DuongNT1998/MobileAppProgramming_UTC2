import 'package:flutter/material.dart';
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

class PopularProductScreen extends StatefulWidget {
  const PopularProductScreen({super.key});

  @override
  State<PopularProductScreen> createState() => _PopularProductScreenState();
}

class _PopularProductScreenState extends State<PopularProductScreen> {
  String _selectedFilter = 'Name';

  final List<String> _filters = [
    'Name',
    'Price: Low to High',
    'Price: High to Low',
    'Size',
    'Newest',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Product')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ================= FILTER DROPDOWN =================
            _buildFilterDropdown(),

            const SizedBox(height: 16),

            /// ================= PRODUCT GRID =================
            /// 👉 phần này bạn tự làm
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }

  /// ================= FILTER DROPDOWN =================
  Widget _buildFilterDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedFilter,
        icon: const Icon(Icons.keyboard_arrow_down),
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.filter_list),
        ),
        items: _filters.map((filter) {
          return DropdownMenuItem<String>(value: filter, child: Text(filter));
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedFilter = value!;
          });
        },
      ),
    );
  }
}
