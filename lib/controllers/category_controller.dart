import 'dart:convert';
import 'package:app_videoplayerpitch/models/categories_response.dart';
import 'package:app_videoplayerpitch/services/endpoint.dart';
import 'package:app_videoplayerpitch/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// **Clase CategoryController**
///
/// Controlador encargado de gestionar la lógica para obtener las categorías mediante una solicitud HTTP.
///
/// Proporciona el método [getCategoriesPitch] que realiza la solicitud HTTP para obtener la lista de categorías.
/// En caso de una respuesta exitosa (código 200), se devuelve una lista de objetos [CategoriesModel] y se actualiza el gestor de estado correspondiente.
/// Si ocurre un error en la solicitud, se maneja adecuadamente y se lanza una excepción.
///
/// **Parámetros:**
/// - [context] (opcional) Contexto de la aplicación para mostrar diálogos de progreso y errores.
///
class CategoryController {
  /// **Método getCategoriesPitch**
  ///
  /// Obtiene la lista de categorías desde el servidor.
  ///
  /// Realiza una solicitud HTTP de tipo GET a la URL [categoryData].
  /// Utiliza el contexto [context] para mostrar un diálogo de progreso mientras se procesa la solicitud.
  ///
  /// **Retorna:**
  /// - Una lista de objetos [CategoriesModel] en caso de éxito.
  /// - Una lista vacía si la respuesta no es exitosa.
  ///
  /// **Manejo de Errores:**
  /// - Muestra un diálogo de error si la solicitud falla.
  /// - Lanza una excepción si ocurre un problema de conexión o cualquier otro error durante la ejecución.
  ///
  Future<List<CategoriesModel>> getCategoriesPitch({BuildContext? context}) async {
    try {
      if (context != null) {
        // ignore: use_build_context_synchronously
        ProgressDialog.show(context);
      }
      
      final response = await http.get(Uri.parse(categoryData));

      if (response.statusCode == 200) {
        final dataJson = json.decode(response.body);
        final List<dynamic> categoriesJson = dataJson['data'];
        final List<CategoriesModel> categories = categoriesJson
            .map<CategoriesModel>((json) => CategoriesModel.fromJsonMap(json))
            .toList();
         
        return categories;
      } else {
        if (context != null) {
          // ignore: use_build_context_synchronously
          dialogError(context: context);
        }
        return [];
      }
    } catch (e) {
      if (context != null) {
        // ignore: use_build_context_synchronously
        ProgressDialog.dissmiss(context);
      }
      throw Exception("Fallo la Conexión: $e");
    }
  }
}