import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import '../../common/state/wishlist_manager.dart';
import '../review/review_rating_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedImageIndex = 0;
  int selectedColor = 0;
  int selectedSize = 0;
  int quantity = 1;
  final List<String> images = [
    'https://cdn.hstatic.net/products/200000378371/dsc08049_8e07cad1a33241c889facaed567d6ef0_master.jpg',
    'https://cdn.hstatic.net/products/200000378371/dsc08046_ca262161ffb54ff987fa8049d77fb74a_master.jpg',
    'https://cdn.hstatic.net/products/200000378371/dsc08054_dde5a1731f774e258e36c5b72001ed24_master.jpg',
    'https://cdn.hstatic.net/products/200000378371/dsc08054_dde5a1731f774e258e36c5b72001ed24_master.jpg',
  ];

  final wishlist = WishlistManager();

  final product = {
    'id': 'p1',
    'name': 'Flutter Book',
    'publisher': 'Tech Books',
    'price': 29.99,
    'image': 'https://via.placeholder.com/200',
    'discount': 20,
  };
  @override
  Widget build(BuildContext context) {
    final String productId = product['id'] as String;
    final bool isFav = wishlist.isFavorite(productId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        actions: [
          IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                wishlist.toggle(product);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// a) SELECTED IMAGE
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                widget.product.images[selectedImageIndex],
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            /// b) SLIDER IMAGE
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.product.images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImageIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedImageIndex == index
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(widget.product.images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            /// c) RATING + INFO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// RATING
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReviewRatingScreen(
                            rating: widget.product.rating,
                            reviewCount: widget.product.reviewCount,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.product.rating}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        Text('(${widget.product.reviewCount} reviews)'),
                        const SizedBox(width: 4),
                        const Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// PRICE
                  Text(
                    '\$${widget.product.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// PRODUCT NAME
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// STOCK
                  const Text(
                    'Stock: In stock',
                    style: TextStyle(color: Colors.green),
                  ),

                  const SizedBox(height: 16),

                  /// PUBLISHER
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/50',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.product.publisher,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.verified, color: Colors.blue, size: 18),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// COLOR
            const Text('Color', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Row(
              children: List.generate(3, (index) {
                final colors = [Colors.red, Colors.blue, Colors.green];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors[index],
                      border: Border.all(
                        color: selectedColor == index
                            ? Colors.black
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),

            /// SIZE
            const Text('Size', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Row(
              children: ['S', 'M', 'L'].asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = entry.key;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedSize == entry.key
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                    child: Text(entry.value),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            /// CHECKOUT
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Checkout'),
              ),
            ),

            const SizedBox(height: 24),

            /// DESCRIPTION
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'This is a very awesome product. High quality materials, '
              'beautiful design and perfect for daily use.',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),
            const Divider(),

            /// REVIEW
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Reviews (1,234)'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),

            const SizedBox(height: 16),

            /// QUANTITY + ADD TO CART
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() => quantity--);
                    }
                  },
                ),
                Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    setState(() => quantity++);
                  },
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Add to cart'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
