import 'dart:convert';
import 'package:app_videoplayerpitch/models/categories_response.dart';
import 'package:app_videoplayerpitch/services/endpoint.dart';
import 'package:app_videoplayerpitch/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///**Clase RouteListController.**
///
/// Controlador que gestiona la lógica de obtener rutas mediante una solicitud HTTP.
///
/// Utiliza [placa] para autenticación y filtrado de datos.
/// Proporciona el método [getRealTimeRoutes] para obtener la lista de rutas programadas y en curso.
/// En caso de una respuesta 200 el servidor retorna una lista de objetos [routes] y actualiza el provider [RouteListProvider].
///
/// **Parámetros:**
/// - [placa] Placa del vehículo.
///
class CategoryController {
  ///**Metodo getRealTimeRoutes.**
  ///
  /// Obtiene la lista de rutas según los parámetros proporcionados.
  ///
  /// Realiza una solicitud HTTP de tipo get a la URL [realTimeRoutes].
  /// Utiliza [token] para la autenticación y [placa] para filtrar las rutas.
  ///
  /// Devuelve una lista de objetos [routes] en caso de éxito y actualiza el gestor de estado [RouteListProvider].
  /// Lanza una excepción en caso de fallo en la conexión o cualquier error del servidor.

  Future<List<CategoriesModel>> getcategoriesPitch(
      {BuildContext? context}) async {
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
