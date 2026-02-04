import 'package:flutter/material.dart';
import '../widgets/image_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Widget & BoxFit'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            ImageBox(title: 'BoxFit.cover', fit: BoxFit.cover),
            ImageBox(title: 'BoxFit.contain', fit: BoxFit.contain),
            ImageBox(title: 'BoxFit.fill', fit: BoxFit.fill),
            ImageBox(title: 'BoxFit.fitWidth', fit: BoxFit.fitWidth),
            ImageBox(title: 'BoxFit.fitHeight', fit: BoxFit.fitHeight),
            ImageBox(title: 'BoxFit.none', fit: BoxFit.none),
          ],
        ),
      ),
    );
  }
}
