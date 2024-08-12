/// **Clase CategoriesModel**
///
/// Modelo de datos que representa una categoría dentro de la aplicación.
///
/// Contiene información relevante sobre una categoría, como su título, clave, URL, tipo, imagen y otros detalles opcionales.
///
/// **Propiedades:**
/// - [title]: Título de la categoría.
/// - [key]: Clave única que identifica la categoría.
/// - [url]: URL asociada a la categoría.
/// - [type]: Tipo de categoría.
/// - [image]: URL de la imagen asociada a la categoría.
/// - [count]: (opcional) Cantidad de elementos o subcategorías dentro de esta categoría.
/// - [categoryType]: (opcional) Tipo específico de categoría, si está disponible.
///
class CategoriesModel {
  final String title;
  final String key;
  final String url;
  final String type;
  final String image;
  final String? count;
  final String? categoryType;

  CategoriesModel({
    required this.title,
    required this.key,
    required this.url,
    required this.type,
    required this.image,
    this.count,
    this.categoryType,
  });

  /// **Constructor Factory fromJsonMap**
  ///
  /// Crea una instancia de [CategoriesModel] a partir de un mapa JSON.
  ///
  /// **Parámetros:**
  /// - [json]: Mapa que contiene los datos JSON para inicializar una instancia de [CategoriesModel].
  ///
  /// **Retorna:**
  /// - Una instancia de [CategoriesModel] con los datos proporcionados en el mapa JSON.
  ///
  factory CategoriesModel.fromJsonMap(Map<String, dynamic> json) {
    return CategoriesModel(
      title: json['title'] ?? '',
      key: json['key'] ?? '',
      url: json['url'] ?? '',
      type: json['type'] ?? '',
      image: json['image'] ?? '',
      count: json['count'],
      categoryType: json['category_type'],
    );
  }
}
