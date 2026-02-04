import 'dart:io';
import 'package:flutter/material.dart';

import '../../controllers/product_controller.dart';
import '../../controllers/category_controller.dart';
import '../../data/models/product_model.dart';
import '../../data/models/category_model.dart';
import '../category/category_list_screen.dart';
import 'product_form_screen.dart';
import 'package:sqlite_storage_demmo/utils/confirm_dialog.dart';

class ProductListScreen extends StatefulWidget {
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController _productController = ProductController();
  final CategoryController _categoryController = CategoryController();

  List<Product> products = [];
  Map<int, String> categoryMap = {};

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    products = await _productController.getProducts();

    List<Category> categories = await _categoryController.getCategories();
    categoryMap.clear();

    for (Category c in categories) {
      categoryMap[c.id!] = c.name;
    }

    setState(() {});
  }

  Widget buildImageCell(String imagePath) {
    if (imagePath.isEmpty) {
      return Icon(Icons.image_not_supported, size: 40);
    }

    File file = File(imagePath);

    if (!file.existsSync()) {
      return Icon(Icons.broken_image, size: 40);
    }

    return Image.file(
      file,
      width: 60,
      height: 60,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.category),
            tooltip: 'Manage Category',
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CategoryListScreen()),
              );
              loadData();
            },
          ),
        ],
      ),
      body: products.isEmpty
          ? Center(child: Text('No Product Found'))
          : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Image')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Price')),
            DataColumn(label: Text('Category')),
            DataColumn(label: Text('Actions')),
          ],
          rows: products.map((product) {
            return DataRow(
              cells: [
                DataCell(Text(product.id.toString())),
                DataCell(buildImageCell(product.image)),
                DataCell(Text(product.name)),
                DataCell(Text(product.price.toString())),
                DataCell(
                  Text(categoryMap[product.categoryId] ?? 'Unknown'),
                ),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductFormScreen(
                                product: product,
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
                            title: 'Delete Product',
                            content: 'Are you sure you want to delete this product?',
                          );

                          if (confirmed) {
                            await _productController.deleteProduct(product.id!);
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
            MaterialPageRoute(builder: (_) => ProductFormScreen()),
          );
          loadData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
