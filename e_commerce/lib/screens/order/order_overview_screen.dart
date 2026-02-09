import 'package:flutter/material.dart';

enum PaymentMethod { paypal, cod }

class OrderOverviewScreen extends StatefulWidget {
  const OrderOverviewScreen({super.key});

  @override
  State<OrderOverviewScreen> createState() => _OrderOverviewScreenState();
}

class _OrderOverviewScreenState extends State<OrderOverviewScreen> {
  PaymentMethod _paymentMethod = PaymentMethod.paypal;

  final double subtotal = 89.97;
  final double shippingFee = 5.00;
  final double taxFee = 3.50;

  double get orderTotal => subtotal + shippingFee + taxFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Overview')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ================= PRODUCTS =================
            const Text('Items', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            ...List.generate(3, (_) => const _OrderProductItem()),

            const SizedBox(height: 24),

            /// ================= PROMO CODE =================
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Have a promo code? Enter here',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(onPressed: () {}, child: const Text('Apply')),
              ],
            ),

            const SizedBox(height: 24),

            /// ================= PRICE SUMMARY =================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _boxDecoration(),
              child: Column(
                children: [
                  _priceRow('Subtotal', subtotal),
                  _priceRow('Shipping fee', shippingFee),
                  _priceRow('Tax fee', taxFee),
                  const Divider(),
                  _priceRow('Order total', orderTotal, isBold: true),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// ================= PAYMENT METHOD =================
            const Text(
              'Payment method',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            RadioListTile(
              value: PaymentMethod.paypal,
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                });
              },
              title: Row(
                children: const [
                  Icon(Icons.account_balance_wallet),
                  SizedBox(width: 8),
                  Text('PayPal'),
                ],
              ),
            ),

            RadioListTile(
              value: PaymentMethod.cod,
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                });
              },
              title: Row(
                children: const [
                  Icon(Icons.local_shipping),
                  SizedBox(width: 8),
                  Text('Cash on Delivery'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// ================= SHIPPING ADDRESS =================
            Row(
              children: [
                const Text(
                  'Shipping address',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text('Change')),
              ],
            ),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: _boxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 18),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '123 Nguyen Van Linh, District 7, HCM City',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 18),
                      SizedBox(width: 8),
                      Text('+84 912 345 678'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            /// ================= CHECKOUT =================
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Place order
                },
                child: Text('Checkout • \$${orderTotal.toStringAsFixed(2)}'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String title, double price, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    );
  }
}

class _OrderProductItem extends StatelessWidget {
  const _OrderProductItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://picsum.photos/200',
              height: 64,
              width: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'Brand',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.verified, size: 14, color: Colors.blue),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Product Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
