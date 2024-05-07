class Products {
  final int id;
  final String title;
  final double price;
 final String description;

  Products({required this.id, required this.title, required this.price
  , required this.description});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(), 
      description: json['description'],
    );
  }
}