import 'package:flutter/material.dart';
import '../../controllers/category_controller.dart';
import '../../data/models/category_model.dart';
import 'category_form_screen.dart';
import 'package:sqlite_storage_demmo/utils/confirm_dialog.dart';

class CategoryListScreen extends StatefulWidget {
  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryController _controller = CategoryController();
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    categories = await _controller.getCategories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Management'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: categories.isEmpty
          ? Center(child: Text('No Category Found'))
          : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Category Name')),
            DataColumn(label: Text('Actions')),
          ],
          rows: categories.map((category) {
            return DataRow(
              cells: [
                DataCell(Text(category.id.toString())),
                DataCell(Text(category.name)),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CategoryFormScreen(
                                category: category,
                              ),
                            ),
                          );
                          loadData();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          bool confirmed = await showConfirmDialog(
                            context: context,
                            title: 'Delete Category',
                            content: 'Are you sure you want to delete this category?',
                          );

                          if (confirmed) {
                            await _controller.deleteCategory(category.id!);
                            loadData();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CategoryFormScreen()),
          );
          loadData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
