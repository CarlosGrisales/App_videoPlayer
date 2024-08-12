import 'dart:convert';
import 'package:app_videoplayerpitch/models/details_response.dart';
import 'package:app_videoplayerpitch/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// **Clase DetailsController**
///
/// Controlador responsable de gestionar la lógica para obtener los detalles de un pitch mediante una solicitud HTTP.
///
/// Proporciona el método [getDetailsPitch] que realiza la solicitud HTTP para obtener la lista de detalles.
/// En caso de una respuesta exitosa (código 200), se devuelve una lista de objetos [DatumResponse].
/// Si ocurre un error durante la solicitud, se maneja adecuadamente y se lanza una excepción.
///
/// **Parámetros:**
/// - [context] (opcional) Contexto de la aplicación para mostrar diálogos de error.
/// - [route] Ruta del servidor desde donde se obtienen los detalles del pitch.
class DetailsController {

  /// **Método getDetailsPitch**
  ///
  /// Obtiene la lista de detalles desde el servidor según la ruta proporcionada.
  ///
  /// Realiza una solicitud HTTP de tipo GET a la URL especificada en [route].
  ///
  /// **Parámetros:**
  /// - [context] (opcional) Contexto de la aplicación para mostrar un diálogo de error si la solicitud falla.
  /// - [route] Ruta del servidor desde donde se obtienen los detalles del pitch.
  ///
  /// **Retorna:**
  /// - Una lista de objetos [DatumResponse] en caso de éxito.
  /// - Una lista vacía si la respuesta no es exitosa.
  ///
  /// **Manejo de Errores:**
  /// - Muestra un diálogo de error si la solicitud falla y [context] no es nulo.
  /// - Lanza una excepción si ocurre un problema de conexión o cualquier otro error durante la ejecución.
  ///
  Future<List<DatumResponse>> getDetailsPitch(
      {BuildContext? context, required String route}) async {
    try {
      final response = await http.get(Uri.parse(route));

      if (response.statusCode == 200) {
        final dataJson = json.decode(response.body);
        final List<dynamic> detailJson = dataJson['data'];
        
        final List<DatumResponse> infoDetails = detailJson
            .map<DatumResponse>((json) => DatumResponse.fromJson(json))
            .toList();
         
        return infoDetails;
      } else {
        if (context != null) {
          // ignore: use_build_context_synchronously
          dialogError(context: context);
        }
        return [];
      }
    } catch (e) {
      throw Exception("Fallo la Conexión: $e");
    }
  }
}
