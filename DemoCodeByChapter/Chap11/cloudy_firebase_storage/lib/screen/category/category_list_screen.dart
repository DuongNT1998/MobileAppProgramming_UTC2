import 'package:flutter/material.dart';
import '../../controller/category_controller.dart';
import '../../data/model/category_model.dart';
import 'category_form_screen.dart';
import '../../utils/confirm_dialog.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});

  final CategoryController controller = CategoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Category Management')),

      // NÚT ADD
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: StreamBuilder<List<CategoryModel>>(
        stream: controller.getCategories(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<CategoryModel> categories = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: categories.map((category) {
                    return DataRow(
                      cells: [
                        DataCell(Text(category.id)),
                        DataCell(Text(category.name)),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoryFormScreen(
                                        category: category,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  bool confirm = await showDeleteConfirmDialog(
                                    context,
                                  );

                                  if (confirm) {
                                    await controller.deleteCategory(
                                      category.id,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
