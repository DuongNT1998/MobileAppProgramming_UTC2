class CategoryModel {
  String id;
  String name;

  CategoryModel({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory CategoryModel.fromMap(String id, Map<String, dynamic> map) {
    return CategoryModel(id: id, name: map['name']);
  }
}
