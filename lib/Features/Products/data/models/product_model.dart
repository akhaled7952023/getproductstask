import '../../../../core/databases/api/end_points.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final double rating;
  final int ratingCount;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.ratingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ApiKey.id],
      title: json[ApiKey.title],
      price: json[ApiKey.price].toDouble(),
      description: json[ApiKey.description],
      image: json[ApiKey.image],
      rating: json[ApiKey.rating][ApiKey.rate].toDouble(),
      ratingCount: json[ApiKey.rating][ApiKey.count],
    );
  }
}
