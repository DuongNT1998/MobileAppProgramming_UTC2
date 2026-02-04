import '../data/model/product_model.dart';
import '../data/repository/product_repository.dart';

class ProductController {
  final ProductRepository repository = ProductRepository();

  Stream<List<ProductModel>> getProducts() {
    return repository.getProducts();
  }

  Future<void> addProduct({
    required String name,
    required String description,
    required double price,
    required String categoryId,
    required String imageLink,
  }) async {
    ProductModel product = ProductModel(
      id: '',
      name: name,
      description: description,
      price: price,
      categoryId: categoryId,
      imageUrl: imageLink,
    );

    await repository.addProduct(product);
  }

  Future<void> updateProduct({
    required String id,
    required String name,
    required String description,
    required double price,
    required String categoryId,
    required String imageLink,
  }) async {
    ProductModel product = ProductModel(
      id: id,
      name: name,
      description: description,
      price: price,
      categoryId: categoryId,
      imageUrl: imageLink,
    );

    await repository.updateProduct(product);
  }

  Future<void> deleteProduct(String id) async {
    await repository.deleteProduct(id);
  }
}
