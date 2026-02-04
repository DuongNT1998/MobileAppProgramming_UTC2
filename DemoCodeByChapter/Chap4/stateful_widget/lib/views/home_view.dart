import 'package:flutter/material.dart';
import '../widgets/loading_or_text.dart';

class HomeView extends StatefulWidget {
  final bool loading;

  const HomeView(this.loading);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late bool isLoaded;

  @override
  void initState() {

    isLoaded = widget.loading;
  }

  void toggleLoading() {
    setState(() {
      isLoaded = !isLoaded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget + initState'),
      ),
      body: Center(
        child: LoadingOrText(isLoaded: isLoaded),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleLoading,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
