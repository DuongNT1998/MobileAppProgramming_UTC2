import 'package:flutter/material.dart';
import '../../controllers/category_controller.dart';
import 'package:sqlite_storage_demmo/data/models/category_model.dart';

class CategoryFormScreen extends StatefulWidget {
  final Category? category;

  CategoryFormScreen({this.category});

  @override
  State<CategoryFormScreen> createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends State<CategoryFormScreen> {
  final CategoryController _controller = CategoryController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.category != null) {
      nameController.text = widget.category!.name;
    }
  }

  Future<void> saveCategory() async {
    String name = nameController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Category name is required')),
      );
      return;
    }

    if (widget.category == null) {
      await _controller.addCategory(name);
    } else {
      Category updatedCategory = Category(
        id: widget.category!.id,
        name: name,
      );
      await _controller.updateCategory(updatedCategory);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category == null ? 'Add Category' : 'Edit Category',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Category Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveCategory,
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
