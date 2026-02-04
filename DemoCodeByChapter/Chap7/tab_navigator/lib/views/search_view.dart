import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is Search Tab',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
