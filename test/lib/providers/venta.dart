import 'dart:convert';

import 'package:frontend_jm_alpaca/models/login.dart';
import 'package:frontend_jm_alpaca/models/venta.dart';
import 'package:http/http.dart' as http;

class VentaProvider {
  Future<CreateVentaResponse> createVenta(VentaModel venta) async {
    var url = Uri.parse("http://10.0.2.2:8284/api/venta/create");

    print("Dentro del provider (venta).");

    var responseHttp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "nombres": venta.nombres,
          "apellidos": venta.apellidos,
          "pais": venta.pais,
          "dni": venta.dni,
          "departamento": venta.departamento,
          "provincia": venta.provincia,
          "tipoCalle": venta.tipoCalle,
          "nombreCalle": venta.nombreCalle,
          "celular": venta.celular,
          "fecha": venta.fecha,
          "usuarioId": venta.usuarioId
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    CreateVentaResponse compraResponse =
        CreateVentaResponse.fromAPI(jsonResponse);

    return compraResponse;
  }
}
