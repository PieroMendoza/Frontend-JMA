import 'package:flutter/material.dart';
import 'package:frontend_jm_alpaca/models/venta.dart';

import '../commondrawer.dart';
import 'package:frontend_jm_alpaca/globals.dart' as globals;

class DetalleVentas extends StatefulWidget {
  static String ruta = "/detalleVentas";

  @override
  State<StatefulWidget> createState() {
    return _DetalleVentas();
  }
}

class _DetalleVentas extends State<DetalleVentas> {
  double totalPeso = 0;
  double totalCantidad = 0;
  double totalDescuento = 0;
  double totalSubtotal = 0;

  double precio = 0;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Ventas"),
      ),
      drawer: CommonDrawer.obtenerDrawer(context),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildColumnaFija(),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: todo(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildFijaTop() {
    List<Widget> list = <Widget>[];

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Vendedor"),
    ));

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Factura"),
    ));

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Total"),
    ));

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Fecha"),
    ));

    return list;
  }

  List<Widget> todo() {
    List<Widget> rows = <Widget>[];
    List<Widget> top = <Widget>[];

    top = buildFijaTop();

    rows.add(Row(
      children: top,
    ));

    totalPeso = 0;
    totalDescuento = 0;
    totalCantidad = 0;
    totalSubtotal = 0;

    for (int i = 0; i < globals.listaVentasTotales.length; i++) {
      rows.add(Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.grey[700],
            margin: EdgeInsets.all(4.0),
            child: Text("${globals.listaVentasTotales[i].vendedor}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.grey[700],
            margin: EdgeInsets.all(4.0),
            child: Text("${globals.listaVentasTotales[i].factura}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.grey[700],
            margin: EdgeInsets.all(4.0),
            child: Text("${globals.listaVentasTotales[i].total}"),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            color: Colors.grey[700],
            margin: EdgeInsets.all(4.0),
            child: Text("${globals.listaVentasTotales[i].fecha}"),
          )
        ],
      ));
      totalSubtotal = totalSubtotal + globals.listaVentasTotales[i].total;
    }

    rows.add(Row(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.grey[700],
          margin: EdgeInsets.all(4.0),
          child: Text("Vendedor"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.grey[700],
          margin: EdgeInsets.all(4.0),
          child: Text("Factura"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.grey[700],
          margin: EdgeInsets.all(4.0),
          child: Text("$totalSubtotal"),
        ),
        Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.grey[700],
          margin: EdgeInsets.all(4.0),
          child: Text("Fecha"),
        )
      ],
    ));

    return rows;
  }

  List<Widget> buildColumnaFija() {
    List<Widget> list = <Widget>[];

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Cliente"),
    ));

    var listx = List.generate(
        globals.listaVentas.length,
        (index) => Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              color: Colors.grey[700],
              margin: EdgeInsets.all(4.0),
              child: Text(globals.listaVentasTotales[index].cliente),
            ));

    for (int i = 0; i < listx.length; i++) {
      list.add(listx[i]);
    }

    list.add(Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.grey[700],
      margin: EdgeInsets.all(4.0),
      child: Text("Total"),
    ));

    return list;
  }

  List<Widget> _buildCells(int count) {
    return List.generate(
      count,
      (index) => Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 60.0,
        color: Colors.grey[700],
        margin: EdgeInsets.all(4.0),
        child: Text("${index + 1}", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  List<Widget> _buildRows(int count) {
    return List.generate(
      count,
      (index) => Row(
        children: _buildCells(10),
      ),
    );
  }

  Future<void> _showMyDialog(mVenta venta, String nombreProducto) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registrar Precio de $nombreProducto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(49, 39, 79, 1), width: 2.0),
                      ),
                      labelText: 'Precio',
                      hintText: "Precio",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onSaved: (value) {
                      precio = double.parse(value!);
                      print(precio);
                    },
                    onChanged: (text) {
                      precio = double.parse(text);
                      print(text);
                    })
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Guardar'),
              onPressed: () {
                guardarPrecio(venta, precio);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future obtenerDetallesCompra() async {
    setState(() {
      globals.listaVentas = globals.listaVentas;
    });
  }

  Future guardarPrecio(mVenta venta, double precio) async {
    venta.precio = double.parse((precio).toStringAsFixed(2));
    venta.subtotal =
        double.parse((venta.peso * venta.precio).toStringAsFixed(2));
    obtenerDetallesCompra();
  }

  guardarVenta() {
    VentaTotal ventaTotal = VentaTotal.fromValues(
        (globals.listaVentasTotales.length + 1).toString(),
        globals.listaVentas[globals.listaVentasTotales.length - 1].cliente,
        globals.listaVentas[globals.listaVentasTotales.length - 1].vendedor,
        globals.listaVentas[globals.listaVentasTotales.length - 1].nfactura,
        totalSubtotal,
        globals.listaVentas[globals.listaVentasTotales.length - 1].fechaVenta);

    globals.listaVentasTotales.add(ventaTotal);
  }
}
