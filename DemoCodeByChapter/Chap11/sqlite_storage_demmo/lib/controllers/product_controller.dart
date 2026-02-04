import '../data/models/product_model.dart';
import '../data/repository/product_repository.dart';

class ProductController {
  final ProductRepository _repository = ProductRepository();

  Future<List<Product>> getProducts() async {
    return await _repository.getAll();
  }

  Future<void> addProduct(Product product) async {
    await _repository.insert(product);
  }

  Future<void> updateProduct(Product product) async {
    await _repository.update(product);
  }

  Future<void> deleteProduct(int id) async {
    await _repository.delete(id);
  }
}
