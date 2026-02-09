import 'package:flutter/material.dart';
import '../../screens/publisher/publisher_detail_screen.dart';

class PublisherCard extends StatelessWidget {
  const PublisherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                const PublisherDetailScreen(publisherName: 'Publisher Name'),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                'https://via.placeholder.com/100',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Publisher Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 4),
                Icon(Icons.verified, size: 16, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              '120 Products',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
