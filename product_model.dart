class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String category; // Add category

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category, // Add category
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String imageUrl = '';
    if (json['images'] is List && (json['images'] as List).isNotEmpty) {
      imageUrl = json['images'][0];
    } else if (json['image'] is String) {
      imageUrl = json['image'];
    }

    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      image: imageUrl,
      category: json['category']?['name'] ?? '', // Safely access category
    );
  }
}
