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

class mVenta {
  String id = "";
  String cliente = "";
  String vendedor = "";
  String transporte = "";
  String nfactura = "";
  String fechaFactura = "";
  String fechaVenta = "";
  String producto = "";
  String tipoDescuento = "";
  double cantidad = 0;
  double peso = 0;
  double descuento = 0;
  double precio = 0;
  double subtotal = 0;
  bool guardado = false;

  mVenta.fromValues(
      String id,
      String cliente,
      String vendedor,
      String transporte,
      String nfactura,
      String fechaFactura,
      String fechaVenta,
      String producto,
      String tipoDescuento,
      double cantidad,
      double peso,
      double descuento,
      double precio,
      double subtotal,
      bool guardado) {
    this.id = id;
    this.cliente = cliente;
    this.vendedor = vendedor;
    this.transporte = transporte;
    this.nfactura = nfactura;
    this.fechaFactura = fechaFactura;
    this.fechaVenta = fechaVenta;
    this.producto = producto;
    this.tipoDescuento = tipoDescuento;
    this.cantidad = cantidad;
    this.peso = peso;
    this.descuento = descuento;
    this.precio = precio;
    this.subtotal = subtotal;
    this.guardado = guardado;
  }
}

class VentaTotal {
  String id = "";
  String cliente = "";
  String vendedor = "";
  String factura = "";
  double total = 0;
  String fecha = "";

  VentaTotal.fromValues(String id, String cliente, String vendedor,
      String factura, double total, String fecha) {
    this.id = id;
    this.cliente = cliente;
    this.vendedor = vendedor;
    this.factura = factura;
    this.total = total;
    this.fecha = fecha;
  }
}
