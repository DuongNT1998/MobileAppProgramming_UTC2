import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import 'detail_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  void _goToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return DetailView(
            message: 'Dữ liệu được truyền từ HomeView',
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
      ),
      body: Center(
        child: PrimaryButton(
          title: 'Đi tới Detail View',
          onPressed: () {
            _goToDetail(context);
          },
        ),
      ),
    );
  }
}
