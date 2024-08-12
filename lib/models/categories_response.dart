class CategoriesModel {
  final String title;
  final String key;
  final String url;
  final String type;
  final String image;
  final String? count; // Ajustado para manejar valores nulos
  final String? categoryType; // Ajustado para manejar valores nulos

  CategoriesModel({
    required this.title,
    required this.key,
    required this.url,
    required this.type,
    required this.image,
    this.count,
    this.categoryType,
  });

  factory CategoriesModel.fromJsonMap(Map<String, dynamic> json) {
    return CategoriesModel(
      title: json['title'] ?? '',
      key: json['key'] ?? '',
      url: json['url'] ?? '',
      type: json['type'] ?? '',
      image: json['image'] ?? '',
      count: json['count'], // Puede ser null
      categoryType: json['category_type'], // Puede ser null
    );
  }
}

