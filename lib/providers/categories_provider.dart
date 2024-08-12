
import 'package:app_videoplayerpitch/controllers/category_controller.dart';
import 'package:app_videoplayerpitch/models/categories_response.dart';
import 'package:flutter/material.dart';


///**Provider DepositProvider**
//Este Provider se encarga de manejar el flujo de las bodegas disponibles y la logica de la vista SelectDepositView.

class CategoriesProvider with ChangeNotifier {

  /// -[listCategories] Variable que almacena la lista de depositos.
  List<CategoriesModel> listCategories = [];
  /// -[_data] Variable que almacena la lista de depositos de la parte visual y manejo de filtros.
  List<CategoriesModel> _data = [];
  /// -[_isValid] Variable para validar el flujo si hay un deposito seleccionado.
  bool _isValid = false;


  ///Método getDeposit()
  ///Esta funcion llama al metodo getDepositsController que retorna las bodegas que se encuentran registradas.
  Future getCategory() async {
    final response = await CategoryController().getcategoriesPitch();
    listCategories = response;
    data = listCategories;
    print(data.length);
    ChangeNotifier();
  }
  
  ///Metodos Set y Get del provider 
  bool get isValid {
    return _isValid;
  }

  set isValid(bool isvalid){
    this._isValid = isvalid;
    notifyListeners();
  }

  List<CategoriesModel> get data {
    return _data;
  }
  
  set data(List<CategoriesModel> list) {
    this._data = list;
    notifyListeners();
  }


}