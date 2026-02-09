import 'package:flutter/material.dart';
import 'ordered_detail_screen.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5, // mock 5 orders
        itemBuilder: (context, index) {
          return _OrderHistoryCard(
            orderCode: '#ORD00$index',
            status: index % 2 == 0 ? 'Delivered' : 'Processing',
            orderDate: '12 Jan 2026',
            deliveryDate: '15 Jan 2026',
            total: 129.99 + index * 10,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrderDetailScreen()),
              );
            },
          );
        },
      ),
    );
  }
}

class _OrderHistoryCard extends StatelessWidget {
  final String orderCode;
  final String status;
  final String orderDate;
  final String deliveryDate;
  final double total;
  final VoidCallback onTap;

  const _OrderHistoryCard({
    required this.orderCode,
    required this.status,
    required this.orderDate,
    required this.deliveryDate,
    required this.total,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDelivered = status == 'Delivered';

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// LEFT INFO
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// STATUS
                  Row(
                    children: [
                      Icon(
                        isDelivered ? Icons.check_circle : Icons.local_shipping,
                        size: 18,
                        color: isDelivered ? Colors.green : Colors.orange,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        status,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDelivered ? Colors.green : Colors.orange,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        orderDate,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// ORDER CODE
                  Row(
                    children: [
                      const Icon(Icons.receipt, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        orderCode,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// DELIVERY DATE + TOTAL
                  Row(
                    children: [
                      const Icon(Icons.event, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        'Delivery: $deliveryDate',
                        style: const TextStyle(fontSize: 13),
                      ),
                      const Spacer(),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// RIGHT ARROW
            const Icon(Icons.chevron_right, size: 28, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
