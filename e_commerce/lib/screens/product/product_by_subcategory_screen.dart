import 'package:flutter/material.dart';

class ProductBySubCategoryScreen extends StatefulWidget {
  final String subCategoryName;

  const ProductBySubCategoryScreen({super.key, required this.subCategoryName});

  @override
  State<ProductBySubCategoryScreen> createState() =>
      _ProductBySubCategoryScreenState();
}

class _ProductBySubCategoryScreenState
    extends State<ProductBySubCategoryScreen> {
  String _selectedFilter = 'Name';

  final List<String> _filters = [
    'Name',
    'Price: Low to High',
    'Price: High to Low',
    'Size',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.subCategoryName)),
      body: Column(
        children: [
          /// ================= FILTER DROPDOWN =================
          Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownButtonFormField<String>(
              value: _selectedFilter,
              decoration: const InputDecoration(
                labelText: 'Sort by',
                border: OutlineInputBorder(),
              ),
              items: _filters.map((filter) {
                return DropdownMenuItem<String>(
                  value: filter,
                  child: Text(filter),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedFilter = value!;
                });
              },
            ),
          ),

          /// ================= PRODUCT GRID =================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return const _ProductItem();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE + DISCOUNT + FAVORITE
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  'https://picsum.photos/200',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    '-25%',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Product Name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 4),

                Row(
                  children: const [
                    Text(
                      'Publisher',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.verified, size: 14, color: Colors.blue),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$19.99',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
