import 'package:flutter/material.dart';
import '../../controller/category_controller.dart';
import '../../data/model/category_model.dart';

class CategoryFormScreen extends StatefulWidget {
  final CategoryModel? category;

  CategoryFormScreen({super.key, this.category});

  @override
  State<CategoryFormScreen> createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends State<CategoryFormScreen> {
  final CategoryController controller = CategoryController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.category != null) {
      nameController.text = widget.category!.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.category != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Category' : 'Create Category')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Category Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty) {
                  return;
                }

                if (isEdit) {
                  await controller.updateCategory(
                    widget.category!.id,
                    nameController.text,
                  );
                } else {
                  await controller.saveCategory(nameController.text);
                }

                Navigator.pop(context);
              },
              child: Text(isEdit ? 'Update' : 'Save'),
            ),
          ],
        ),
      ),
    );
  }
}
