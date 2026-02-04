import 'package:flutter/material.dart';
import '../../controller/product_controller.dart';
import '../../data/model/product_model.dart';
import 'product_form_screen.dart';
import '../../utils/confirm_dialog.dart';
import '../../controller/category_controller.dart';
import '../../data/model/category_model.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final ProductController controller = ProductController();
  final CategoryController categoryController = CategoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Management')),

      // NÚT ADD
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: StreamBuilder<List<CategoryModel>>(
        stream: categoryController.getCategories(),
        builder: (context, categorySnapshot) {
          if (!categorySnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Tạo map: categoryId -> categoryName
          final Map<String, String> categoryMap = {
            for (var category in categorySnapshot.data!)
              category.id: category.name,
          };

          return StreamBuilder<List<ProductModel>>(
            stream: controller.getProducts(),
            builder: (context, productSnapshot) {
              if (!productSnapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              List<ProductModel> products = productSnapshot.data!;

              return Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 30,
                      columns: const [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Description')),
                        DataColumn(label: Text('Price')),
                        DataColumn(label: Text('Category')),
                        DataColumn(label: Text('Image')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: products.map((product) {
                        return DataRow(
                          cells: [
                            DataCell(
                              SizedBox(width: 150, child: Text(product.name)),
                            ),
                            DataCell(
                              SizedBox(
                                width: 250,
                                child: Text(
                                  product.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            DataCell(Text(product.price.toString())),

                            /// ✅ CATEGORY NAME (THAY ID)
                            DataCell(
                              Text(
                                categoryMap[product.categoryId] ?? 'Unknown',
                              ),
                            ),

                            /// IMAGE FROM LINK
                            DataCell(
                              product.imageUrl.isNotEmpty
                                  ? Image.network(
                                      product.imageUrl,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return const Text('Invalid Image');
                                          },
                                    )
                                  : const Text('No Image'),
                            ),

                            /// ACTIONS
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductFormScreen(
                                                product: product,
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      bool confirm =
                                          await showDeleteConfirmDialog(
                                            context,
                                          );
                                      if (confirm) {
                                        await controller.deleteProduct(
                                          product.id,
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
          );
        },
      ),
    );
  }
}
