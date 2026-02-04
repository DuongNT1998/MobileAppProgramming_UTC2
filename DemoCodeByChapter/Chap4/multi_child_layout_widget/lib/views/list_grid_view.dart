import 'package:flutter/material.dart';
import '../app/routes.dart';
import '../widgets/demo_box.dart';
import '../widgets/section_title.dart';
class ListGridView extends StatelessWidget {
  const ListGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView & GridView')),
      body: Column(
        children: [
          const SectionTitle('ListView'),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
            ),
          ),
          const SectionTitle('GridView'),
          SizedBox(
            height: 200,
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,

              children: List.generate(
                6,
                    (i) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black87,
                      width: 2, // tăng để cắt rõ
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: DemoBox(
                    color: Colors.indigo,
                    text: '$i',
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
