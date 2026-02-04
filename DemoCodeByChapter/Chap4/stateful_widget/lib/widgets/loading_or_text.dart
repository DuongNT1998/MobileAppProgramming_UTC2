import 'package:flutter/material.dart';
import '../utils/constants.dart';

class LoadingOrText extends StatelessWidget {
  final bool isLoaded;

  const LoadingOrText({
    super.key,
    required this.isLoaded,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return const CircularProgressIndicator();
    }

    return const Text(
      AppText.loadedMessage,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
