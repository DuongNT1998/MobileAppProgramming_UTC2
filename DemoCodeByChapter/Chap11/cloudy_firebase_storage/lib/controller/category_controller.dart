import '../data/model/category_model.dart';
import '../data/repository/category_repository.dart';

class CategoryController {
  final CategoryRepository repository = CategoryRepository();

  Stream<List<CategoryModel>> getCategories() {
    return repository.getCategories();
  }

  Future<void> saveCategory(String name) async {
    CategoryModel category = CategoryModel(id: '', name: name);

    await repository.addCategory(category);
  }

  Future<void> updateCategory(String id, String name) async {
    CategoryModel category = CategoryModel(id: id, name: name);

    await repository.updateCategory(category);
  }

  Future<void> deleteCategory(String id) async {
    await repository.deleteCategory(id);
  }
}
