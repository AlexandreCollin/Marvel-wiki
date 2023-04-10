class ComicPrice {
  ComicPrice({
    required this.type,
    required this.price,
  });

  final String type;
  final double price;

  factory ComicPrice.fromJson(Map<String, dynamic> json) {
    return ComicPrice(
      type: json['type'],
      price: double.parse(json['price'].toString()),
    );
  }
}
