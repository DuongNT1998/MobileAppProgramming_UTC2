class ProductModel {
  final String id;
  final String name;
  final String publisher;
  final double price;
  final List<String> images;
  final double rating;
  final int reviewCount;

  const ProductModel({
    required this.id,
    required this.name,
    required this.publisher,
    required this.price,
    required this.images,
    required this.rating,
    required this.reviewCount,
  });
}
