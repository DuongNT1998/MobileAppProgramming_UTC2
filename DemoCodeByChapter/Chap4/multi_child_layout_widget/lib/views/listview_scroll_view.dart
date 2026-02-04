/*CASE 2 – Dùng widget scrollable sẵn (ListView) (KHUYÊN DÙNG)
Dùng khi: Danh sách dài, Layout tuyến tính, Cần performance*/
import 'package:flutter/material.dart';
import '../widgets/section_title.dart';

class ListViewScrollView extends StatelessWidget {
  const ListViewScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView (Scrollable Widget)')),
      body: Column(
        children: [
          const SectionTitle('ListView tự scroll'),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (_, i) => ListTile(
                leading: const Icon(Icons.list),
                title: Text('Item $i'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
