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
      'http://picsum.photos/200',
      'http://picsum.photos/201',
      'http://picsum.photos/202',
      'http://picsum.photos/203',
    ],
  ),
);

class PublisherDetailScreen extends StatefulWidget {
  final String publisherName;

  const PublisherDetailScreen({super.key, required this.publisherName});

  @override
  State<PublisherDetailScreen> createState() => _PublisherDetailScreenState();
}

class _PublisherProductItem extends StatelessWidget {
  final String publisherName;

  const _PublisherProductItem({required this.publisherName});

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
                    '-30%',
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
                  children: [
                    Text(
                      publisherName,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.verified, size: 14, color: Colors.blue),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$24.99',
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

class _PublisherDetailScreenState extends State<PublisherDetailScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'All',
    'Novel',
    'Education',
    'Comics',
    'Kids',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Publisher')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ================= PUBLISHER INFO =================
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    'https://picsum.photos/200',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.publisherName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.verified,
                            size: 18,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        '120 Products',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          /// ================= PRODUCT LABEL =================
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Product',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 12),

          /// ================= CATEGORY FILTER =================
          SizedBox(
            height: 42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final bool isSelected = _selectedCategoryIndex == index;

                return Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: ChoiceChip(
                    label: Text(_categories[index]),
                    selected: isSelected,
                    onSelected: (value) {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          /// ================= PRODUCT GRID =================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
          ),
        ],
      ),
    );
  }
}
