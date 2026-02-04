import '../model/product_model.dart';
import '../service/firebase_service.dart';

class ProductRepository {
  Future<void> addProduct(ProductModel product) async {
    await FirebaseService.getProductCollection().add(product.toMap());
  }

  Future<void> updateProduct(ProductModel product) async {
    await FirebaseService.getProductCollection()
        .doc(product.id)
        .update(product.toMap());
  }

  Future<void> deleteProduct(String id) async {
    await FirebaseService.getProductCollection().doc(id).delete();
  }

  Stream<List<ProductModel>> getProducts() {
    return FirebaseService.getProductCollection().snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
