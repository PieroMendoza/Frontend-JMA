import 'dart:convert';

class CreateVentaResponse {
  VentaModel venta = VentaModel.fromValues(
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  );
  CreateVentaResponse.fromAPI(Map jsonVentaResponse) {
    VentaModel vm = VentaModel(jsonVentaResponse["savedVenta"]);
    venta = vm;
  }
}

//Models

class VentaModel {
  String id = "";
  String nombres = "";
  String apellidos = "";
  String pais = "";
  String dni = "";
  String departamento = "";
  String provincia = "";
  String tipoCalle = "";
  String nombreCalle = "";
  String celular = "";
  String fecha = "";
  String usuarioId = "";

  VentaModel(Map jsonVentaResponse) {
    this.id = jsonVentaResponse["_id"];
    this.nombres = jsonVentaResponse["nombres"];
    this.apellidos = jsonVentaResponse["apellidos"];
    this.pais = jsonVentaResponse["pais"];
    this.dni = jsonVentaResponse["dni"];
    this.departamento = jsonVentaResponse["departamento"];
    this.provincia = jsonVentaResponse["provincia"];
    this.tipoCalle = jsonVentaResponse["tipoCalle"];
    this.nombreCalle = jsonVentaResponse["nombreCalle"];
    this.celular = jsonVentaResponse["celular"];
    this.fecha = jsonVentaResponse["fecha"];
    this.usuarioId = jsonVentaResponse["usuarioId"];
  }

  VentaModel.fromValues(
      String id,
      String nombres,
      String apellidos,
      String pais,
      String dni,
      String departamento,
      String provincia,
      String tipoCalle,
      String nombreCalle,
      String celular,
      String fecha,
      String usuarioId) {
    this.nombres = nombres;
    this.apellidos = apellidos;
    this.pais = pais;
    this.dni = dni;
    this.departamento = departamento;
    this.provincia = provincia;
    this.tipoCalle = tipoCalle;
    this.nombreCalle = nombreCalle;
    this.celular = celular;
    this.fecha = fecha;
    this.usuarioId = usuarioId;
  }
}
