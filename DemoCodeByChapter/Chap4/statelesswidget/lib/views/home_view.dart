import 'package:flutter/material.dart';
import '../widgets/loading_or_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // Demo biến trạng thái (hard-code)
  final bool isLoaded = false;
  // thử đổi thành false để thấy ProgressIndicator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget Demo'),
      ),
      body: Center(
        child: LoadingOrText(isLoaded: isLoaded),
      ),
    );
  }
}
