class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;

  Product({required this.id, required this.title, required this.price, required this.description, required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      imageUrl: (json['images'] as List).isNotEmpty 
          ? json['images'][0].toString().replaceAll('["', '').replaceAll('"]', '') 
          : 'https://via.placeholder.com/150',
    );
  }
}