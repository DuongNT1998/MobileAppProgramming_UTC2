import 'package:flutter/material.dart';
import '../../controller/category_controller.dart';
import '../../controller/product_controller.dart';
import '../../data/model/category_model.dart';
import '../../data/model/product_model.dart';

class ProductFormScreen extends StatefulWidget {
  final ProductModel? product;

  const ProductFormScreen({super.key, this.product});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final ProductController productController = ProductController();
  final CategoryController categoryController = CategoryController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageLinkController = TextEditingController();

  String? selectedCategoryId;

  @override
  void initState() {
    super.initState();

    // Nếu là Edit thì đổ dữ liệu cũ lên form
    if (widget.product != null) {
      nameController.text = widget.product!.name;
      descriptionController.text = widget.product!.description;
      priceController.text = widget.product!.price.toString();
      imageLinkController.text = widget.product!.imageUrl;
      selectedCategoryId = widget.product!.categoryId;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.product != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Product' : 'Create Product')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// PRODUCT NAME
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              /// DESCRIPTION
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              /// PRICE
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              /// CATEGORY DROPDOWN
              StreamBuilder<List<CategoryModel>>(
                stream: categoryController.getCategories(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return DropdownButtonFormField<String>(
                    value: selectedCategoryId,
                    hint: const Text('Select Category'),
                    items: snapshot.data!.map((CategoryModel category) {
                      return DropdownMenuItem<String>(
                        value: category.id,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedCategoryId = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),

              /// IMAGE LINK
              TextField(
                controller: imageLinkController,
                decoration: const InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              /// PREVIEW IMAGE
              if (imageLinkController.text.isNotEmpty)
                Image.network(
                  imageLinkController.text,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Invalid image URL');
                  },
                ),

              const SizedBox(height: 24),

              /// SAVE / UPDATE BUTTON
              ElevatedButton(
                onPressed: () async {
                  if (isEdit) {
                    await productController.updateProduct(
                      id: widget.product!.id,
                      name: nameController.text,
                      description: descriptionController.text,
                      price: double.parse(priceController.text),
                      categoryId: selectedCategoryId!,
                      imageLink: imageLinkController.text,
                    );
                  } else {
                    await productController.addProduct(
                      name: nameController.text,
                      description: descriptionController.text,
                      price: double.parse(priceController.text),
                      categoryId: selectedCategoryId!,
                      imageLink: imageLinkController.text,
                    );
                  }

                  Navigator.pop(context);
                },
                child: Text(isEdit ? 'Update Product' : 'Save Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
