import 'package:flutter/material.dart';
import '../order/order_overview_screen.dart';

class CartOverviewScreen extends StatefulWidget {
  const CartOverviewScreen({super.key});

  @override
  State<CartOverviewScreen> createState() => _CartOverviewScreenState();
}

class _CartOverviewScreenState extends State<CartOverviewScreen> {
  final List<int> _quantities = List.generate(5, (_) => 1);
  final double _pricePerItem = 29.99;

  double get _totalPrice {
    double total = 0;
    for (final qty in _quantities) {
      total += qty * _pricePerItem;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          /// ================= CART LIST =================
          Expanded(
            child: ListView.builder(
              itemCount: _quantities.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return _CartItem(
                  quantity: _quantities[index],
                  price: _pricePerItem,
                  onIncrease: () {
                    setState(() {
                      _quantities[index]++;
                    });
                  },
                  onDecrease: () {
                    if (_quantities[index] > 1) {
                      setState(() {
                        _quantities[index]--;
                      });
                    }
                  },
                );
              },
            ),
          ),

          /// ================= CHECKOUT =================
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(0.1)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Total: \$${_totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OrderOverviewScreen(),
                        ),
                      );
                    },

                    icon: const Icon(Icons.payment),
                    label: const Text('Checkout'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  final int quantity;
  final double price;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const _CartItem({
    required this.quantity,
    required this.price,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final double total = quantity * price;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// a) IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://picsum.photos/200',
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          /// b,c,d,e
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// b) PUBLISHER
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

                const SizedBox(height: 4),

                /// c) PRODUCT NAME
                const Text(
                  'Product Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 6),

                /// d) COLOR + SIZE
                const Text(
                  'Color: Red   Size: M',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),

                const SizedBox(height: 12),

                /// e) QUANTITY + TOTAL
                Row(
                  children: [
                    _QtyButton(icon: Icons.remove, onTap: onDecrease),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        quantity.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    _QtyButton(icon: Icons.add, onTap: onIncrease),
                    const Spacer(),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
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

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
