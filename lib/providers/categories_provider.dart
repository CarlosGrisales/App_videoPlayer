import 'package:app_videoplayerpitch/controllers/category_controller.dart';
import 'package:app_videoplayerpitch/models/categories_response.dart';
import 'package:flutter/material.dart';

/// **Clase CategoriesProvider**
///
/// Este `Provider` se encarga de manejar el flujo de las categorías disponibles y la lógica de la vista asociada.
///
/// **Propiedades:**
/// - [listCategories]: Lista de todas las categorías obtenidas.
/// - [_data]: Lista de categorías que se muestran en la interfaz y se utilizan para la gestión de filtros.
/// - [_isValid]: Booleano que indica si hay una categoría seleccionada.
///
/// **Métodos:**
/// - [getCategory]: Obtiene las categorías disponibles desde el controlador y actualiza las listas de categorías.
/// - [isValid]: Getter y Setter para la validez del estado.
/// - [data]: Getter y Setter para la lista de categorías que se muestra.
///
/// **Ejemplo de uso:**
/// ```dart
/// final categoriesProvider = CategoriesProvider();
/// categoriesProvider.getCategory();
/// ```
///
class CategoriesProvider with ChangeNotifier {

  /// **Lista de Categorías**
  ///
  /// Variable que almacena la lista completa de categorías obtenidas desde el controlador.
  ///
  List<CategoriesModel> listCategories = [];
  
  /// **Datos de Categorías**
  ///
  /// Variable que almacena la lista de categorías que se muestran en la interfaz y se utilizan para el manejo de filtros.
  ///
  List<CategoriesModel> _data = [];
  
  /// **Validez**
  ///
  /// Variable booleana que indica si hay una categoría seleccionada o no.
  ///
  bool _isValid = false;

  /// **Método getCategory**
  ///
  /// Llama al método [CategoryController().getCategoriesPitch()] para obtener la lista de categorías disponibles.
  /// Actualiza la lista de categorías y los datos utilizados en la interfaz.
  ///
  /// **Retorna:**
  /// - Un [Future] que completa cuando la obtención de categorías y la actualización de datos han terminado.
  ///
  Future getCategory() async {
    final response = await CategoryController().getCategoriesPitch();
    listCategories = response;
    data = listCategories;
    print(data.length);
    ChangeNotifier();
  }
  
  /// **Getter isValid**
  ///
  /// Retorna el estado actual de la validez.
  ///
  /// **Retorna:**
  /// - Un [bool] que indica si una categoría está seleccionada.
  ///
  bool get isValid {
    return _isValid;
  }

  /// **Setter isValid**
  ///
  /// Establece el estado de la validez y notifica a los escuchadores.
  ///
  /// **Parámetros:**
  /// - [isvalid]: Valor booleano que indica si una categoría está seleccionada.
  ///
  set isValid(bool isvalid){
    this._isValid = isvalid;
    notifyListeners();
  }

  /// **Getter data**
  ///
  /// Retorna la lista de categorías que se muestra en la interfaz y se utiliza para la gestión de filtros.
  ///
  /// **Retorna:**
  /// - Una lista de [CategoriesModel] que representa las categorías mostradas.
  ///
  List<CategoriesModel> get data {
    return _data;
  }
  
  /// **Setter data**
  ///
  /// Establece la lista de categorías mostradas y notifica a los escuchadores.
  ///
  /// **Parámetros:**
  /// - [list]: Lista de categorías que se actualizará en la interfaz.
  ///
  set data(List<CategoriesModel> list) {
    this._data = list;
    notifyListeners();
  }
}
