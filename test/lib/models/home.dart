import 'dart:convert';

class PaisesResponse {
  List<PaisModel> paisesList = <PaisModel>[];

  PaisesResponse.fromAPI(Map jsonPaisesResponse) {
    for (int i = 0; i < jsonPaisesResponse.length; i++) {
      PaisModel pais = PaisModel(jsonPaisesResponse[i]["translations"]["es"]);
      paisesList.add(pais);
    }
  }
}

//Models

class PaisModel {
  String nombre = "";

  PaisModel(Map jsonProveedorResponse) {
    this.nombre = jsonProveedorResponse["es"];
  }

  PaisModel.fromValues(String nombre) {
    this.nombre = nombre;
  }
}
