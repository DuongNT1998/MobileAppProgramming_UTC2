import 'package:flutter/material.dart';

class ReviewRatingScreen extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const ReviewRatingScreen({
    super.key,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ratings & Reviews')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRatingOverview(),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            _buildReviewList(),
          ],
        ),
      ),
    );
  }

  // ================= OVERALL RATING =================
  Widget _buildRatingOverview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LEFT: BIG RATING
        Column(
          children: [
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  size: 20,
                  color: index < rating.round()
                      ? Colors.amber
                      : Colors.grey.shade300,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text('$reviewCount reviews'),
          ],
        ),

        const SizedBox(width: 24),

        /// RIGHT: STAR DISTRIBUTION
        Expanded(
          child: Column(
            children: const [
              _StarProgressRow(star: 5, value: 0.7),
              _StarProgressRow(star: 4, value: 0.2),
              _StarProgressRow(star: 3, value: 0.07),
              _StarProgressRow(star: 2, value: 0.02),
              _StarProgressRow(star: 1, value: 0.01),
            ],
          ),
        ),
      ],
    );
  }

  // ================= REVIEW LIST =================
  Widget _buildReviewList() {
    return Column(children: List.generate(5, (index) => const _ReviewItem()));
  }
}

class _StarProgressRow extends StatelessWidget {
  final int star;
  final double value;

  const _StarProgressRow({required this.star, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$star'),
        const Icon(Icons.star, size: 14, color: Colors.amber),
        const SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey.shade300,
            color: Colors.amber,
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// USER INFO
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/100',
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'John Doe',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text(
                '2 days ago',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// STAR
          Row(
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, size: 16, color: Colors.amber),
            ),
          ),

          const SizedBox(height: 6),

          /// REVIEW TEXT
          const Text(
            'Great product! The quality is amazing and delivery was fast. Highly recommended.',
            style: TextStyle(height: 1.4),
          ),
        ],
      ),
    );
  }
}
