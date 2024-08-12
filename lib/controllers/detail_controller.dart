import 'dart:convert';
import 'package:app_videoplayerpitch/models/details_response.dart';
import 'package:app_videoplayerpitch/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsController {

  Future<List<DatumResponse>> getDetailsPitch(
      {BuildContext? context, required String route}) async {
    try {
    
      final response = await http.get(Uri.parse(route));

      
      if (response.statusCode == 200) {
        final dataJson = json.decode(response.body);
        final List<dynamic> detailJson = dataJson['data'];
       /* final List<DetailsModel> details = detailJson
            .map<DetailsModel>((json) => DetailsModel.fromJson(json))
            .toList();*/
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
      if (context != null) {
      
      }
      throw Exception("Fallo la Conexión: $e");
    }
  }
}
