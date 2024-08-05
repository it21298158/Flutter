// product_model.dart
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.brand,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      brand: json['brand'],
      images: List<String>.from(json['images'] ?? []),
    );
  }
}
