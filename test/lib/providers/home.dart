import 'dart:convert';

import 'package:frontend_jm_alpaca/models/home.dart';
import 'package:frontend_jm_alpaca/models/login.dart';
import 'package:http/http.dart' as http;

class PaisesProvider {
  Future<List<PaisModel>> obtenerPaises() async {
    var url = Uri.parse("https://restcountries.com/v2/all?fields=translations");

    print("Dentro del provider (paises).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    List jsonResponse = jsonDecode(rawResponse);

    List<PaisModel> listaPaises = <PaisModel>[];

    for (int i = 0; i < jsonResponse.length; i++) {
      PaisModel pais =
          PaisModel.fromValues(jsonResponse[i]["translations"]["es"]);
      listaPaises.add(pais);
    }

    return listaPaises;
  }
}
