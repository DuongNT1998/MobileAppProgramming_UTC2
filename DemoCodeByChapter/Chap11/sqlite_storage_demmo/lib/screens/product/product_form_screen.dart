import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/product_controller.dart';
import '../../controllers/category_controller.dart';
import '../../data/models/product_model.dart';
import '../../data/models/category_model.dart';

class ProductFormScreen extends StatefulWidget {
  final Product? product;

  ProductFormScreen({this.product});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final ProductController _productController = ProductController();
  final CategoryController _categoryController = CategoryController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  List<Category> categories = [];
  int? selectedCategoryId;
  String imagePath = '';

  @override
  void initState() {
    super.initState();
    loadCategories();

    if (widget.product != null) {
      nameController.text = widget.product!.name;
      descController.text = widget.product!.description;
      priceController.text = widget.product!.price.toString();
      selectedCategoryId = widget.product!.categoryId;
      imagePath = widget.product!.image;
    }
  }

  Future<void> loadCategories() async {
    categories = await _categoryController.getCategories();
    setState(() {});
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }

  Future<void> saveProduct() async {
    Product product = Product(
      id: widget.product?.id,
      name: nameController.text,
      description: descController.text,
      price: double.parse(priceController.text),
      image: imagePath,
      categoryId: selectedCategoryId!,
    );

    if (widget.product == null) {
      await _productController.addProduct(product);
    } else {
      await _productController.updateProduct(product);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: descController, decoration: InputDecoration(labelText: 'Description')),
            TextField(controller: priceController, decoration: InputDecoration(labelText: 'Price'), keyboardType: TextInputType.number),

            DropdownButtonFormField<int>(
              value: selectedCategoryId,
              items: categories.map((category) {
                return DropdownMenuItem<int>(
                  value: category.id,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategoryId = value;
                });
              },
              decoration: InputDecoration(labelText: 'Category'),
            ),

            SizedBox(height: 10),

            imagePath.isNotEmpty
                ? Image.file(File(imagePath), height: 120)
                : Text('No Image Selected'),

            ElevatedButton(
              onPressed: pickImage,
              child: Text('Pick Image'),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveProduct,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
