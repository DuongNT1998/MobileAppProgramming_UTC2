import '../model/category_model.dart';
import '../service/firebase_service.dart';

class CategoryRepository {
  Future<void> addCategory(CategoryModel category) async {
    await FirebaseService.getCategoryCollection().add(category.toMap());
  }

  Future<void> updateCategory(CategoryModel category) async {
    await FirebaseService.getCategoryCollection()
        .doc(category.id)
        .update(category.toMap());
  }

  Future<void> deleteCategory(String id) async {
    await FirebaseService.getCategoryCollection().doc(id).delete();
  }

  Stream<List<CategoryModel>> getCategories() {
    return FirebaseService.getCategoryCollection().snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return CategoryModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }
}
