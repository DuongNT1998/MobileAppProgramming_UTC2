class WishlistManager {
  static final WishlistManager _instance = WishlistManager._internal();
  factory WishlistManager() => _instance;
  WishlistManager._internal();

  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  bool isFavorite(String id) {
    return _items.any((e) => e['id'] == id);
  }

  void toggle(Map<String, dynamic> product) {
    final index = _items.indexWhere((e) => e['id'] == product['id']);
    if (index >= 0) {
      _items.removeAt(index);
    } else {
      _items.add(product);
    }
  }
}
