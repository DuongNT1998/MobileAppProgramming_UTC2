/*CASE 1 – Wrap layout trong SingleChildScrollView (ĐÚNG)
 Dùng khi:

Số lượng item không quá lớn

Layout không tuyến tính (tag, chip, button grid)*/
import 'package:flutter/material.dart';
import '../widgets/demo_box.dart';
import '../widgets/section_title.dart';

class WrapScrollView extends StatelessWidget {
  const WrapScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap + SingleChildScrollView')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle('Wrap inside SingleChildScrollView'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                30,
                    (i) => DemoBox(
                  color: Colors.teal,
                  text: 'Item $i',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
